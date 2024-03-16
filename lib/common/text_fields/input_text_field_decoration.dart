import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class InputTextFieldDecoration {
  InputDecoration call(
      {Widget? prefixWidget,
      Widget? suffixWidget,
      String? hintText,
      Color? fillColor,
      Color? enabledBorderColor,
      Color? focusedBorderColor,
      double? borderRadius}) {
    return InputDecoration(
      hintText: hintText,
      counterText: "",
      hintStyle:
          AppTextStyles.liteLabel(SaayerTheme().getColorsPalette.greyColor),
      filled: true,
      fillColor: fillColor ?? SaayerTheme().getColorsPalette.textFieldFillColor,
      contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular((borderRadius ?? 10).r)),
      ),
      errorStyle: TextStyle(color: SaayerTheme().getColorsPalette.primaryColor),
      errorMaxLines: 5,
      prefixIcon: prefixWidget,
      suffixIcon: suffixWidget,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: SaayerTheme().getColorsPalette.primaryColor, width: 1.w),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: SaayerTheme().getColorsPalette.primaryColor, width: 2.w),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color:
                enabledBorderColor ?? SaayerTheme().getColorsPalette.greyColor,
            width: 1.w),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color:
                focusedBorderColor ?? SaayerTheme().getColorsPalette.greyColor,
            width: 2.w),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
    );
  }
}
