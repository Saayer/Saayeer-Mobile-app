import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class AppTextStyles {
  static TextStyle label([Color? color]) => GoogleFonts.alexandria(
        fontSize: 12.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w400,
        height: 1.1.h,
      );

  static TextStyle boldLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 12.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w700,
        height: 1.1.h,
      );

  static TextStyle boldLiteLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w900,
        height: 1.1.h,
      );

  static TextStyle liteLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w400,
        height: 1.1.h,
      );

  static TextStyle mainLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 16.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w400,
        height: 1.1.h,
      );

  static TextStyle mainMediumLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 16.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle smallBoldLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 10.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w700,
        height: 1.1.h,
      );

  static TextStyle microLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 6.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle smallLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 10.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle xSmallLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 9.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle smallParagraph([Color? color, FontWeight? fontWeight]) =>
      GoogleFonts.alexandria(
        fontSize: 12.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: fontWeight ?? FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle hintButtonLabel(
          [Color? color, TextDecoration? decoration]) =>
      GoogleFonts.alexandria(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        decoration: decoration ?? TextDecoration.none,
        height: 1.1.h,
      );

  static TextStyle hintButtonExpandedLabel([Color? color]) =>
      GoogleFonts.alexandria(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle medText([Color? color]) => GoogleFonts.alexandria(
        fontSize: 18.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w500,
        height: 1.1.h,
      );

  static TextStyle paragraph([Color? color]) => GoogleFonts.alexandria(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w600,
        height: 1.5.h,
      );

  static TextStyle paragraphTinyHeavy([Color? color]) => GoogleFonts.alexandria(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w700,
      );

  static TextStyle mainFocusedLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 16.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w600,
        height: 1.1.h,
      );

  static TextStyle buttonLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 18.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w600,
        height: 1.1.h,
      );

  static TextStyle highlightedLabel([Color? color]) => GoogleFonts.alexandria(
        fontSize: 14.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w900,
        height: 1.1.h,
      );

  static TextStyle sectionTitle([Color? color]) => GoogleFonts.alexandria(
        fontSize: 18.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w900,
        height: 1.1.h,
      );

  static TextStyle largeHeader([Color? color]) => GoogleFonts.alexandria(
        fontSize: 24.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w900,
        height: 1.1.h,
      );

  static TextStyle heavyHeader([Color? color]) => GoogleFonts.alexandria(
        fontSize: 32.sp,
        color: color ?? SaayerTheme().getColorsPalette.blackTextColor,
        fontWeight: FontWeight.w900,
        height: 1.1.h,
      );
}
