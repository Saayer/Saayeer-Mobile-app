import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/details/shipment_info.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/details/bill_info.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/details/sender_receiver_info.dart';
import "package:universal_html/html.dart" as html;

class ShipmentDetailsWidget extends StatefulWidget {
  const ShipmentDetailsWidget({super.key});

  @override
  State<ShipmentDetailsWidget> createState() => _ShipmentDetailsWidgetState();
}

class _ShipmentDetailsWidgetState extends State<ShipmentDetailsWidget> {
  String? status;
  late StreamSubscription progressStream;

  @override
  void initState() {
    FlDownloader.initialize();
    progressStream = FlDownloader.progressStream.listen((event) {
      if (event.status == DownloadStatus.successful) {
        debugPrint('event.progress: ${event.progress}');
        setState(() {
          status = event.status.name;
        });
        // This is a way of auto-opening downloaded file right after a download is completed
        FlDownloader.openFile(filePath: event.filePath);
        LoadingDialog.setIsLoading(context, false);
      } else if (event.status == DownloadStatus.running) {
        LoadingDialog.setIsLoading(context, true);
        debugPrint('event.progress: ${event.progress}');
        setState(() {
          status = event.status.name;
        });
      } else if (event.status == DownloadStatus.failed) {
        LoadingDialog.setIsLoading(context, false);
        SaayerToast().showSuccessToast(msg: "label_error_download_msg".tr());
        debugPrint('event: $event');
        setState(() {
          status = event.status.name;
        });
      } else if (event.status == DownloadStatus.paused) {
        debugPrint('Download paused');
        setState(() {
          status = event.status.name;
        });
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
        setState(() {
          status = event.status.name;
        });
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
    final double width = MediaQuery.of(context).size.width;
    return BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                ///ShipmentSpecInfo
                ShipmentInfo(
                  shipmentDto: state.shipmentDto!,
                  adminShipmentDto: state.adminShipmentDto!,
                ),
                const SizedBox(height: 16),

                ///SenderReceiverInfo
                SenderReceiverInfo(
                  shipmentDto: state.shipmentDto!,
                  adminShipmentDto: state.adminShipmentDto!,
                ),
                const SizedBox(height: 16),

                ///ServiceProviderInfo
                BillInfo(
                  shipmentDto: state.shipmentDto!,
                  adminShipmentDto: state.adminShipmentDto!,
                ),
                const SizedBox(height: 16),
                if (_hasLabel(state)) _buildShipmentDownloadButton(width, context, state),

                const SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _hasLabel(ShipmentDetailsState state) {
    if (UserUtils.isAdmin()) {
      return (state.adminShipmentDto?.labelURL ?? '').isNotEmpty;
    } else {
      return (state.shipmentDto?.labelURL ?? '').isNotEmpty;
    }
  }

  _buildShipmentDownloadButton(
    double width,
    BuildContext context,
    ShipmentDetailsState state,
  ) {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: SaayerTheme().getColorsPalette.primaryColor,
          fixedSize: Size(largerThanTablet(context) ? width / 2 : width, 50),
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              side: BorderSide(color: SaayerTheme().getColorsPalette.primaryColor)),
          backgroundColor: SaayerTheme().getColorsPalette.primaryColor,
        ),
        onPressed: () {
          if (!_hasLabel(state)) {
            SaayerToast().showSuccessToast(msg: "label_not_available_msg".tr());
          } else {
            downloadPdfFile(
                UserUtils.isAdmin() ? state.adminShipmentDto?.labelURL ?? '' : state.shipmentDto?.labelURL ?? '',
                UserUtils.isAdmin() ? state.adminShipmentDto?.shipmentId : state.shipmentDto?.shipmentId);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "shipment_download".tr(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.mainFocusedLabel(SaayerTheme().getColorsPalette.whiteColor),
            ),
            Icon(
              LineIcons.fileDownload,
              color: SaayerTheme().getColorsPalette.whiteColor,
            )
          ],
        ));
  }

  void downloadPdfFile(String url, int? shipmentId) async {
    if (kIsWeb) {
      html.AnchorElement anchorElement = html.AnchorElement(href: url);
      anchorElement.download = url;
      anchorElement.click();
      print(url);
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
