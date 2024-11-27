import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:openapi/openapi.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/address_widgets/presentation/widgets/items_drop_down_text_field.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/generic_expansionTile_widget.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/addresses_book/presentation/bloc/addresses_book_bloc.dart';
import 'dart:ui' as ui;

class AddressesFiltersWidget extends StatefulWidget {
  final AddressesBookBloc addressesBookBloc;

  const AddressesFiltersWidget({super.key, required this.addressesBookBloc});

  @override
  State<AddressesFiltersWidget> createState() => _AddressesFiltersWidgetState();
}

class _AddressesFiltersWidgetState extends State<AddressesFiltersWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: GenericExpansionTileWidget(
          title: 'search'.tr(),
          selectedFilterCount: _getCountOfSelectedFilter(),
          iconPath: Constants.getIconPath('ic_filter.svg'),
          iconColor: SaayerTheme().getColorsPalette.primaryColor,
          children: [
            ///
            ResponsiveRowColumn(
              layout: ResponsiveValue(context,
                      conditionalValues: [const Condition.equals(name: DESKTOP, value: ResponsiveRowColumnType.ROW)],
                      defaultValue: ResponsiveRowColumnType.COLUMN)
                  .value,
              columnVerticalDirection: VerticalDirection.down,
              columnSpacing: 5,
              rowSpacing: 10,
              children: [
                ResponsiveRowColumnItem(
                  rowFit: FlexFit.loose,

                  /// Search By Text & Search by Phone
                  child: _buildFirstFiltersRow(),
                ),
                ResponsiveRowColumnItem(
                    rowFit: FlexFit.loose,

                    /// Country & Governorate & City
                    child: _buildSecondFiltersRow())
              ],
            ),
            const SizedBox(height: 10),

            ///
            ResponsiveRowColumn(
              layout: ResponsiveValue(context,
                      conditionalValues: [const Condition.equals(name: DESKTOP, value: ResponsiveRowColumnType.ROW)],
                      defaultValue: ResponsiveRowColumnType.COLUMN)
                  .value,
              columnVerticalDirection: VerticalDirection.down,
              columnSpacing: 10,
              rowSpacing: 10,
              children: [
                ResponsiveRowColumnItem(
                  rowFit: FlexFit.loose,

                  /// Search By Shipments (From - To) Date
                  child: _buildShipmentsDateFilter(),
                ),
                ResponsiveRowColumnItem(
                    rowFit: FlexFit.loose,

                    /// Search By Total Shipments Min/MX than
                    child: _buildTotalShipmentsFilters())
              ],
            ),

            ///
            const SizedBox(height: 10),

            ///Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///reset filter
                MaterialButton(
                  onPressed: () {
                    _resetFilter();
                  },
                  height: 50,
                  minWidth: 90,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: SaayerTheme().getColorsPalette.primaryColor),
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: GenericSvgWidget(
                      path: Constants.getIconPath('ic_clear_filter.svg'),
                      size: 30,
                      color: SaayerTheme().getColorsPalette.primaryColor),
                ),
                const SizedBox(width: 8),
                SaayerDefaultTextButton(
                    text: 'search'.tr(),
                    isEnabled: true,
                    borderRadius: 16,
                    onPressed: () {
                      final bool isFormValid = (formKey.currentState!.validate());
                      if (isFormValid) {
                        widget.addressesBookBloc.add(const ResetList());
                        widget.addressesBookBloc.add(const GetAddresses());
                      }
                    },
                    btnWidth: 90,
                    btnHeight: 50),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
    );
  }

  _buildFirstFiltersRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
            child: BaseTextField(
          hintText: 'search_hint'.tr(),
          controller: widget.addressesBookBloc.searchController,
          onChanged: (val) {},
          validator: null,
          keyboardType: TextInputType.text,
        )),
        const SizedBox(width: 8),
        Expanded(
            child: Directionality(
          textDirection: ui.TextDirection.ltr,
          child: PhoneTextField(
            phoneNumController: TextEditingController(),
            withValidator: false,
            onInputChanged: (PhoneNumber phoneNumber) {
              log("dialCode: ${phoneNumber.dialCode} - isoCode: ${phoneNumber.isoCode} - phoneNumber: ${phoneNumber.phoneNumber}",
                  name: "onInputChanged --->");
              log("${phoneNumber.phoneNumber}", name: "PhoneTextField onInputChanged ->");
              widget.addressesBookBloc.add(OnFilterTextChange(
                  phoneNumber: phoneNumber,
                  addAddressFieldsType: AddAddressFieldsTypes.MOBILE,
                  textEditingController: TextEditingController()));
            },
          ),
        ))
      ],
    );
  }

  _buildSecondFiltersRow() {
    return Row(
      children: [
        Expanded(
          child: ItemsDropDownTextField<AddressesBookBloc>(
            bloc: widget.addressesBookBloc,
            hasLabel: false,
            withValidator: false,
            hasMargin: false,
            onSelected: (val) {
              widget.addressesBookBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
                addAddressFieldsType: AddAddressFieldsTypes.COUNTRY,
                item: val,
              ));

              ///
              widget.addressesBookBloc.add(const GetGovernorates());
            },
            addAddressFieldsType: AddAddressFieldsTypes.COUNTRY,
            selectedItem: widget.addressesBookBloc.selectedCountry,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: ItemsDropDownTextField<AddressesBookBloc>(
          bloc: widget.addressesBookBloc,
          hasLabel: false,
          withValidator: false,
          hasMargin: false,
          onSelected: (val) {
            widget.addressesBookBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
              addAddressFieldsType: AddAddressFieldsTypes.GOVERNORATE,
              item: val,
            ));

            ///
            widget.addressesBookBloc.add(const GetCities());
          },
          addAddressFieldsType: AddAddressFieldsTypes.GOVERNORATE,
          selectedItem: widget.addressesBookBloc.selectedGovernorate,
        )),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: ItemsDropDownTextField<AddressesBookBloc>(
          bloc: widget.addressesBookBloc,
          hasLabel: false,
          withValidator: false,
          hasMargin: false,
          onSelected: (val) {
            widget.addressesBookBloc.add(OnItemSelectedFromDropDown<CityGetDto>(
              addAddressFieldsType: AddAddressFieldsTypes.CITY,
              item: val,
            ));
          },
          addAddressFieldsType: AddAddressFieldsTypes.CITY,
          selectedItem: widget.addressesBookBloc.selectedCity,
        ))
      ],
    );
  }

  _buildShipmentsDateFilter() {
    return Row(
      children: [
        Expanded(
            child: BaseTextField(
          hintText: 'select_date_from'.tr(),
          controller: widget.addressesBookBloc.shipmentDateFromController,
          isReadOnly: true,
          onTap: () async {
            DateTime? res = await showDate();
            widget.addressesBookBloc.shipmentDateFromController.text = DateTimeUtil.dMyString(res);
            widget.addressesBookBloc.shipmentDateFrom = DateTimeUtil.toUtcDateTime(DateTimeUtil.dMyString(res));
          },
          onChanged: (val) {},
          validator: null,
          keyboardType: TextInputType.text,
        )),
        const SizedBox(width: 8),
        Expanded(
            child: BaseTextField(
          hintText: 'select_date_to'.tr(),
          controller: widget.addressesBookBloc.shipmentDateToController,
          isReadOnly: true,
          onTap: () async {
            DateTime? res = await showDate();
            widget.addressesBookBloc.shipmentDateToController.text = DateTimeUtil.dMyString(res);
            widget.addressesBookBloc.shipmentDateTo = DateTimeUtil.toUtcDateTime(DateTimeUtil.dMyString(res));
          },
          onChanged: (val) {},
          validator: null,
          keyboardType: TextInputType.text,
        ))
      ],
    );
  }

  _buildTotalShipmentsFilters() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
            child: BaseTextField(
          hintText: 'total_shipments_min'.tr(),
          controller: widget.addressesBookBloc.totalShipmentsMin,
          onChanged: (val) {},
          validator: (value) {
            if (value?.isNotEmpty ?? true) {
              if (widget.addressesBookBloc.totalShipmentsMax.text.isNotEmpty) {
                if (int.parse(value!) >= int.parse(widget.addressesBookBloc.totalShipmentsMax.text)) {
                  return 'total_shipments_min_error'.tr();
                }
              }
            }
            return null;
          },
          keyboardType: TextInputType.number,
        )),
        const SizedBox(width: 8),
        Expanded(
            child: BaseTextField(
          hintText: 'total_shipments_max'.tr(),
          controller: widget.addressesBookBloc.totalShipmentsMax,
          onChanged: (val) {},
          validator: (value) {
            if (value?.isNotEmpty ?? true) {
              if (widget.addressesBookBloc.totalShipmentsMin.text.isNotEmpty) {
                if (int.parse(value!) <= int.parse(widget.addressesBookBloc.totalShipmentsMin.text)) {
                  return 'total_shipments_max_error'.tr();
                }
              }
            }
            return null;
          },
          keyboardType: TextInputType.number,
        ))
      ],
    );
  }

  Future<DateTime?> showDate() async {
    DateTime now = DateTime.now();
    return await showDatePicker(context: context, firstDate: DateTime(2023), lastDate: now);
  }

  void _resetFilter() {
    widget.addressesBookBloc.searchController.clear();
    widget.addressesBookBloc.shipmentDateFromController.clear();
    widget.addressesBookBloc.shipmentDateToController.clear();
    widget.addressesBookBloc.totalShipmentsMin.clear();
    widget.addressesBookBloc.totalShipmentsMax.clear();
    widget.addressesBookBloc.cityController.clear();
    widget.addressesBookBloc.countryController.clear();
    widget.addressesBookBloc.governorateController.clear();
    widget.addressesBookBloc.shipmentDateFrom = null;
    widget.addressesBookBloc.shipmentDateTo = null;
    widget.addressesBookBloc.mobile = '';
    widget.addressesBookBloc.selectedCountry = null;
    widget.addressesBookBloc.selectedGovernorate = null;
    widget.addressesBookBloc.selectedCity = null;
    widget.addressesBookBloc.governoratesList.clear();
    widget.addressesBookBloc.citiesList.clear();
    setState(() {});
  }

  String? _getCountOfSelectedFilter() {
    int count = 0;
    if (widget.addressesBookBloc.searchController.text.isNotEmpty) {
      count = count + 1;
    }
    if (widget.addressesBookBloc.shipmentDateFromController.text.isNotEmpty) {
      count = count + 1;
    }
    if (widget.addressesBookBloc.shipmentDateToController.text.isNotEmpty) {
      count = count + 1;
    }
    if (widget.addressesBookBloc.totalShipmentsMin.text.isNotEmpty) {
      count = count + 1;
    }
    if (widget.addressesBookBloc.totalShipmentsMax.text.isNotEmpty) {
      count = count + 1;
    }
    if (widget.addressesBookBloc.mobile.isNotEmpty) {
      count = count + 1;
    }
    if (widget.addressesBookBloc.selectedCountry != null) {
      count = count + 1;
    }
    if (widget.addressesBookBloc.selectedGovernorate != null) {
      count = count + 1;
    }
    if (widget.addressesBookBloc.selectedCity != null) {
      count = count + 1;
    }
    return count == 0 ? '' : count.toString();
  }
}
