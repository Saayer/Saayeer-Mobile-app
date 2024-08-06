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
  final bool? isFieldRequired;
  final Color? fillColor, enabledBorderColor, focusedBorderColor;
  final int? maxLength;
  final double? borderRadius;
  final bool? withValidator;
  final Function()? onTap;

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
      this.isFieldRequired,
      this.maxLength,
      this.withValidator,
      this.onTap,
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
      maxLength: maxLength,
      validator: (withValidator ?? true)
          ? (value) {
              if (value?.isEmpty ?? true) {
                return 'empty_field_error'.tr().replaceFirst("{}", label.tr());
              }
              return null;
            }
          : null,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onTap: onTap,
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
            LabelTxt(txt: (isFieldRequired ?? false) ? '${label.tr()} *' : label.tr()),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
          child: baseTextField,
        ),
      ],
    );
  }
}
