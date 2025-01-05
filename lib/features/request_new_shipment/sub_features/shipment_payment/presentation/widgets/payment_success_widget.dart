import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/API/end_points/builder/end_points_base_url.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import "package:universal_html/html.dart" as html;

class PaymentSuccessWidget extends StatefulWidget {
  final CreatePaymentResponse createPaymentResponse;

  const PaymentSuccessWidget({
    super.key,
    required this.createPaymentResponse,
  });

  @override
  State<PaymentSuccessWidget> createState() => _PaymentSuccessWidgetState();
}

class _PaymentSuccessWidgetState extends State<PaymentSuccessWidget> {
  late StreamSubscription progressStream;

  @override
  initState() {
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
        LoadingDialog.setIsLoading(context, false);
        SaayerToast().showSuccessToast(msg: "label_error_download_msg".tr());
        debugPrint('event: $event');
      } else if (event.status == DownloadStatus.paused) {
        debugPrint('Download paused');
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
    return GeneralResponsiveScaledBoxWidget(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          bottomSheet: _buildButtonsWidget(),
          body: _buildPaymentSuccessBody(),
        ),
      ),
    );
  }

  _buildButtonsWidget() {
    return Container(
      height: 190,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if ((widget.createPaymentResponse.shipment!.labelURL!.isNotEmpty)) _buildShipmentDownloadButton(),
          const SizedBox(
            height: 10,
          ),
          SaayerDefaultTextButton(
            text: "new_shipment",
            isEnabled: true,
            enabledColor: SaayerTheme().getColorsPalette.whiteColor,
            borderColor: SaayerTheme().getColorsPalette.primaryColor,
            textStyle: AppTextStyles.mainFocusedLabel(SaayerTheme().getColorsPalette.primaryColor),
            borderRadius: 16,
            onPressed: () {
              ///
              getIt<NavigationService>().navigateAndReplacementNamed(Routes.requestNewShipmentNamedPage);
              if (kIsWeb) {
                html.window.history.pushState(null, '', EndPointsBaseUrl.init().hrefForWeb);
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          SaayerDefaultTextButton(
            text: "home",
            isEnabled: true,
            borderRadius: 16,
            onPressed: () {
              ///
              getIt<NavigationService>().navigateAndFinishNamed(Routes.viewPageNamedPage);
              if (kIsWeb) {
                html.window.history.pushState(null, '', EndPointsBaseUrl.init().hrefForWeb);
              }
            },
          ),
        ],
      ),
    );
  }

  _buildPaymentSuccessBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'payment_successfully'.tr(),
              style: AppTextStyles.mainFocusedLabel(),
            ),
            Image.asset(
              Constants.getGifPath("success.gif"),
              fit: BoxFit.contain,
            ),
            if (widget.createPaymentResponse.createShipmentStatuses != null)
              if (widget.createPaymentResponse.createShipmentStatuses!.contains(CreateShipmentStatus.pickupNotCreated))
                Text(
                  "pickup_shipment_msg"
                      .tr()
                      .replaceFirst('{}', widget.createPaymentResponse.shipment?.logisticServiceName ?? ''),
                  style: AppTextStyles.mainFocusedLabel(),
                ),
            const SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }

  _buildShipmentDownloadButton() {
    return SaayerDefaultTextButton(
      text: "",
      isEnabled: true,
      enabledColor: SaayerTheme().getColorsPalette.primaryColor,
      borderColor: SaayerTheme().getColorsPalette.primaryColor,
      borderRadius: 16,
      onPressed: () {
        if ((widget.createPaymentResponse.shipment!.labelURL!.isEmpty)) {
          SaayerToast().showSuccessToast(msg: "label_not_available_msg".tr());
        } else {
          downloadPdfFile();
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
          const SizedBox(
            width: 5,
          ),
          Icon(
            LineIcons.fileDownload,
            color: SaayerTheme().getColorsPalette.whiteColor,
          )
        ],
      ),
    );
  }

  void downloadPdfFile() async {
    if (kIsWeb) {
      html.AnchorElement anchorElement = html.AnchorElement(href: widget.createPaymentResponse.shipment!.labelURL!);
      anchorElement.download = widget.createPaymentResponse.shipment!.labelURL!;
      anchorElement.click();
    } else {
      final permission = await FlDownloader.requestPermission();
      if (permission == StoragePermissionStatus.granted) {
        await FlDownloader.download(
          widget.createPaymentResponse.shipment!.labelURL!,
          fileName: 'Saayer-Shipment-${widget.createPaymentResponse.shipment!.shipmentId}.pdf',
        );
      } else {
        debugPrint('Permission denied =(');
      }
    }
  }
}
