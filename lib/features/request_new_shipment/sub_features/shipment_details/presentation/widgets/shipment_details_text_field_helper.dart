import 'package:flutter/material.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_details/data/core/utils/enums.dart';

class ShipmentDetailsTextFieldHelper {
  final RequestNewShipmentBloc requestShipmentBloc;
  final ShipmentDetailsFieldsTypes shipmentDetailsFieldsTypes;

  ShipmentDetailsTextFieldHelper({required this.requestShipmentBloc, required this.shipmentDetailsFieldsTypes});

  Widget getTextField({
    required GlobalKey<State<StatefulWidget>> contentDescriptionKey,
    required GlobalKey<State<StatefulWidget>> contentValueKey,
  }) {
    switch (shipmentDetailsFieldsTypes) {
      case ShipmentDetailsFieldsTypes.LENGTH:
        {
          return _getLengthTextField();
        }
      case ShipmentDetailsFieldsTypes.WIDTH:
        {
          return _getWidthTextField();
        }
      case ShipmentDetailsFieldsTypes.HEIGHT:
        {
          return _getHeightTextField();
        }
      case ShipmentDetailsFieldsTypes.WEIGHT:
        {
          return _getWeightTextField();
        }
      case ShipmentDetailsFieldsTypes.CONTENT_DESCRIPTION:
        {
          return _getContentDescriptionTextField(contentDescriptionKey);
        }
      case ShipmentDetailsFieldsTypes.CONTENT_VALUE:
        {
          return _getContentValueTextField(contentValueKey);
        }
    }
  }

  TextEditingController _getInputController() {
    switch (shipmentDetailsFieldsTypes) {
      case ShipmentDetailsFieldsTypes.LENGTH:
        {
          return requestShipmentBloc.lengthController;
        }
      case ShipmentDetailsFieldsTypes.WIDTH:
        {
          return requestShipmentBloc.widthController;
        }
      case ShipmentDetailsFieldsTypes.HEIGHT:
        {
          return requestShipmentBloc.heightController;
        }
      case ShipmentDetailsFieldsTypes.WEIGHT:
        {
          return requestShipmentBloc.weightController;
        }
      case ShipmentDetailsFieldsTypes.CONTENT_DESCRIPTION:
        {
          return requestShipmentBloc.contentDescriptionController;
        }
      case ShipmentDetailsFieldsTypes.CONTENT_VALUE:
        {
          return requestShipmentBloc.contentValueController;
        }
    }
  }

  Widget _getLengthTextField() {
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

  Widget _getWidthTextField() {
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

  Widget _getHeightTextField() {
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
