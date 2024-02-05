import 'package:flutter/material.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class ShipmentsPage extends StatelessWidget {
  const ShipmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
    );
  }
}
