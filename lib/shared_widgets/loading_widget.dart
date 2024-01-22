import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:saayer/core/utils/colors.dart';

class ShowLoading extends StatelessWidget {
  final bool isLoading;
  final double size;

  const ShowLoading({super.key, this.isLoading = true, this.size = 50.0});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: Center(
        child: SpinKitCircle(
          color: ColorsPalette.primaryColor,
          size: size,
        ),
      ),
    );
  }
}
