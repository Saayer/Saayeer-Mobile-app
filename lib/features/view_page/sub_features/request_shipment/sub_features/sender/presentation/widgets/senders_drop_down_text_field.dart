import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/text_fields/drop_down_text_field.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/data/core/utils/enums.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart';

class SendersDropDownTextField extends StatelessWidget {
  final void Function(CustomerGetDto) onCustomerAddressSelected;
  final void Function(StoreGetDto) onStoreAddressSelected;
  final CustomerGetDto? selectedCustomerAddress;
  final StoreGetDto? selectedStoreAddress;
  final SenderReceiverType senderType;
  final RequestShipmentBloc bloc;
  final bool? withValidator;
  final bool? isFieldRequired;
  final bool? hasLabel;
  final bool? hasMargin;

  const SendersDropDownTextField(
      {super.key,
      required this.onCustomerAddressSelected,
      required this.onStoreAddressSelected,
      this.withValidator,
      this.selectedCustomerAddress,
      this.selectedStoreAddress,
      this.isFieldRequired,
      this.hasLabel,
      this.hasMargin,
      required this.senderType,
      required this.bloc});

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      label: getFieldLabel(),
      hasLabel: hasLabel,
      isFieldRequired: isFieldRequired,
      hasMargin: hasMargin,
      inputController: TextEditingController(
          text: (senderType == SenderReceiverType.customer
              ? (selectedCustomerAddress != null ? selectedCustomerAddress!.fullName : "")
              : (selectedStoreAddress != null ? selectedStoreAddress!.name : ""))),
      onSelected: (v) => senderType == SenderReceiverType.customer ? onCustomerAddressSelected(v) : onStoreAddressSelected(v),
      withValidator: withValidator,
      items: getList().isNotEmpty
          ? List.generate(getList().length, (index) {
              final item = getList()[index];
              return item;
            })
          : [],
      getItemName: (val) {
        return senderType == SenderReceiverType.customer ? val.fullName ?? '' : val.name ?? '';
      },
      getIsSelectedItem: (val) {
        return val == (senderType == SenderReceiverType.customer ? selectedCustomerAddress : selectedStoreAddress);
      },
      showSearch: true,
      onSearch: (val, searchStr) {
        log(searchStr, name: "items");
        return (senderType == SenderReceiverType.customer ? val.fullName ?? '' : val.name ?? '').contains(searchStr);
      },
    );
  }

  String getFieldLabel() {
    switch (senderType) {
      case SenderReceiverType.customer:
        {
          return "customers".tr();
        }
      case SenderReceiverType.store:
        {
          return "stores".tr();
        }
      default:
        {
          return '';
        }
    }
  }

  List<dynamic> getList() {
    switch (senderType) {
      case SenderReceiverType.customer:
        {
          return bloc.senderCustomersList;
        }
      case SenderReceiverType.store:
        {
          return bloc.senderStoresList;
        }
      default:
        {
          return [];
        }
    }
  }
}
