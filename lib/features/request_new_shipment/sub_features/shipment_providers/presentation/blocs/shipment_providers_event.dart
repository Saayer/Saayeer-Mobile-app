part of 'shipment_providers_bloc.dart';

abstract class ShipmentProvidersEvent extends Equatable {
  const ShipmentProvidersEvent();
}

class GetShipmentProvidersEvent extends ShipmentProvidersEvent {
  final ShipmentAddDto? shipmentSpecsEntity;

  const GetShipmentProvidersEvent(this.shipmentSpecsEntity);

  @override
  List<Object?> get props => [shipmentSpecsEntity];
}

class AddNewShipment extends ShipmentProvidersEvent {
  final ShipmentAddDto? shipmentAddDto;

  const AddNewShipment(this.shipmentAddDto);

  @override
  List<Object?> get props => [shipmentAddDto];
}
