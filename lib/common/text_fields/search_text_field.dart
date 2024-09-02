import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController inputController;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final Color? fillColor, enabledBorderColor, focusedBorderColor;
  final double? borderRadius;

  const SearchTextField(
      {super.key,
      required this.inputController,
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.fillColor,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    final Widget baseTextField = BaseTextField(
      controller: inputController,
      hintText: "search".tr(),
      fillColor: fillColor,
      enabledBorderColor: enabledBorderColor,
      focusedBorderColor: focusedBorderColor,
      borderRadius: borderRadius,
      validator: (value) {
        return null;
      },
      keyboardType: keyboardType,
      onChanged: onChanged,
      prefixWidget: Icon(
        Icons.search,
        size: 20,
        color: SaayerTheme().getColorsPalette.greyColor,
      ),
    );
    return baseTextField;
  }
}
