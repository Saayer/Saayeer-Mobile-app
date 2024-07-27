import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final TextEditingController inputController;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final bool showOnlyTextField;
  final Color? fillColor, enabledBorderColor, focusedBorderColor;

  final double? borderRadius;

  const InputTextField(
      {super.key,
      required this.label,
      required this.inputController,
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.showOnlyTextField = false,
      this.fillColor,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    final Widget baseTextField = BaseTextField(
      controller: inputController,
      hintText: label.tr(),
      fillColor: fillColor,
      enabledBorderColor: enabledBorderColor,
      focusedBorderColor: focusedBorderColor,
      borderRadius: borderRadius,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'empty_field_error'.tr().replaceFirst("{}", "input".tr());
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
    );
    if (showOnlyTextField) {
      return baseTextField;
    }
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
          margin: EdgeInsets.only(top: 8, right: 16, left: 16),
          child: baseTextField,
        ),
      ],
    );
  }
}
