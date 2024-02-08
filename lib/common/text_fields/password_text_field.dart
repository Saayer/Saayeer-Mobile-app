import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/helpers/utils_helper/validation_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool obscureText;
  final void Function()? onSuffixTap;
  final void Function(String)? onChanged;

  const PasswordTextField(
      {super.key,
      required this.passwordController,
      required this.obscureText,
      this.onSuffixTap,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LabelTxt(txt: "password".tr()),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h, right: 16.w, left: 16.w),
          child: BaseTextField(
            controller: passwordController,
            hintText: "password".tr(),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'empty_field_error'
                    .tr()
                    .replaceFirst("{}", "password".tr());
              }
              if (ValidationUtils.isValidPassword(value ?? "")) {
                return 'invalid_field_error'
                    .tr()
                    .replaceFirst("{}", "password".tr());
              }
              return null;
            },
            obscureText: obscureText,
            suffixWidget: GestureDetector(
              onTap: onSuffixTap,
              child: obscureText
                  ? Icon(
                      Icons.visibility_off,
                      size: 20.r,
                      color: SaayerTheme().getColorsPalette.blackTextColor,
                    )
                  : Icon(
                      Icons.visibility,
                      size: 20.r,
                      color: SaayerTheme().getColorsPalette.blackTextColor,
                    ),
            ),
            keyboardType: TextInputType.text,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
