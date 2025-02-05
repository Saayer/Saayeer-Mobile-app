import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saayer/common/text_fields/input_text_field_decoration.dart';
import 'package:saayer/core/utils/theme/typography.dart';

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
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor, enabledBorderColor, focusedBorderColor;
  final TextAlign? textAlign;

  final double? borderRadius;

  final String? initialValue;

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
      this.maxLines = 1,
      this.enabled = true,
      this.suffixWidget,
      this.isPhone = false,
      this.isReadOnly = false,
      this.onTap,
      this.fillColor,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.borderRadius,
      this.initialValue,
      this.textAlign,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (PointerDownEvent pointerDownEvent) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      initialValue: initialValue,
      obscureText: obscureText!,
      controller: controller,
      keyboardType: keyboardType,
      readOnly: isReadOnly!,
      onTap: onTap,
      enabled: enabled,
      style: AppTextStyles.liteLabel(),
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved ??
          (String? text) {
            log("$text", name: "OnSaved");
          },
      maxLines: maxLines,
      maxLength: maxLength,
      textAlign: textAlign ?? TextAlign.start,
      inputFormatters: inputFormatters ?? const <TextInputFormatter>[],
      decoration: InputTextFieldDecoration()(
          prefixWidget: prefixWidget,
          suffixWidget: suffixWidget,
          hintText: hintText,
          fillColor: fillColor,
          enabledBorderColor: enabledBorderColor,
          focusedBorderColor: focusedBorderColor,
          borderRadius: borderRadius),
    );
  }
}
