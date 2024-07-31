import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';
import 'package:saayer/core/helpers/utils_helper/validation_utils.dart';

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
          margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
          child: BaseTextField(
            controller: emailController,
            hintText: "email".tr(),
            validator: (value) {
              if (value?.isNotEmpty ?? true) {
                if (!ValidationUtils.isValidEmail(value ?? "")) {
                  return 'invalid_field_error'
                      .tr()
                      .replaceFirst("{}", "email".tr());
                }
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
