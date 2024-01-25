import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class CustomConfirmationDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final String? cancelLabel;
  final String? confirmLabel;
  final Function? onCancel;
  final Function? onConfirm;
  final bool? hideCancel;

  const CustomConfirmationDialog({
    super.key,
    this.title,
    this.description,
    this.cancelLabel,
    this.confirmLabel,
    this.onCancel,
    this.onConfirm,
    this.hideCancel,
  });

  Widget _buildTitle(context) => title == null
      ? const SizedBox()
      : Text(
          Localization.translate(title!),
          style: AppTextStyles.buttonLabel().copyWith(
            fontSize: 17,
          ),
        );

  Widget _buildContent(context) => Text(
        Localization.translate(description!),
        style: AppTextStyles.liteLabel().copyWith(
          fontSize: 13,
        ),
      );

  List<Widget> _buildIosActions(BuildContext context) => [
        if (!(hideCancel!))
          CupertinoDialogAction(
            child: Text(
              Localization.translate(cancelLabel ?? "cancel"),
              style: AppTextStyles.mainFocusedLabel(
                SaayerTheme().getColorsPalette.darkGreyColor,
              ),
            ),
            onPressed: () {
              if (onCancel == null) {
                getIt<NavigationService>().pop();

                return;
              }
              onCancel!();
            },
          ),
        CupertinoDialogAction(
          child: Text(
            Localization.translate(confirmLabel ?? "ok"),
            style: AppTextStyles.mainFocusedLabel(
              SaayerTheme().getColorsPalette.error0,
            ),
          ),
          onPressed: () {
            try {
              if (onConfirm == null) return;
              onConfirm!();
            } catch (e) {
              getIt<NavigationService>().pop();
            }
          },
        )
      ];

  List<Widget> _buildAndroidActions(BuildContext context) => [
        if (!(hideCancel!))
          TextButton(
            child: Text(
              Localization.translate(cancelLabel ?? "cancel"),
              style: AppTextStyles.mainLabel(
                SaayerTheme().getColorsPalette.darkGreyColor,
              ),
            ),
            onPressed: () {
              if (onCancel == null) {
                getIt<NavigationService>().pop();
                return;
              }
              onCancel!();
            },
          ),
        TextButton(
          child: Text(
            Localization.translate(confirmLabel ?? "ok"),
            style: AppTextStyles.mainLabel(
              SaayerTheme().getColorsPalette.error0,
            ),
          ),
          onPressed: () {
            try {
              if (onConfirm == null) return;
              onConfirm!();
            } catch (e) {
              getIt<NavigationService>().pop();
            }
          },
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: _buildTitle(context),
            content: _buildContent(context),
            actions: _buildIosActions(context),
          )
        : AlertDialog(
            title: _buildTitle(context),
            content: _buildContent(context),
            actions: _buildAndroidActions(context),
          );
  }
}
