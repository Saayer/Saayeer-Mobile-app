import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/text_fields/drop_down_text_field.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/features/address/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart';

class ItemsDropDownTextField extends StatelessWidget {
  final void Function(AddressLookUpDto) onSelected;
  final AddressLookUpDto? selectedItem;
  final AddAddressFieldsTypes addAddressFieldsType;
  final AddAddressBloc addressWidgetsBloc;

  const ItemsDropDownTextField(
      {super.key,
      required this.onSelected,
      this.selectedItem,
      required this.addAddressFieldsType,
      required this.addressWidgetsBloc});

  @override
  Widget build(BuildContext context) {
    return DropDownTextField<AddressLookUpDto>(
      label: getFieldLabel(),
      inputController: TextEditingController(
          text: selectedItem != null ? (Localization.isEnglish() ? selectedItem!.nameEn : selectedItem!.nameAr) : ""),
      onSelected: (v) => onSelected(v),
      items: getList(addressWidgetsBloc).isNotEmpty
          ? List.generate(getList(addressWidgetsBloc).length, (index) {
              final AddressLookUpDto item = getList(addressWidgetsBloc)[index];
              return item;
            })
          : [],
      getItemName: (val) {
        return Localization.isEnglish() ? val.nameEn ?? '' : val.nameAr ?? '';
      },
      getIsSelectedItem: (val) {
        return val == selectedItem;
      },
      showSearch: true,
      onSearch: (val, searchStr) {
        log(searchStr, name: "items");
        return (Localization.isEnglish() ? val.nameEn : val.nameAr)!.contains(searchStr);
      },
    );
  }

  String getFieldLabel() {
    switch (addAddressFieldsType) {
      case AddAddressFieldsTypes.COUNTRY:
        {
          return "country".tr();
        }
      case AddAddressFieldsTypes.GOVERNORATE:
        {
          return "governorate".tr();
        }
      case AddAddressFieldsTypes.CITY:
        {
          return "city".tr();
        }
      case AddAddressFieldsTypes.AREA:
        {
          return "area".tr();
        }
      default:
        {
          return '';
        }
    }
  }

  List<AddressLookUpDto> getList(AddAddressBloc addressWidgetsBloc) {
    switch (addAddressFieldsType) {
      case AddAddressFieldsTypes.COUNTRY:
        {
          return addressWidgetsBloc.countriesList;
        }
      case AddAddressFieldsTypes.GOVERNORATE:
        {
          return addressWidgetsBloc.governoratesList;
        }
      case AddAddressFieldsTypes.CITY:
        {
          return addressWidgetsBloc.citiesList;
        }
      case AddAddressFieldsTypes.AREA:
        {
          return addressWidgetsBloc.areasList;
        }
      default:
        {
          return [];
        }
    }
  }
}
