part of 'shipment_specs_bloc.dart';

abstract class ShipmentSpecsEvent extends Equatable {
  const ShipmentSpecsEvent();
}

class OnTextChange extends ShipmentSpecsEvent {
  final TextEditingController? textEditingController;
  final String? str;
  final ShipmentSpecsFieldsTypes shipmentSpecsFieldsTypes;

  const OnTextChange({
    this.textEditingController,
    this.str,
    required this.shipmentSpecsFieldsTypes,
  });

  @override
  List<Object?> get props => [textEditingController, str, shipmentSpecsFieldsTypes];
}

class SubmitShipmentSpecsInfoData extends ShipmentSpecsEvent {
  @override
  List<Object?> get props => [];
}

class ToggleAutoValidate extends ShipmentSpecsEvent {
  @override
  List<Object?> get props => [];
}

class SubmitShipmentSpecsInfo extends ShipmentSpecsEvent {
  @override
  List<Object?> get props => [];
}
