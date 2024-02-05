import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/helpers/utils_helper/validation_utils.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  final void Function(String)? onChanged;

  const EmailTextField(
      {super.key, required this.emailController, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LabelTxt(txt: "email".tr()),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h, right: 20.w, left: 20.w),
          child: BaseTextField(
            controller: emailController,
            hintText: "email".tr(),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'empty_field_error'
                    .tr()
                    .replaceFirst("{}", "email".tr());
              }
              if (!ValidationUtils.isValidEmail(value ?? "")) {
                return 'invalid_field_error'
                    .tr()
                    .replaceFirst("{}", "email".tr());
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
