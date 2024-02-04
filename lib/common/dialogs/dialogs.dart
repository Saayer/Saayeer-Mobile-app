// import 'dart:developer';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:lottie/lottie.dart';
// import 'package:saayer/common/dialogs/dialog_button.dart';
// import 'package:saayer/core/services/injection/injection.dart';
// import 'package:saayer/core/services/localization/localization.dart';
// import 'package:saayer/core/services/navigation/navigation_service.dart';
// import 'package:saayer/core/utils/constants.dart';
// import 'package:saayer/core/utils/theme/saayer_theme.dart';
// import 'package:saayer/core/utils/theme/typography.dart';
// import 'dart:ui' as ui;
//
// class Dialogs {
//   static void showSuccessDialog(
//     BuildContext context,
//     String message, {
//     Function? okAction,
//     Function? onClose,
//     String? title,
//     bool? isDismissible,
//     String? okLabel,
//     bool hasOkButton = true,
//     bool bottomPaading = true,
//     bool disableTimer = false,
//   }) {
//     showDialog(
//       context: context,
//       barrierDismissible: isDismissible ?? true,
//       builder: (BuildContext context) {
//         return AlertDialog(
//             scrollable: true,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(12.r))),
//             //onWillPop: () => Future.value(!renewSessionDialog),
//             content: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Wrap(
//                   alignment: WrapAlignment.center,
//                   children: [
//                     Divider(
//                       color: SaayerTheme().getColorsPalette.transparent,
//                       height: 24,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             height: 30,
//                             width: 30,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: SaayerTheme().getColorsPalette.neutral3,
//                             ),
//                             child: Icon(
//                               Icons.close,
//                               size: 20,
//                               color: SaayerTheme().getColorsPalette.neutral5,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Center(
//                       child: SizedBox(
//                         height: 180.h,
//                         width: 180.w,
//                         child: Image.asset(
//                           Constants.getGifPath("success.gif"),
//                           height: 180.h,
//                           width: 180.w,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Divider(
//                       color: SaayerTheme().getColorsPalette.transparent,
//                       height: 5.h,
//                     ),
//                     if (title != null) ...[
//                       Divider(
//                         color: SaayerTheme().getColorsPalette.transparent,
//                         height: 5.h,
//                       ),
//                       Text(
//                         Localization.translate(title),
//                         textAlign: TextAlign.center,
//                         style: AppTextStyles.sectionTitle(),
//                       ),
//                       Divider(
//                         color: SaayerTheme().getColorsPalette.transparent,
//                         height: 8.h,
//                       ),
//                     ],
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 1.2,
//                       child: Text(
//                         Localization.translate(message),
//                         textAlign: TextAlign.center,
//                         style: AppTextStyles.liteLabel(),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 24.h,
//                     ),
//                     if (hasOkButton)
//                       DialogButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                           if (okAction != null) {
//                             okAction();
//                           }
//                         },
//                         horizontalPadding: 5.w,
//                         verticalPadding: 30.h,
//                         padding: 0,
//                         elevation: 0,
//                         label: okLabel ?? Localization.translate("continue"),
//                         color: SaayerTheme().getColorsPalette.primaryColor,
//                         labelColor:
//                             SaayerTheme().getColorsPalette.backgroundColor,
//                       ),
//                     Divider(
//                       color: SaayerTheme().getColorsPalette.transparent,
//                       height: MediaQuery.of(context).padding.bottom == 0
//                           ? 31.h
//                           : MediaQuery.of(context).padding.bottom,
//                     ),
//                     bottomPaading
//                         ? Divider(
//                             color: SaayerTheme().getColorsPalette.transparent,
//                             height: 20.0)
//                         : Container(),
//                   ],
//                 )));
//       },
//     ).then((value) {
//       if (!(value != null && value)) {
//         if (onClose != null) {
//           onClose();
//         }
//       }
//     });
//   }
//
//   static void showErrorDialog(BuildContext? context, String? errorMsg,
//       {Function? okAction,
//       String? title = 'error_title',
//       String? okLabel,
//       String? retryLabel,
//       String? cancelLabel,
//       String? imagePath,
//       Widget? imageWidget,
//       bool showRetry = false,
//       bool showCancel = false,
//       bool wasLoading = false,
//       bool isDismissible = false,
//       bool showClose = false,
//       Color? retryBtnColor,
//       Color? retryTextColor,
//       Color? cancelBtnColor,
//       Color? cancelTextColor,
//       Function? retryAction,
//       Function? cancelAction}) {
//     if (context == null) return;
//     if (wasLoading) {
//       context.loaderOverlay.hide();
//     }
//     showDialog(
//       context: context,
//       barrierDismissible: isDismissible,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           scrollable: true,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(24.r))),
//           //onWillPop: () => Future.value(!renewSessionDialog),
//           content: Wrap(
//             children: [
//               if (showClose)
//                 Directionality(
//                   textDirection: ui.TextDirection.ltr,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           log("click close");
//                           getIt<NavigationService>().pop();
//                         },
//                         child: Container(
//                           height: 30,
//                           width: 30,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: SaayerTheme().getColorsPalette.neutral3,
//                           ),
//                           child: Icon(
//                             Icons.close,
//                             size: 20,
//                             color: SaayerTheme().getColorsPalette.neutral6,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Wrap(
//                   alignment: WrapAlignment.center,
//                   children: [
//                     if (!showClose)
//                       Divider(
//                         color: SaayerTheme().getColorsPalette.transparent,
//                         height: 40,
//                       ),
//                     imageWidget ??
//                         Image.asset(
//                           imagePath ?? Constants.getGifPath("error.gif"),
//                           height: 100.h,
//                           width: 100.w,
//                           fit: BoxFit.cover,
//                         ),
//                     Divider(
//                       color: SaayerTheme().getColorsPalette.transparent,
//                       height: 5.h,
//                     ),
//                     if (title != null) ...[
//                       Divider(
//                         color: SaayerTheme().getColorsPalette.transparent,
//                         height: 5.h,
//                       ),
//                       Text(
//                         Localization.translate(title),
//                         textAlign: TextAlign.center,
//                         style: AppTextStyles.sectionTitle(),
//                       ),
//                       Divider(
//                         color: SaayerTheme().getColorsPalette.transparent,
//                         height: 10.h,
//                       ),
//                     ],
//                     Text(
//                       errorMsg == null || errorMsg == ""
//                           ? Localization.translate("error_msg")
//                           : Localization.translate(errorMsg),
//                       textAlign: TextAlign.center,
//                       style: AppTextStyles.smallParagraph(),
//                     ),
//                     Divider(
//                       color: SaayerTheme().getColorsPalette.transparent,
//                       height: 32.h,
//                     ),
//                     DialogButton(
//                       elevation: 0,
//                       enabled: true,
//                       verticalPadding: 30.h,
//                       horizontalPadding: 5.w,
//                       onPressed: () {
//                         Navigator.pop(context);
//                         if (okAction != null) {
//                           okAction();
//                         }
//                       },
//                       color: SaayerTheme().getColorsPalette.primaryColor,
//                       label: Localization.translate(okLabel ?? "ok"),
//                       labelFontSize: 14.sp,
//                       labelColor:
//                           SaayerTheme().getColorsPalette.blackTextColor,
//                     ),
//                     if (showRetry)
//                       DialogButton(
//                         elevation: 0,
//                         enabled: true,
//                         verticalPadding: 30.h,
//                         horizontalPadding: 5.w,
//                         onPressed: () {
//                           Navigator.pop(context);
//                           if (retryAction != null) {
//                             retryAction();
//                           }
//                         },
//                         color: retryBtnColor,
//                         label: Localization.translate("$retryLabel"),
//                         labelColor: retryTextColor ??
//                             SaayerTheme().getColorsPalette.error0,
//                         labelFontSize: 14,
//                       ),
//                     if (showRetry)
//                       Divider(
//                         color: SaayerTheme().getColorsPalette.transparent,
//                         height: !showCancel ? 20.h : 0,
//                       ),
//                     if (showCancel)
//                       Divider(
//                         color: SaayerTheme().getColorsPalette.transparent,
//                         height: 5,
//                       ),
//                     if (showCancel)
//                       DialogButton(
//                         elevation: 0,
//                         enabled: true,
//                         onPressed: () {
//                           Navigator.pop(context);
//                           if (cancelAction != null) {
//                             cancelAction();
//                           }
//                         },
//                         color: cancelBtnColor ??
//                             SaayerTheme().getColorsPalette.error1,
//                         label: Localization.translate("$cancelLabel"),
//                         labelColor: cancelTextColor ??
//                             SaayerTheme().getColorsPalette.error0,
//                         labelFontSize: 14,
//                       ),
//                     if (showCancel)
//                       Divider(
//                         color: SaayerTheme().getColorsPalette.transparent,
//                         height: 20.h,
//                       ),
//                     Divider(
//                       color: SaayerTheme().getColorsPalette.transparent,
//                       height: MediaQuery.of(context).padding.bottom == 0
//                           ? 16.h
//                           : MediaQuery.of(context).padding.bottom,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
