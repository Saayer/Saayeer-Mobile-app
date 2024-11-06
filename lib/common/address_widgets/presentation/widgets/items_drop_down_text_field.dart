import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/text_fields/drop_down_text_field.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_edit_address/presentation/bloc/add_edit_address_bloc.dart';
import 'package:saayer/features/address/addresses_book/presentation/bloc/addresses_book_bloc.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/presentation/bloc/add_edit_store_bloc.dart';

class ItemsDropDownTextField<T> extends StatelessWidget {
  final void Function(dynamic) onSelected;
  final dynamic selectedItem;
  final AddAddressFieldsTypes addAddressFieldsType;
  final T bloc;
  final bool? withValidator;
  final bool? isFieldRequired;
  final bool? hasLabel;
  final bool? hasMargin;

  const ItemsDropDownTextField(
      {super.key,
      required this.onSelected,
      this.withValidator,
      this.selectedItem,
      this.isFieldRequired,
      this.hasLabel,
      this.hasMargin,
      required this.addAddressFieldsType,
      required this.bloc});

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      label: getFieldLabel(),
      hasLabel: hasLabel,
      isFieldRequired: isFieldRequired,
      hasMargin: hasMargin,
      inputController: TextEditingController(
          text: selectedItem != null ? (Localization.isEnglish() ? selectedItem!.nameEn : selectedItem!.nameAr) : ""),
      onSelected: (v) => onSelected(v),
      withValidator: withValidator,
      items: getList(bloc).isNotEmpty
          ? List.generate(getList(bloc).length, (index) {
              final dynamic item = getList(bloc)[index];
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
      default:
        {
          return '';
        }
    }
  }

  List<dynamic> getList(T bloc) {
    if (bloc is AddEditAddressBloc) {
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
        default:
          {
            return [];
          }
      }
    } else if (bloc is AddEditStoreBloc) {
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
