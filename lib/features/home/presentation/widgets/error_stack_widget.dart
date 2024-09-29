import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class ErrorStackWidget extends StatelessWidget {
  const ErrorStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          size: 30,
          color: SaayerTheme().getColorsPalette.error0,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          'error_msg'.tr(),
          style: AppTextStyles.smallParagraph(),
        ),
      ],
    );
  }
}
