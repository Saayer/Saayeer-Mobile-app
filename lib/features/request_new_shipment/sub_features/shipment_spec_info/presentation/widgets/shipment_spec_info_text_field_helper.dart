import 'package:flutter/material.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_spec_info/data/core/utils/enums.dart';

class ShipmentSpecInfoTextFieldHelper {
  final RequestNewShipmentBloc requestShipmentBloc;
  final ShipmentSpecInfoFieldsTypes shipmentDetailsFieldsTypes;

  ShipmentSpecInfoTextFieldHelper({required this.requestShipmentBloc, required this.shipmentDetailsFieldsTypes});

  Widget getTextField({
    required GlobalKey<State<StatefulWidget>> contentDescriptionKey,
    required GlobalKey<State<StatefulWidget>> contentValueKey,
  }) {
    switch (shipmentDetailsFieldsTypes) {
      case ShipmentSpecInfoFieldsTypes.WEIGHT:
        {
          return _getWeightTextField();
        }
      case ShipmentSpecInfoFieldsTypes.LENGTH:
        {
          return _getLengthTextField();
        }
      case ShipmentSpecInfoFieldsTypes.WIDTH:
        {
          return _getWidthTextField();
        }
      case ShipmentSpecInfoFieldsTypes.HEIGHT:
        {
          return _getHeightTextField();
        }
      case ShipmentSpecInfoFieldsTypes.CONTENT_DESCRIPTION:
        {
          return _getContentDescriptionTextField(contentDescriptionKey);
        }
      case ShipmentSpecInfoFieldsTypes.CONTENT_VALUE:
        {
          return _getContentValueTextField(contentValueKey);
        }
    }
  }

  TextEditingController _getInputController() {
    switch (shipmentDetailsFieldsTypes) {
      case ShipmentSpecInfoFieldsTypes.LENGTH:
        {
          return requestShipmentBloc.lengthController;
        }
      case ShipmentSpecInfoFieldsTypes.WIDTH:
        {
          return requestShipmentBloc.widthController;
        }
      case ShipmentSpecInfoFieldsTypes.HEIGHT:
        {
          return requestShipmentBloc.heightController;
        }
      case ShipmentSpecInfoFieldsTypes.WEIGHT:
        {
          return requestShipmentBloc.weightController;
        }
      case ShipmentSpecInfoFieldsTypes.CONTENT_DESCRIPTION:
        {
          return requestShipmentBloc.contentDescriptionController;
        }
      case ShipmentSpecInfoFieldsTypes.CONTENT_VALUE:
        {
          return requestShipmentBloc.contentValueController;
        }
    }
  }

  Widget _getLengthTextField() {
    return InputTextField(
      label: shipmentDetailsFieldsTypes.name,
      isFieldRequired: false,
      withValidator: false,
      inputController: _getInputController(),
      maxLength: null,
      keyboardType: TextInputType.number,
      onChanged: (val) {},
    );
  }

  Widget _getWidthTextField() {
    return InputTextField(
      label: shipmentDetailsFieldsTypes.name,
      isFieldRequired: false,
      withValidator: false,
      inputController: _getInputController(),
      maxLength: null,
      keyboardType: TextInputType.number,
      onChanged: (val) {},
    );
  }

  Widget _getHeightTextField() {
    return InputTextField(
      label: shipmentDetailsFieldsTypes.name,
      isFieldRequired: false,
      withValidator: false,
      inputController: _getInputController(),
      maxLength: null,
      keyboardType: TextInputType.number,
      onChanged: (val) {},
    );
  }

  Widget _getWeightTextField() {
    return InputTextField(
      label: shipmentDetailsFieldsTypes.name,
      isFieldRequired: true,
      withValidator: true,
      inputController: _getInputController(),
      maxLength: null,
      keyboardType: TextInputType.number,
      onChanged: (val) {},
    );
  }

  Widget _getContentDescriptionTextField(GlobalKey<State<StatefulWidget>> contentDescriptionKey) {
    return InputTextField(
      key: contentDescriptionKey,
      label: shipmentDetailsFieldsTypes.name,
      isFieldRequired: true,
      withValidator: true,
      inputController: _getInputController(),
      maxLength: null,
      keyboardType: TextInputType.text,
      onChanged: (val) {},
      onTap: () {
        ensureVisibleOnTextArea(textFieldKey: contentDescriptionKey);
      },
    );
  }

  Widget _getContentValueTextField(GlobalKey<State<StatefulWidget>> contentValueKey) {
    return InputTextField(
      key: contentValueKey,
      label: shipmentDetailsFieldsTypes.name,
      isFieldRequired: false,
      withValidator: false,
      inputController: _getInputController(),
      maxLength: null,
      keyboardType: TextInputType.number,
      onChanged: (val) {},
      onTap: () {
        ensureVisibleOnTextArea(textFieldKey: contentValueKey);
      },
    );
  }

  /// auto scroll the bottom textFields on focused to be visible when keyboard display
  Future<void> ensureVisibleOnTextArea({required GlobalKey textFieldKey}) async {
    final keyContext = textFieldKey.currentContext;
    if (keyContext != null) {
      await Future.delayed(const Duration(milliseconds: 500)).then(
        (value) => Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        ),
      );
    }
  }
}
