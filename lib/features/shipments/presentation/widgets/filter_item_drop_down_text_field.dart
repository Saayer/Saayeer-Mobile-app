import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/text_fields/drop_down_text_field.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';

class FilterItemsDropDownTextField<T> extends StatelessWidget {
  final void Function(T) onSelected;
  final T? selectedItem;
  final ShipmentsFilterTypes shipmentsFilterTypes;
  final ShipmentsListTypes shipmentsListTypes;
  final ShipmentsBloc bloc;
  final bool? withValidator;
  final bool? isFieldRequired;
  final bool? hasLabel;
  final bool? hasMargin;

  const FilterItemsDropDownTextField(
      {super.key,
      required this.onSelected,
      this.withValidator,
      this.selectedItem,
      this.isFieldRequired,
      this.hasLabel,
      this.hasMargin,
      required this.shipmentsFilterTypes,
      required this.shipmentsListTypes,
      required this.bloc});

  @override
  Widget build(BuildContext context) {
    return DropDownTextField<T>(
      label: getFieldLabel(),
      hasLabel: hasLabel,
      isFieldRequired: isFieldRequired,
      hasMargin: hasMargin,
      inputController: TextEditingController(text: getSelectedItemName()),
      onSelected: (v) => onSelected(v),
      withValidator: withValidator,
      items: getList(bloc).isNotEmpty
          ? List.generate(getList(bloc).length, (index) {
              final T item = getList(bloc)[index];
              return item;
            })
          : [],
      getItemName: (val) {
        return getItemName(val);
      },
      getIsSelectedItem: (val) {
        return val == selectedItem;
      },
      showSearch: true,
      onSearch: (val, searchStr) {
        log(searchStr, name: "items");
        return shipmentsFilterTypes == ShipmentsFilterTypes.STORE
            ? (val as StoreGetDto).name!.contains(searchStr)
            : shipmentsFilterTypes == ShipmentsFilterTypes.SERVICE_PROVIDER
                ? (val as LogisticsServiceBase).name!.contains(searchStr)
                : (val as ShipmentStatus).name.contains(searchStr);
      },
    );
  }

  String getFieldLabel() {
    switch (shipmentsFilterTypes) {
      case ShipmentsFilterTypes.STORE:
        {
          return "store".tr();
        }
      case ShipmentsFilterTypes.SERVICE_PROVIDER:
        {
          return "service_provider".tr();
        }
      case ShipmentsFilterTypes.STATUS:
        {
          return "status".tr();
        }
      default:
        {
          return '';
        }
    }
  }

  List<dynamic> getList(ShipmentsBloc bloc) {
    switch (shipmentsFilterTypes) {
      case ShipmentsFilterTypes.STORE:
        {
          return shipmentsListTypes == ShipmentsListTypes.EXPORT ? bloc.exportStoresList : bloc.importStoresList;
        }
      case ShipmentsFilterTypes.SERVICE_PROVIDER:
        {
          return shipmentsListTypes == ShipmentsListTypes.EXPORT
              ? bloc.exportServiceProvidersList
              : bloc.importServiceProvidersList;
        }
      case ShipmentsFilterTypes.STATUS:
        {
          return bloc.shipmentStatusList;
        }
      default:
        {
          return [];
        }
    }
  }

  String getSelectedItemName() {
    if (selectedItem != null) {
      switch (shipmentsFilterTypes) {
        case ShipmentsFilterTypes.STORE:
          {
            return (selectedItem as StoreGetDto).name ?? '';
          }
        case ShipmentsFilterTypes.SERVICE_PROVIDER:
          {
            return (selectedItem as LogisticsServiceBase).name ?? '';
          }
        case ShipmentsFilterTypes.STATUS:
          {
            return (selectedItem as ShipmentStatus).name;
          }
        default:
          {
            return '';
          }
      }
    } else {
      return "";
    }
  }

  String getItemName(T val) {
    switch (shipmentsFilterTypes) {
      case ShipmentsFilterTypes.STORE:
        {
          return (val as StoreGetDto).name ?? '';
        }
      case ShipmentsFilterTypes.SERVICE_PROVIDER:
        {
          return (val as LogisticsServiceBase).name ?? '';
        }
      case ShipmentsFilterTypes.STATUS:
        {
          return (val as ShipmentStatus).name;
        }
      default:
        {
          return '';
        }
    }
  }
}
