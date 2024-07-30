import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/text_fields/drop_down_text_field.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/features/address/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart';

class ItemsDropDownTextField<T> extends StatelessWidget {
  final void Function(AddressLookUpDto) onSelected;
  final AddressLookUpDto? selectedItem;
  final AddAddressFieldsTypes addAddressFieldsType;
  final T bloc;

  const ItemsDropDownTextField(
      {super.key, required this.onSelected, this.selectedItem, required this.addAddressFieldsType, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return DropDownTextField<AddressLookUpDto>(
      label: getFieldLabel(),
      inputController: TextEditingController(
          text: selectedItem != null ? (Localization.isEnglish() ? selectedItem!.nameEn : selectedItem!.nameAr) : ""),
      onSelected: (v) => onSelected(v),
      items: getList(bloc).isNotEmpty
          ? List.generate(getList(bloc).length, (index) {
              final AddressLookUpDto item = getList(bloc)[index];
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

  List<AddressLookUpDto> getList(T bloc) {
    if (bloc is AddAddressBloc) {
      switch (addAddressFieldsType) {
        case AddAddressFieldsTypes.COUNTRY:
          {
            return bloc.countriesList;
          }
        case AddAddressFieldsTypes.GOVERNORATE:
          {
            return bloc.governoratesList;
          }
        case AddAddressFieldsTypes.CITY:
          {
            return bloc.citiesList;
          }
        case AddAddressFieldsTypes.AREA:
          {
            return bloc.areasList;
          }
        default:
          {
            return [];
          }
      }
    } else if (bloc is AddressesBookBloc) {
      switch (addAddressFieldsType) {
        case AddAddressFieldsTypes.COUNTRY:
          {
            return bloc.countriesList;
          }
        case AddAddressFieldsTypes.GOVERNORATE:
          {
            return bloc.governoratesList;
          }
        case AddAddressFieldsTypes.CITY:
          {
            return bloc.citiesList;
          }
        case AddAddressFieldsTypes.AREA:
          {
            return bloc.areasList;
          }
        default:
          {
            return [];
          }
      }
    } else {
      return [];
    }
  }
}
