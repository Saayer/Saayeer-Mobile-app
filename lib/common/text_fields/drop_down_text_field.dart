import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/bottom_sheet/bottom_sheet_widget.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';
import 'package:saayer/common/text_fields/search_text_field.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class DropDownTextField<T> extends StatefulWidget {
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
  final bool? showSearch;
  final bool? withValidator;
  final bool? isFieldRequired;
  final bool? hasLabel;
  final bool? hasMargin;
  final bool Function(T, String)? onSearch;
  final ScrollController? scrollController;

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
      required this.getIsSelectedItem,
      this.showSearch = false,
      this.withValidator,
      this.isFieldRequired,
      this.hasMargin,
      this.hasLabel,
      this.scrollController,
      this.onSearch});

  @override
  State<DropDownTextField<T>> createState() => _DropDownTextFieldState<T>();
}

class _DropDownTextFieldState<T> extends State<DropDownTextField<T>> {
  TextEditingController searchTextController = TextEditingController(text: "");
  List<T> filteredItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      filteredItems = [...widget.items];
      //log("${filteredItems.length}", name: "filteredItems -->");
    });
  }

  @override
  void didUpdateWidget(covariant DropDownTextField<T> oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      setState(() {
        filteredItems = [...widget.items];
        //log("${filteredItems.length}", name: "filteredItems -->");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    final Widget baseTextField = BaseTextField(
      controller: widget.inputController,
      hintText: widget.label.tr(),
      fillColor: widget.fillColor,
      enabledBorderColor: widget.enabledBorderColor,
      focusedBorderColor: widget.focusedBorderColor,
      borderRadius: widget.borderRadius,
      isReadOnly: true,
      onTap: () {
        showBottomSheetWidget(
            context,
            StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SearchTextField(
                      inputController: searchTextController,
                      onChanged: (val) {
                        log(val, name: "SearchTextField");
                        setState(() {
                          searchTextController.text = val;
                          TextSelection previousSelection = searchTextController.selection;
                          searchTextController.selection = previousSelection;
                          filteredItems.clear();
                          filteredItems.addAll(widget.items.where((element) =>
                              widget.onSearch != null ? widget.onSearch!(element, searchTextController.text) : true));
                        });
                      },
                    ),
                  ),
                  Expanded(child: _getListView),
                ],
              );
            }),
            height / 1.5,
            () {
              searchTextController.clear();
              setState(() {});
            });
      },
      validator: !(widget.withValidator ?? true)
          ? null
          : (value) {
              if (value?.isEmpty ?? true) {
                return 'empty_field_error'.tr().replaceFirst("{}", widget.label);
              }
              return null;
            },
      keyboardType: widget.keyboardType,
      onChanged: (val) {},
    );
    if (widget.showOnlyTextField) {
      return baseTextField;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        (widget.hasLabel ?? true)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LabelTxt(txt: (widget.isFieldRequired ?? false) ? '${widget.label.tr()} *' : widget.label.tr()),
                ],
              )
            : Container(),
        Container(
          margin: (widget.hasMargin ?? true) ? const EdgeInsets.only(top: 5, right: 10, left: 10) : EdgeInsets.zero,
          child: baseTextField,
        ),
      ],
    );
  }

  Widget get _getListView {
    return ListView.builder(
        controller: widget.scrollController,
        shrinkWrap: true,
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final T item = filteredItems[index];
          final String itemName = widget.getItemName(item);
          final bool isSelected = widget.getIsSelectedItem(item);
          // final isShowItem = widget.onSearch != null
          //     ? widget.onSearch!(item, searchTextController.text)
          //     : true;
          // if (!isShowItem) {
          //   return SizedBox();
          // }
          return GestureDetector(
            onTap: () {
              widget.onSelected(item);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(itemName, textAlign: TextAlign.start, style: AppTextStyles.label()),
                  Icon(
                    isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                    color: isSelected
                        ? SaayerTheme().getColorsPalette.primaryColor
                        : SaayerTheme().getColorsPalette.greyColor,
                    size: 30,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
