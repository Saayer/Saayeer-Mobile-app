import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saayer/core/utils/colors.dart';

class TxtField extends StatelessWidget {
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
  final Color? colorPrefixIcon;
  final bool? isReadOnly;
  final Function()? onTap;
  final int? maxLength;
  final bool? enabled;
  final int? maxLines;
  final bool isGreyFillColor;
  final List<TextInputFormatter>? inputFormatters;

  const TxtField(
      {Key? key,
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
      this.colorPrefixIcon = ColorsPalette.blackTextColor,
      this.isReadOnly = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // inputFormatters: <TextInputFormatter>[
      //   FilteringTextInputFormatter.allow(RegExp(!isPhone?"[0-9a-zA-Z]":'[0-9]')),
      // ],
      obscureText: obscureText!,
      controller: controller,
      keyboardType: keyboardType,
      readOnly: isReadOnly!,
      onTap: onTap,
      enabled: enabled,
      style: GoogleFonts.roboto(
        color: ColorsPalette.blackTextColor,
        fontSize: 14,
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
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        hintText: hintText,
        counterText: "",
        hintStyle: GoogleFonts.roboto(
          color: ColorsPalette.greyColor,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        filled: true,
        fillColor: (isGreyFillColor)
            ? ColorsPalette.greyColor.withOpacity(.3)
            : Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        errorStyle: TextStyle(color: ColorsPalette.primaryColor),
        errorMaxLines: null,
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsPalette.primaryColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsPalette.primaryColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
