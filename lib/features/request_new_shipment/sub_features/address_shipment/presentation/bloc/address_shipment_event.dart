part of 'address_shipment_bloc.dart';

abstract class AddressShipmentEvent extends Equatable {
  const AddressShipmentEvent();
}

class SubmitAddressInfoDataEvent extends AddressShipmentEvent {
  @override
  List<Object?> get props => [];
}

class ToggleAutoValidateEvent extends AddressShipmentEvent {
  @override
  List<Object?> get props => [];
}

class SubmitAddressInfoEvent extends AddressShipmentEvent {
  @override
  List<Object?> get props => [];
}
