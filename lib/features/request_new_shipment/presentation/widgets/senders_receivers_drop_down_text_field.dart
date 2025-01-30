import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/features/request_new_shipment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/presentation/widgets/drop_down_text_field_widget.dart';

class SendersReceiversDropDownTextField extends StatelessWidget {
  final void Function(CustomerGetDto) onCustomerAddressSelected;
  final void Function(StoreGetDto) onStoreAddressSelected;
  final CustomerGetDto? selectedCustomerAddress;
  final StoreGetDto? selectedStoreAddress;
  final SenderReceiverType senderReceiverType;
  final RequestShipmentTypes requestShipmentTypes;
  final RequestNewShipmentBloc bloc;
  final bool? withValidator;
  final bool? isFieldRequired;
  final bool? hasLabel;
  final bool? hasMargin;
  final String? Function(String?)? validator;

  const SendersReceiversDropDownTextField(
      {super.key,
      required this.onCustomerAddressSelected,
      required this.onStoreAddressSelected,
      this.withValidator,
      this.selectedCustomerAddress,
      this.selectedStoreAddress,
      this.isFieldRequired,
      this.hasLabel,
      this.hasMargin,
      this.validator,
      required this.senderReceiverType,
      required this.requestShipmentTypes,
      required this.bloc});

  @override
  Widget build(BuildContext context) {
    return DropDownTextFieldWidget(
      scrollController: requestShipmentTypes == RequestShipmentTypes.sender
          ? bloc.senderCustomersScrollController
          : bloc.receiverCustomersScrollController,
      senderReceiverType: senderReceiverType,
      label: getFieldLabel(),
      hasLabel: hasLabel,
      isFieldRequired: isFieldRequired,
      hasMargin: hasMargin,
      inputController: TextEditingController(
          text: (senderReceiverType == SenderReceiverType.customer
              ? (selectedCustomerAddress != null ? selectedCustomerAddress!.fullName : "")
              : (selectedStoreAddress != null ? selectedStoreAddress!.name : ""))),
      onSelected: (v) =>
          senderReceiverType == SenderReceiverType.customer ? onCustomerAddressSelected(v) : onStoreAddressSelected(v),
      withValidator: withValidator,
      validator: validator,
      items: getList().isNotEmpty
          ? List.generate(getList().length, (index) {
              final item = getList()[index];
              return item;
            })
          : [],
      getItemName: (val) {
        return senderReceiverType == SenderReceiverType.customer ? val.fullName ?? '' : val.name ?? '';
      },
      getIsSelectedItem: (val) {
        return val ==
            (senderReceiverType == SenderReceiverType.customer ? selectedCustomerAddress : selectedStoreAddress);
      },
      showSearch: true,
      onSearch: (val, searchStr) {
        log(searchStr, name: "items");
        return (senderReceiverType == SenderReceiverType.customer ? val.fullName ?? '' : val.name ?? '')
            .contains(searchStr);
      },
    );
  }

  String getFieldLabel() {
    switch (senderReceiverType) {
      case SenderReceiverType.customer:
        {
          return "customers".tr();
        }
      case SenderReceiverType.store:
        {
          return "stores".tr();
        }
      }
  }

  List<dynamic> getList() {
    switch (senderReceiverType) {
      case SenderReceiverType.customer:
        {
          return requestShipmentTypes == RequestShipmentTypes.sender
              ? bloc.senderCustomersList
              : bloc.receiverCustomersList;
        }
      case SenderReceiverType.store:
        {
          return requestShipmentTypes == RequestShipmentTypes.sender
              ? bloc.senderStoresList
              : bloc.receiverStoresList;
        }
      }
  }
}
