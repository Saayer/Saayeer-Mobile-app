import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? hintText;
  final Widget? prefixWidget;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixWidget;
  final bool? isPhone;
  final bool? isReadOnly;
  final Function()? onTap;
  final int? maxLength;
  final bool? enabled;
  final int? maxLines;
  final bool isGreyFillColor;
  final List<TextInputFormatter>? inputFormatters;

  const BaseTextField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.onChanged,
      this.onSaved,
      required this.hintText,
      this.prefixWidget,
      required this.keyboardType,
      this.obscureText = false,
      this.maxLength = 50,
      this.inputFormatters,
      this.isGreyFillColor = false,
      this.maxLines = 1,
      this.enabled = true,
      this.suffixWidget,
      this.isPhone = false,
      this.isReadOnly = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (PointerDownEvent pointerDownEvent) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      obscureText: obscureText!,
      controller: controller,
      keyboardType: keyboardType,
      readOnly: isReadOnly!,
      onTap: onTap,
      enabled: enabled,
      style: GoogleFonts.roboto(
        color: SaayerTheme().getColorsPalette().blackTextColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved ??
          (String? text) {
            log("$text", name: "OnSaved");
          },
      maxLines: maxLines,
      maxLength: maxLength,
      inputFormatters: inputFormatters ?? const <TextInputFormatter>[],
      decoration: InputDecoration(
        hintText: hintText,
        counterText: "",
        hintStyle: GoogleFonts.roboto(
          color: SaayerTheme().getColorsPalette().greyColor,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        filled: true,
        fillColor: (isGreyFillColor)
            ? SaayerTheme().getColorsPalette().greyColor.withOpacity(.3)
            : Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        errorStyle: TextStyle(color: SaayerTheme().getColorsPalette().primaryColor),
        errorMaxLines: null,
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: SaayerTheme().getColorsPalette().primaryColor, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: SaayerTheme().getColorsPalette().primaryColor, width: 2.w),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.w),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
      ),
    );
  }
}
