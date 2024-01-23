import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class DialogButton extends StatelessWidget {
  final bool? loading;
  final Function? onPressed;
  final String? label, eventLabel;
  final Color? color;
  final Color? labelColor;
  final Color? disabledBackgroundColor;
  final Color? disabledLabelColor;
  final Widget? leadingWidget, disabledLeadingWidget;
  final bool? buttonMinSize;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? labelFontSize;
  final bool? enabled;
  final double? padding;
  final double? elevation;
  final double? borderRadius;
  final double? width;
  final double? height;
  final double? topMargin;
  final TextStyle? labelStyle;

  const DialogButton(
      {super.key,
      this.loading = false,
      this.label = '',
      this.eventLabel,
      this.color,
      this.labelColor,
      this.leadingWidget,
      this.verticalPadding = 20,
      this.horizontalPadding = 0,
      this.labelFontSize = 18,
      this.buttonMinSize = false,
      required this.onPressed,
      this.enabled = true,
      this.disabledBackgroundColor,
      this.disabledLabelColor,
      this.disabledLeadingWidget,
      this.elevation,
      this.padding = 15,
      this.borderRadius = 16,
      this.labelStyle,
      this.width,
      this.height,
      this.topMargin = 12.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin!),
      alignment: Alignment.center,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding!),
          child: ElevatedButton(
            style: ButtonStyle(
              splashFactory:
                  enabled != null && enabled! ? null : NoSplash.splashFactory,
              elevation: MaterialStateProperty.all<double>(elevation ?? 4),
              backgroundColor: MaterialStateProperty.all<Color>(
                color == null
                    ? SaayerTheme().getColorsPalette().darkGreyColor
                    : enabled != null && (enabled!)
                        ? color!
                        : (disabledBackgroundColor ??
                            SaayerTheme().getColorsPalette().neutral3),
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: verticalPadding!)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  side: BorderSide(
                      color: SaayerTheme().getColorsPalette().transparent),
                ),
              ),
            ),
            child: _buildButtonText(context),
            onPressed: () {
              if ((enabled ?? true) && onPressed != null) {
                onPressed!();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildButtonText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (leadingWidget != null)
          (enabled!) ? leadingWidget! : disabledLeadingWidget ?? Container(),
        SizedBox(
          width: leadingWidget != null ? 8.w : 0.w,
        ),
        Text(
          label!,
          textAlign: TextAlign.center,
          softWrap: true,
          style: labelStyle != null
              ? labelStyle!.copyWith(
                  color: labelColor == null
                      ? SaayerTheme().getColorsPalette().backgroundColor
                      : (enabled!)
                          ? labelColor!
                          : (disabledLabelColor ??
                              SaayerTheme().getColorsPalette().neutral2),
                )
              : AppTextStyles.buttonLabel(
                  labelColor == null
                      ? SaayerTheme().getColorsPalette().backgroundColor
                      : (enabled!)
                          ? labelColor!
                          : (disabledLabelColor ??
                              SaayerTheme().getColorsPalette().neutral2),
                ),
        )
      ],
    );
  }
}
