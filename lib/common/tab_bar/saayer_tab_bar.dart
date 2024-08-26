import 'package:flutter/material.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class SaayerTabBar extends StatelessWidget {
  final TabController? controller;
  final List<Widget> tabs;
  final void Function(int)? onTap;
  final TextStyle? labelStyle;
  final double? horizontalPadding, verticalPadding;

  const SaayerTabBar(
      {super.key,
      this.controller,
      required this.tabs,
      this.onTap,
      this.labelStyle,
      this.horizontalPadding,
      this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (horizontalPadding ?? 16), vertical: (verticalPadding ?? 10)),
      child: Container(
        height: 40,
        width: width / 1,
        decoration: BoxDecoration(
          color: SaayerTheme().getColorsPalette.backgroundColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
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
            borderRadius: BorderRadius.circular(50),
            color: SaayerTheme().getColorsPalette.primaryColor,
          ),
          dividerHeight: 0,
          onTap: onTap,
          labelStyle: labelStyle ?? AppTextStyles.smallParagraph(),
          labelColor: SaayerTheme().getColorsPalette.backgroundColor,
          unselectedLabelStyle: labelStyle ?? AppTextStyles.smallParagraph(),
          unselectedLabelColor: SaayerTheme().getColorsPalette.blackTextColor,
          tabs: tabs,
        ),
      ),
    );
  }
}
