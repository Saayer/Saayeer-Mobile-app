import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class RichTextWidget extends StatelessWidget {
  final String keyStr, valueStr;
  final TextStyle? keyTextStyle;
  final TextStyle? valueTextStyle;

  const RichTextWidget({
    super.key,
    required this.keyStr,
    required this.valueStr,
    this.keyTextStyle,
    this.valueTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: "${keyStr.tr()} : ",
              style: keyTextStyle ?? AppTextStyles.microLabel(SaayerTheme().getColorsPalette.greyColor)),
          TextSpan(text: valueStr.tr(), style: valueTextStyle ?? AppTextStyles.xSmallLabel()),
        ],
      ),
    );
  }
}
