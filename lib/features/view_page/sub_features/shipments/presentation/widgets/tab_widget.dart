import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class TabWidget extends StatelessWidget {
  final String label;

  const TabWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width / 2,
      height: 40.h,
      alignment: Alignment.center,
      child: Text(
        "$label".tr(),
        style: AppTextStyles.buttonLabel(),
      ),
    );
  }
}
