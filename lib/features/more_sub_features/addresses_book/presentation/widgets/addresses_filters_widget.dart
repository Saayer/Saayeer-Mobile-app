import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:openapi/openapi.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/address_widgets/presentation/widgets/items_drop_down_text_field.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/generic_expansionTile_widget.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart';
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
      child: GenericExpansionTileWidget(title: 'search'.tr(), iconPath: '', children: [
        ///
        ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.equals(name: DESKTOP, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 5,
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
          columnSpacing: 5,
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

        ///
        Align(
          alignment: Alignment.center,
          child: SaayerDefaultTextButton(
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
              btnWidth: ResponsiveBreakpoints.of(context).screenWidth / 2,
              btnHeight: 50),
        )
      ]),
    );
  }

  _buildFirstFiltersRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
            child: BaseTextField(
          hintText: 'search'.tr(),
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
            withValidator: false,
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
        Expanded(
            child: ItemsDropDownTextField<AddressesBookBloc>(
          bloc: widget.addressesBookBloc,
          withValidator: false,
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
        Expanded(
            child: ItemsDropDownTextField<AddressesBookBloc>(
          bloc: widget.addressesBookBloc,
          withValidator: false,
          onSelected: (val) {
            widget.addressesBookBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
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
}
