import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/bottom_sheet_widget.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class DropDownTextField<T> extends StatelessWidget {
  final String label;
  final TextEditingController inputController;
  final void Function(T) onSelected;
  final TextInputType keyboardType;
  final bool showOnlyTextField;
  final Color? fillColor, enabledBorderColor, focusedBorderColor;
  final double? borderRadius;
  final List<T> items;
  final String Function(T) getItemName;
  final bool Function(T) getIsSelectedItem;

  const DropDownTextField(
      {super.key,
      required this.label,
      required this.inputController,
      required this.onSelected,
      this.keyboardType = TextInputType.text,
      this.showOnlyTextField = false,
      this.fillColor,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.borderRadius,
      required this.items,
      required this.getItemName,
      required this.getIsSelectedItem});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final Widget baseTextField = BaseTextField(
      controller: inputController,
      hintText: label.tr(),
      fillColor: fillColor,
      enabledBorderColor: enabledBorderColor,
      focusedBorderColor: focusedBorderColor,
      borderRadius: borderRadius,
      isReadOnly: true,
      onTap: () {
        final Widget childWidget = ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final T item = items[index];
              final String itemName = getItemName(item);
              final bool isSelected = getIsSelectedItem(item);
              return GestureDetector(
                onTap: () {
                  onSelected(item);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(itemName,
                          textAlign: TextAlign.start,
                          style: AppTextStyles.label()),
                      Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: isSelected
                            ? SaayerTheme().getColorsPalette.primaryColor
                            : SaayerTheme().getColorsPalette.greyColor,
                        size: 30.r,
                      ),
                    ],
                  ),
                ),
              );
            });
        showBottomSheetWidget(context, childWidget, height / 2);
      },
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'empty_field_error'.tr().replaceFirst("{}", "input".tr());
        }
        return null;
      },
      keyboardType: keyboardType,
      onChanged: (val) {},
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
          margin: EdgeInsets.only(top: 8.h, right: 16.w, left: 16.w),
          child: baseTextField,
        ),
      ],
    );
  }
}
