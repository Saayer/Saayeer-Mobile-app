import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:saayer/common/loading/loading_widget.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      color: SaayerTheme().getColorsPalette.backgroundColor,
      child: const SaayerLoader(),
    );
  }
}
