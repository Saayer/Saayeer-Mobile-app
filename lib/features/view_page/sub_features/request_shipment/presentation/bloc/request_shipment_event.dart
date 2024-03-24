part of 'request_shipment_bloc.dart';

abstract class RequestShipmentEvent extends Equatable {
  const RequestShipmentEvent();
}

class InitRequestShipmentViewPageEvent extends RequestShipmentEvent {
  final int currentPage;

  const InitRequestShipmentViewPageEvent({
    required this.currentPage,
  });

  @override
  List<Object> get props => [currentPage];
}

class GoToNextPageEvent extends RequestShipmentEvent {
  @override
  List<Object> get props => [];
}

class AddAddressInfoEvent extends RequestShipmentEvent {
  final AddressInfoEntity addressInfoEntity;

  AddAddressInfoEvent(this.addressInfoEntity);

  @override
  List<Object> get props => [addressInfoEntity];
}

class AddShipmentSpecsEvent extends RequestShipmentEvent {
  final ShipmentSpecsEntity shipmentSpecsEntity;

  AddShipmentSpecsEvent(this.shipmentSpecsEntity);

  @override
  List<Object> get props => [shipmentSpecsEntity];
}
