import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class LinearIndicator extends StatelessWidget {
  final Color? color;

  const LinearIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        height: 5.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: color ?? SaayerTheme().getColorsPalette.greyColor,
          borderRadius: BorderRadius.all(
              Radius.circular(16.r) //                 <--- border radius here
              ),
        ),
      ),
    );
  }
}
