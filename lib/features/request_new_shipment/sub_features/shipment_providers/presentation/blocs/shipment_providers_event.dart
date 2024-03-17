part of 'shipment_providers_bloc.dart';

abstract class ShipmentProvidersEvent extends Equatable {
  const ShipmentProvidersEvent();
}

class GetShipmentProvidersEvent extends ShipmentProvidersEvent {
  //todo entity
  @override
  List<Object?> get props => [];
}
