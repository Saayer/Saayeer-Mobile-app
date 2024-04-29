part of 'shipment_providers_bloc.dart';

abstract class ShipmentProvidersEvent extends Equatable {
  const ShipmentProvidersEvent();
}

class GetShipmentProvidersEvent extends ShipmentProvidersEvent {
  final AddressInfoEntity? addressInfoEntity;
  final ShipmentSpecsEntity? shipmentSpecsEntity;


  GetShipmentProvidersEvent(this.addressInfoEntity, this.shipmentSpecsEntity);

  @override
  List<Object?> get props => [addressInfoEntity , shipmentSpecsEntity];
}
