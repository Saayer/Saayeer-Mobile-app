part of 'shipment_providers_bloc.dart';

abstract class ShipmentProvidersEvent extends Equatable {
  const ShipmentProvidersEvent();
}

class GetShipmentProvidersEvent extends ShipmentProvidersEvent {
  final ShipmentCostDto? shipmentSpecsEntity;

  const GetShipmentProvidersEvent(this.shipmentSpecsEntity);

  @override
  List<Object?> get props => [shipmentSpecsEntity];
}
