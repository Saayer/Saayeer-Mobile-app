import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? buttonText, secondButtonText;
  final bool isError, hasSecondButton;
  final void Function()? onTapDismiss, onSecondTapDismiss;

  const BaseDialog(
      {super.key,
      required this.title,
      required this.message,
      this.buttonText,
      this.secondButtonText,
      this.isError = true,
      this.hasSecondButton = false,
      this.onTapDismiss,
      this.onSecondTapDismiss});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final String errorImagePath = Constants.getGifPath("error.gif");
    final String successImagePath = Constants.getGifPath("success.gif");

    return Dialog(
      backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: SaayerTheme().getColorsPalette.backgroundColor,
          // boxShadow: [
          //   BoxShadow(
          //       color: SaayerTheme().getColorsPalette.backgroundColor,
          //       spreadRadius: 5),
          // ],
        ),
        width: width / 1.1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                isError ? errorImagePath : successImagePath,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title.tr(),
                style: AppTextStyles.buttonLabel(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                message.tr(),
                style: AppTextStyles.label(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              SaayerDefaultTextButton(
                text: (buttonText ?? "ok").tr(),
                isEnabled: true,
                borderRadius: 16,
                onPressed: () {
                  getIt<NavigationService>().pop();
                  if (onTapDismiss != null) {
                    onTapDismiss!();
                  }
                },
                btnWidth: width / 1.5,
                btnHeight: 50,
              ),
              if (hasSecondButton) ...[
                const SizedBox(
                  height: 20,
                ),
                SaayerDefaultTextButton(
                  text: (secondButtonText ?? "cancel").tr(),
                  isEnabled: true,
                  borderRadius: 16,
                  onPressed: () {
                    getIt<NavigationService>().pop();
                    if (onSecondTapDismiss != null) {
                      onSecondTapDismiss!();
                    }
                  },
                  btnWidth: width / 1.5,
                  btnHeight: 50,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
