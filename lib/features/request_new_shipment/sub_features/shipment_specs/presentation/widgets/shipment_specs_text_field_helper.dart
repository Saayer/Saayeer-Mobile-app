import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/core/utils/enums/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/presentation/bloc/shipment_specs_bloc.dart';

class ShipmentSpecsTextFieldHelper {
  Widget getTextField(ShipmentSpecsBloc shipmentSpecsBloc,
      ShipmentSpecsFieldsTypes shipmentSpecsFieldsTypes) {
    switch (shipmentSpecsFieldsTypes) {
      case ShipmentSpecsFieldsTypes.CONTENT:
        {
          return InputTextField(
            label: shipmentSpecsFieldsTypes.name.toLowerCase(),
            inputController: _getInputController(
                shipmentSpecsBloc, shipmentSpecsFieldsTypes),
            onChanged: (val) {
              shipmentSpecsBloc.add(OnTextChange(
                  str: val,
                  shipmentSpecsFieldsTypes: shipmentSpecsFieldsTypes,
                  textEditingController: _getInputController(
                      shipmentSpecsBloc, shipmentSpecsFieldsTypes)));
            },
          );
        }
      default:
        {
          return InputTextField(
            label: shipmentSpecsFieldsTypes.name.toLowerCase(),
            keyboardType:  TextInputType.number,
            inputController: _getInputController(
                shipmentSpecsBloc, shipmentSpecsFieldsTypes),
            onChanged: (val) {
              shipmentSpecsBloc.add(OnTextChange(
                  str: val,
                  shipmentSpecsFieldsTypes: shipmentSpecsFieldsTypes,
                  textEditingController: _getInputController(
                      shipmentSpecsBloc, shipmentSpecsFieldsTypes)));
            },
          );
        }
    }
  }

  TextEditingController _getInputController(ShipmentSpecsBloc shipmentSpecsBloc,
      ShipmentSpecsFieldsTypes shipmentSpecsFieldsTypes) {
    switch (shipmentSpecsFieldsTypes) {
      case ShipmentSpecsFieldsTypes.CONTENT:
        {
          return shipmentSpecsBloc.contentController;
        }
      case ShipmentSpecsFieldsTypes.COST:
        {
          return shipmentSpecsBloc.costController;
        }
      case ShipmentSpecsFieldsTypes.WEIGHT:
        {
          return shipmentSpecsBloc.weightController;
        }
      case ShipmentSpecsFieldsTypes.HIEGHT:
        {
          return shipmentSpecsBloc.heightController;
        }
      case ShipmentSpecsFieldsTypes.WIDTH:
        {
          return shipmentSpecsBloc.widthController;
        }
      case ShipmentSpecsFieldsTypes.LENGHT:
        {
          return shipmentSpecsBloc.lengthController;
        }
    }
  }

  static bool enableStoreInfo(ShipmentSpecsBloc shipmentSpecsBloc) {
    log("${shipmentSpecsBloc.shipmentSpecsFieldsTypesValidMap}",
        name: "enableStoreInfo --->");
    if (shipmentSpecsBloc.shipmentSpecsFieldsTypesValidMap.values.length ==
        ShipmentSpecsFieldsTypes.values.length) {
      return shipmentSpecsBloc.shipmentSpecsFieldsTypesValidMap.values
          .every((element) => element == true);
    }
    return false;
  }
}
