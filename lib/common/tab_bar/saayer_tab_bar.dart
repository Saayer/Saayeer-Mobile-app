import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class SaayerTabBar extends StatelessWidget {
  final TabController? controller;
  final List<Widget> tabs;
  final void Function(int)? onTap;

  const SaayerTabBar(
      {super.key, this.controller, required this.tabs, this.onTap});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Container(
        height: 40.h,
        width: width / 1,
        decoration: BoxDecoration(
          color: SaayerTheme().getColorsPalette.backgroundColor,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: [
            BoxShadow(
              color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: TabBar(
          controller: controller,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: SaayerTheme().getColorsPalette.primaryColor,
          ),
          dividerHeight: 0.h,
          onTap: onTap,
          labelStyle: AppTextStyles.smallParagraph(),
          labelColor: SaayerTheme().getColorsPalette.backgroundColor,
          unselectedLabelStyle: AppTextStyles.smallParagraph(),
          unselectedLabelColor: SaayerTheme().getColorsPalette.blackTextColor,
          tabs: tabs,
        ),
      ),
    );
  }
}
