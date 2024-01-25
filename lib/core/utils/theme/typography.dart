import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class AppTextStyles {
  static TextStyle label([Color? color]) => TextStyle(
        fontSize: 12.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w400,
        height: 1.1.h,
      );

  static TextStyle liteLabel([Color? color]) => TextStyle(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w400,
        height: 1.1.h,
      );

  static TextStyle mainLabel([Color? color]) => TextStyle(
        fontSize: 16.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w400,
        height: 1.1.h,
      );

  static TextStyle mainMediumLabel([Color? color]) => TextStyle(
        fontSize: 16.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle smallBoldLabel([Color? color]) => TextStyle(
        fontSize: 10.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w700,
        height: 1.1.h,
      );

  static TextStyle microLabel([Color? color]) => TextStyle(
        fontSize: 6.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle smallLabel([Color? color]) => TextStyle(
        fontSize: 10.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle xSmallLabel([Color? color]) => TextStyle(
        fontSize: 9.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle smallParagraph([Color? color, FontWeight? fontWeight]) =>
      TextStyle(
        fontSize: 12.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: fontWeight ?? FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle hintButtonLabel(
          [Color? color, TextDecoration? decoration]) =>
      TextStyle(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        decoration: decoration ?? TextDecoration.none,
        height: 1.1.h,
      );

  static TextStyle hintButtonExpandedLabel([Color? color]) => TextStyle(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle medText([Color? color]) => TextStyle(
        fontSize: 18.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle paragraph([Color? color]) => TextStyle(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w600,
        height: 1.5.h,
      );

  static TextStyle paragraphTinyHeavy([Color? color]) => TextStyle(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w700,
      );

  static TextStyle mainFocusedLabel([Color? color]) => TextStyle(
        fontSize: 16.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w600,
        height: 1.1.h,
      );

  static TextStyle buttonLabel([Color? color]) => TextStyle(
        fontSize: 18.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w600,
        height: 1.1.h,
      );

  static TextStyle highlightedLabel([Color? color]) => TextStyle(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w900,
        height: 1.1.h,
      );

  static TextStyle sectionTitle([Color? color]) => TextStyle(
        fontSize: 18.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w900,
        height: 1.1.h,
      );

  static TextStyle largeHeader([Color? color]) => TextStyle(
        fontSize: 24.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w900,
        height: 1.1.h,
      );

  static TextStyle heavyHeader([Color? color]) => TextStyle(
        fontSize: 32.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w900,
        height: 1.1.h,
      );
}
