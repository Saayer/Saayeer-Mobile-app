part of 'request_new_shipment_bloc.dart';

abstract class RequestNewShipmentEvent extends Equatable {
  const RequestNewShipmentEvent();
}

class InitRequestShipmentViewPageEvent extends RequestNewShipmentEvent {
  final int currentPage;

  const InitRequestShipmentViewPageEvent({
    required this.currentPage,
  });

  @override
  List<Object> get props => [currentPage];
}

class GoToNextPageEvent extends RequestNewShipmentEvent {
  @override
  List<Object> get props => [];
}

class GoToPreviousPage extends RequestNewShipmentEvent {
  @override
  List<Object> get props => [];
}

class ToggleAutoValidate extends RequestNewShipmentEvent {
  @override
  List<Object?> get props => [];
}

class GetCustomersAddresses extends RequestNewShipmentEvent {
  final RequestShipmentTypes requestShipmentTypes;

  const GetCustomersAddresses({required this.requestShipmentTypes});

  @override
  List<Object?> get props => [requestShipmentTypes];
}

class GetStoresAddresses extends RequestNewShipmentEvent {
  const GetStoresAddresses();

  @override
  List<Object?> get props => [];
}

class OnScrollSenderCustomersPagination extends RequestNewShipmentEvent {
  @override
  List<Object?> get props => [];
}

class OnScrollReceiverCustomersPagination extends RequestNewShipmentEvent {
  @override
  List<Object?> get props => [];
}

class OnSenderSelectedFromDropDown extends RequestNewShipmentEvent {
  final SenderReceiverType senderType;
  final dynamic item;

  const OnSenderSelectedFromDropDown({required this.senderType, required this.item});

  @override
  List<Object?> get props => [senderType, item];
}

class OnReceiverSelectedFromDropDown extends RequestNewShipmentEvent {
  final SenderReceiverType receiverType;
  final dynamic item;

  const OnReceiverSelectedFromDropDown({required this.receiverType, required this.item});

  @override
  List<Object?> get props => [receiverType, item];
}

class SetSelectedServiceProvider extends RequestNewShipmentEvent {
  final ServiceCost selectedServiceProvider;

  const SetSelectedServiceProvider({required this.selectedServiceProvider});

  @override
  List<Object> get props => [selectedServiceProvider];
}

class GoToServiceProvidersPage extends RequestNewShipmentEvent {
  const GoToServiceProvidersPage();

  @override
  List<Object> get props => [];
}

class OnSetSenderId extends RequestNewShipmentEvent {
  const OnSetSenderId();

  @override
  List<Object> get props => [];
}

class OnSetReceiverId extends RequestNewShipmentEvent {
  const OnSetReceiverId();

  @override
  List<Object> get props => [];
}
