import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/constants.dart';

class SaayerLoader extends StatelessWidget {
  final double? size;

  const SaayerLoader({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        // Constants.getGifPath("squishy_logo.gif"),
        Constants.getGifPath("tenbyten_logo.gif"),
        height: (size ?? 150).h,
        width: (size ?? 150).w,
        fit: BoxFit.cover,
      ),
    );
  }
}
