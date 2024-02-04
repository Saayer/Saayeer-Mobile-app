import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class SaayerDialogs {
  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  final String errorImagePath = Constants.getGifPath("error.gif");
  final String successImagePath = Constants.getGifPath("success.gif");

  oneBtnDialog(
      {required String title,
      required String message,
      String? buttonText,
      bool isError = true,
      void Function()? onTapDismiss,
      PanaraDialogType? panaraDialogType}) {
    PanaraInfoDialog.show(
      context,
      imagePath: isError ? errorImagePath : successImagePath,
      title: title.tr(),
      message: message.tr(),
      buttonText: (buttonText ?? "ok").tr(),
      textColor: SaayerTheme().getColorsPalette.blackTextColor,
      buttonTextColor: SaayerTheme().getColorsPalette.backgroundColor,
      onTapDismiss: () {
        getIt<NavigationService>().pop();
        if (onTapDismiss != null) {
          onTapDismiss();
        }
      },
      panaraDialogType: panaraDialogType ??
          (isError ? PanaraDialogType.error : PanaraDialogType.success),
      barrierDismissible: false, // optional parameter (default is true)
    );
  }

  twoBtnsDialog(
      {required String title,
      required String message,
      String? confirmButtonText,
      String? cancelButtonText,
      bool isError = true,
      void Function()? onTapCancel,
      void Function()? onTapConfirm,
      PanaraDialogType? panaraDialogType}) {
    PanaraConfirmDialog.show(
      context,
      imagePath: isError ? errorImagePath : successImagePath,
      title: title.tr(),
      message: message.tr(),
      confirmButtonText: (confirmButtonText ?? "confirm").tr(),
      cancelButtonText: (cancelButtonText ?? "cancel").tr(),
      textColor: SaayerTheme().getColorsPalette.blackTextColor,
      buttonTextColor: SaayerTheme().getColorsPalette.backgroundColor,
      onTapCancel: () {
        getIt<NavigationService>().pop();
        if (onTapCancel != null) {
          onTapCancel();
        }
      },
      onTapConfirm: () {
        getIt<NavigationService>().pop();
        if (onTapConfirm != null) {
          onTapConfirm();
        }
      },
      panaraDialogType: panaraDialogType ??
          (isError ? PanaraDialogType.error : PanaraDialogType.success),
      barrierDismissible: false, // optional parameter (default is true)
    );
  }
}
