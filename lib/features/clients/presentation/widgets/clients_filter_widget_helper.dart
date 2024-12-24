import 'dart:developer';

import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/features/clients/core/utils/enums/enums.dart';
import 'package:saayer/features/clients/presentation/bloc/clients_bloc.dart';

class ClientsFilterWidgetHelper {
  final ClientsFilterTypes clientsFilterTypes;
  final ClientsBloc clientsBloc;

  ClientsFilterWidgetHelper({
    required this.clientsFilterTypes,
    required this.clientsBloc,
  });

  getFilterItem(BuildContext context) {
    switch (clientsFilterTypes) {
      case ClientsFilterTypes.SEARCH:
        {
          return _getSearchTextField();
        }
      case ClientsFilterTypes.MOBILE:
        {
          return _getMobileTextField();
        }
      case ClientsFilterTypes.TOTAL_SHIPMENTS_MIN:
        {
          return _getTotalShipmentsMinTextField(context);
        }
      case ClientsFilterTypes.TOTAL_SHIPMENTS_MAX:
        {
          return _getTotalShipmentsMaxTextField(context);
        }
    }
  }

  TextEditingController _getInputController() {
    switch (clientsFilterTypes) {
      case ClientsFilterTypes.SEARCH:
        {
          return clientsBloc.clientsSearchController;
        }
      case ClientsFilterTypes.MOBILE:
        {
          return clientsBloc.clientPhoneController;
        }
      case ClientsFilterTypes.TOTAL_SHIPMENTS_MIN:
        {
          return clientsBloc.clientsTotalShipmentMinController;
        }
      case ClientsFilterTypes.TOTAL_SHIPMENTS_MAX:
        {
          return clientsBloc.clientsTotalShipmentMaxController;
        }
    }
  }

  _getSearchTextField() {
    return BaseTextField(
      hintText: clientsFilterTypes.name.tr(),
      controller: _getInputController(),
      onChanged: (val) {},
      validator: null,
      keyboardType: TextInputType.text,
    );
  }

  Widget _getMobileTextField() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PhoneTextField(
        withValidator: false,
        phoneNumController: _getInputController(),
        onInputChanged: (PhoneNumber phoneNumber) {
          log("dialCode: ${phoneNumber.dialCode} - isoCode: ${phoneNumber.isoCode} - phoneNumber: ${phoneNumber.phoneNumber}",
              name: "onInputChanged --->");
          log("${phoneNumber.phoneNumber}", name: "PhoneTextField onInputChanged ->");
          clientsBloc.add(OnTextChange(
              phoneNumber: phoneNumber,
              clientsFilterTypes: ClientsFilterTypes.MOBILE,
              textEditingController: _getInputController()));
        },
      ),
    );
  }

  _getTotalShipmentsMinTextField(BuildContext context) {
    return BaseTextField(
      hintText: clientsFilterTypes.name.tr(),
      controller: _getInputController(),
      onChanged: (val) {},
      validator: null,
      keyboardType: TextInputType.number,
    );
  }

  _getTotalShipmentsMaxTextField(BuildContext context) {
    return BaseTextField(
      hintText: clientsFilterTypes.name.tr(),
      controller: _getInputController(),
      onChanged: (val) {},
      validator: (value) {
        if (value?.isNotEmpty ?? true) {
          if (clientsBloc.clientsTotalShipmentMinController.text.isNotEmpty) {
            if (int.parse(clientsBloc.clientsTotalShipmentMaxController.text) <=
                int.parse(clientsBloc.clientsTotalShipmentMinController.text)) {
              return 'total_shipments_max_error'.tr();
            }
          }
        }
        return null;
      },
      keyboardType: TextInputType.number,
    );
  }
}
