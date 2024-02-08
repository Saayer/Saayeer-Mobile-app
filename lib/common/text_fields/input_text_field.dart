import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/helpers/utils_helper/validation_utils.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final TextEditingController inputController;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;

  const InputTextField(
      {super.key,
      required this.label,
      required this.inputController,
      this.onChanged,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LabelTxt(txt: label.tr()),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h, right: 16.w, left: 16.w),
          child: BaseTextField(
            controller: inputController,
            hintText: label.tr(),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'empty_field_error'
                    .tr()
                    .replaceFirst("{}", "input".tr());
              }
              // if (ValidationUtils.isValidinput(value ?? "")) {
              //   return 'invalid_field_error'
              //       .tr()
              //       .replaceFirst("{}", label.tr());
              // }
              return null;
            },
            keyboardType: keyboardType,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
