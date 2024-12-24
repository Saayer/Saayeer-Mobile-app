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
import 'package:saayer/features/shipments/presentation/widgets/empty_shipments.dart';
import 'package:saayer/features/shipments/presentation/widgets/shipments_filters_widget.dart';
import 'package:saayer/features/shipments/presentation/widgets/shipment_item_widget_helper.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';
import "package:universal_html/html.dart" as html;

class ShipmentsListView extends StatefulWidget {
  final List<ShipmentGetDto>? shipmentsList;
  final ShipmentsListTypes shipmentsListType;
  final ScrollController scrollController;
  final ShipmentsBloc shipmentsBloc;

  const ShipmentsListView({
    super.key,
    required this.shipmentsList,
    required this.shipmentsListType,
    required this.scrollController,
    required this.shipmentsBloc,
  });

  @override
  State<ShipmentsListView> createState() => _ShipmentsListViewState();
}

class _ShipmentsListViewState extends State<ShipmentsListView> {
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
  void dispose() {
    progressStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipmentsBloc, ShipmentsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final bool isFromHome = state.isFromHome;
        return RefreshIndicator(
          onRefresh: () async {
            widget.shipmentsBloc.add(RefreshShipments());
          },
          color: SaayerTheme().getColorsPalette.primaryColor,
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              if (!widget.shipmentsBloc.state.isFromHome)
                ShipmentsFiltersWidget(
                  shipmentsBloc: widget.shipmentsBloc,
                  shipmentsListType: widget.shipmentsListType,
                ),
              const SizedBox(
                height: 10,
              ),
              widget.shipmentsList == null
                  ? const Expanded(child: ShimmerWidget())
                  : _buildShipmentsListWidget(isFromHome),
            ],
          ),
        );
      },
    );
  }

  _buildShipmentsListWidget(bool isFromHome) {
    if (widget.shipmentsList!.isEmpty) {
      return Expanded(child: EmptyShipments(shipmentsType: widget.shipmentsListType));
    }
    return Expanded(
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.shipmentsList?.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final ShipmentGetDto shipmentEntity = widget.shipmentsList![index];
              final bool isLast = (index == widget.shipmentsList!.length - 1);
              Widget shipmentWidget;
              shipmentWidget = ShipmentItemWidgetHelper().getShipmentWidget(
                  shipmentDto: shipmentEntity,
                  isFromHome: isFromHome,
                  shipmentsListType: widget.shipmentsListType,
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
                            'shipmentDto': shipmentEntity,
                            'adminShipmentDto': ShipmentGetDtoExtended(),
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
