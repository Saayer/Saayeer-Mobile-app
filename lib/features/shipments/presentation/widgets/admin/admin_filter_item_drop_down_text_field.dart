import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/text_fields/drop_down_text_field.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';

class AdminFilterItemDropDownTextField<T> extends StatelessWidget {
  final void Function(T) onSelected;
  final T? selectedItem;
  final AdminShipmentsFilterTypes adminShipmentsFilterTypes;
  final ShipmentsBloc bloc;
  final bool? withValidator;
  final bool? isFieldRequired;
  final bool? hasLabel;
  final bool? hasMargin;
  const AdminFilterItemDropDownTextField({super.key,
    required this.onSelected,
    this.withValidator,
    this.selectedItem,
    this.isFieldRequired,
    this.hasLabel,
    this.hasMargin,
    required this.adminShipmentsFilterTypes,
    required this.bloc,});

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
        return adminShipmentsFilterTypes == AdminShipmentsFilterTypes.CLIENT
            ? (val as ClientNamesRespnse).label!.contains(searchStr)
            : adminShipmentsFilterTypes == AdminShipmentsFilterTypes.SERVICE_PROVIDER
            ? (val as LogisticsServiceBase).name!.contains(searchStr)
            : (val as ShipmentStatusEnum).name.contains(searchStr);
      },
    );
  }

  String getFieldLabel() {
    switch (adminShipmentsFilterTypes) {
      case AdminShipmentsFilterTypes.CLIENT:
        {
          return "client".tr();
        }
      case AdminShipmentsFilterTypes.SERVICE_PROVIDER:
        {
          return "service_provider".tr();
        }
      case AdminShipmentsFilterTypes.STATUS:
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
    switch (adminShipmentsFilterTypes) {
      case AdminShipmentsFilterTypes.CLIENT:
        {
          return bloc.clientsList;
        }
      case AdminShipmentsFilterTypes.SERVICE_PROVIDER:
        {
          return bloc.adminServiceProvidersList;
        }
      case AdminShipmentsFilterTypes.STATUS:
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
      switch (adminShipmentsFilterTypes) {
        case AdminShipmentsFilterTypes.CLIENT:
          {
            return (selectedItem as ClientNamesRespnse).label ?? '';
          }
        case AdminShipmentsFilterTypes.SERVICE_PROVIDER:
          {
            return (selectedItem as LogisticsServiceBase).name ?? '';
          }
        case AdminShipmentsFilterTypes.STATUS:
          {
            return (selectedItem as ShipmentStatusEnum).name.tr();
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
    switch (adminShipmentsFilterTypes) {
      case AdminShipmentsFilterTypes.CLIENT:
        {
          return (val as ClientNamesRespnse).label ?? '';
        }
      case AdminShipmentsFilterTypes.SERVICE_PROVIDER:
        {
          return (val as LogisticsServiceBase).name ?? '';
        }
      case AdminShipmentsFilterTypes.STATUS:
        {
          return (val as ShipmentStatusEnum).name.tr();
        }
      default:
        {
          return '';
        }
    }
  }
}
