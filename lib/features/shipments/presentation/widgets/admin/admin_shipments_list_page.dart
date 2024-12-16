import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/shimmer/shimmer_widget.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';
import 'package:saayer/features/shipments/presentation/widgets/admin/admin_shipment_item_widget_helper.dart';
import 'package:saayer/features/shipments/presentation/widgets/admin/admin_shipments_filters_widget.dart';
import 'package:saayer/features/shipments/presentation/widgets/empty_shipments.dart';
import "package:universal_html/html.dart" as html;

class AdminShipmentsListPage extends StatefulWidget {
  final ScrollController scrollController;
  final ShipmentsBloc shipmentsBloc;

  const AdminShipmentsListPage({
    super.key,
    required this.scrollController,
    required this.shipmentsBloc,
  });

  @override
  State<AdminShipmentsListPage> createState() => _AdminShipmentsListPageState();
}

class _AdminShipmentsListPageState extends State<AdminShipmentsListPage> {
  late StreamSubscription progressStream;

  @override
  initState() {
    widget.scrollController.addListener(() => widget.shipmentsBloc.add(const OnScrollPagination()));
    FlDownloader.initialize();
    progressStream = FlDownloader.progressStream.listen((event) {
      if (event.status == DownloadStatus.successful) {
        debugPrint('event.progress: ${event.progress}');
        // This is a way of auto-opening downloaded file right after a download is completed
        FlDownloader.openFile(filePath: event.filePath);
        LoadingDialog.setIsLoading(context, false);
      } else if (event.status == DownloadStatus.running) {
        LoadingDialog.setIsLoading(context, true);
        debugPrint('event.progress: ${event.progress}');
      } else if (event.status == DownloadStatus.failed) {
        debugPrint('event: $event');
      } else if (event.status == DownloadStatus.paused) {
        debugPrint('Download paused');

        // Here I am attaching the download progress to the download task again
        // after an paused status because the download task can be paused by
        // the system when the connection is lost or is waiting for a wifi
        // connection see https://developer.android.com/reference/android/app/DownloadManager#PAUSED_QUEUED_FOR_WIFI
        // for the possible reasons of a download task to be auto-paused by the
        // system (this applies to Windows too as the plugin sets the same suspension
        // policies for Windows downloads).
        Future.delayed(
          const Duration(milliseconds: 250),
          () => FlDownloader.attachDownloadProgress(event.downloadId),
        );
      } else if (event.status == DownloadStatus.pending) {
        debugPrint('Download pending');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ShipmentsBloc shipmentsBloc = BlocProvider.of<ShipmentsBloc>(context);

    return BlocConsumer<ShipmentsBloc, ShipmentsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            shipmentsBloc.add(RefreshShipments());
          },
          color: SaayerTheme().getColorsPalette.primaryColor,
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              if (!shipmentsBloc.state.isFromHome)
                AdminShipmentsFiltersWidget(
                  shipmentsBloc: shipmentsBloc,
                ),
              const SizedBox(
                height: 10,
              ),
              shipmentsBloc.state.adminShipmentsList == null
                  ? const Expanded(child: ShimmerWidget())
                  : _buildShipmentsListWidget(shipmentsBloc.state.isFromHome, shipmentsBloc),
            ],
          ),
        );
      },
    );
  }

  _buildShipmentsListWidget(
    bool isFromHome,
    ShipmentsBloc shipmentsBloc,
  ) {
    if (shipmentsBloc.state.adminShipmentsList!.isEmpty) {
      return const Expanded(
          child: EmptyShipments(
        shipmentsType: ShipmentsListTypes.EXPORT,
        hasButton: false,
        isAdminShipments: true,
      ));
    }
    return Expanded(
      child: SingleChildScrollView(
        controller: shipmentsBloc.adminShipmentsScrollController,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: shipmentsBloc.state.adminShipmentsList?.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final ShipmentGetDtoExtended shipmentEntity = shipmentsBloc.state.adminShipmentsList![index];
              final bool isLast = (index == shipmentsBloc.state.adminShipmentsList!.length - 1);
              Widget shipmentWidget;
              shipmentWidget = AdminShipmentItemWidgetHelper().getAdminShipmentWidget(
                  adminShipmentDto: shipmentEntity,
                  isFromHome: isFromHome,
                  hasLabelUrl: ((shipmentEntity.labelURL ?? '').isNotEmpty),
                  onTapDownloadShipment: () {
                    ///
                    if ((shipmentEntity.labelURL ?? '').isEmpty) {
                      SaayerToast().showSuccessToast(msg: "label_not_available_msg".tr());
                    } else {
                      downloadPdfFile(shipmentEntity.labelURL ?? '', shipmentEntity.shipmentId);
                    }
                  });
              return Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        getIt<NavigationService>().navigateToNamed(
                          Routes.shipmentDetailsNamedPage,
                          arguments: {
                            'shipmentDto': ShipmentGetDto(),
                            'adminShipmentDto': shipmentEntity,
                          },
                        );
                      },
                      child: shipmentWidget),
                  if (isLast)
                    const SizedBox(
                      height: 50,
                    )
                ],
              );
            }),
      ),
    );
  }

  void downloadPdfFile(String url, int? shipmentId) async {
    if (kIsWeb) {
      html.AnchorElement anchorElement = html.AnchorElement(href: url);
      anchorElement.download = url;
      anchorElement.click();
    } else {
      final permission = await FlDownloader.requestPermission();
      if (permission == StoragePermissionStatus.granted) {
        await FlDownloader.download(
          url,
          fileName: 'Saayer-Shipment-$shipmentId.pdf',
        );
      } else {
        debugPrint('Permission denied =(');
      }
    }
  }
}
