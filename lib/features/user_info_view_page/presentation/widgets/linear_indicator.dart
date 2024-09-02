import 'package:flutter/material.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class LinearIndicator extends StatelessWidget {
  final Color? color;

  const LinearIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 5,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: color ?? SaayerTheme().getColorsPalette.greyColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
