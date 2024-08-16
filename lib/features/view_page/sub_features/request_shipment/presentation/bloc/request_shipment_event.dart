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

class GoToPreviousPage extends RequestShipmentEvent {
  @override
  List<Object> get props => [];
}

class ToggleAutoValidate extends RequestShipmentEvent {
  @override
  List<Object?> get props => [];
}

class GetCustomersAddresses extends RequestShipmentEvent {
  final RequestShipmentTypes requestShipmentTypes;

  const GetCustomersAddresses({required this.requestShipmentTypes});

  @override
  List<Object?> get props => [requestShipmentTypes];
}

class GetStoresAddresses extends RequestShipmentEvent {
  const GetStoresAddresses();

  @override
  List<Object?> get props => [];
}

class OnScrollSenderCustomersPagination extends RequestShipmentEvent {
  @override
  List<Object?> get props => [];
}

class OnScrollReceiverCustomersPagination extends RequestShipmentEvent {
  @override
  List<Object?> get props => [];
}

class OnSenderSelectedFromDropDown extends RequestShipmentEvent {
  final SenderReceiverType senderType;
  final dynamic item;

  const OnSenderSelectedFromDropDown({required this.senderType, required this.item});

  @override
  List<Object?> get props => [senderType, item];
}

class OnReceiverSelectedFromDropDown extends RequestShipmentEvent {
  final SenderReceiverType receiverType;
  final dynamic item;

  const OnReceiverSelectedFromDropDown({required this.receiverType, required this.item});

  @override
  List<Object?> get props => [receiverType, item];
}

class AddAddressInfoEvent extends RequestShipmentEvent {
  final AddressInfoEntity addressInfoEntity;

  AddAddressInfoEvent(this.addressInfoEntity);

  @override
  List<Object> get props => [addressInfoEntity];
}

class GetServiceProviders extends RequestShipmentEvent {

  const GetServiceProviders();

  @override
  List<Object> get props => [];
}
