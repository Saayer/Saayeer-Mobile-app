part of 'request_new_shipment_bloc.dart';

abstract class RequestNewShipmentEvent extends Equatable {
  const RequestNewShipmentEvent();
}

class PersonalInfoCompleteChecker extends RequestNewShipmentEvent {

  const PersonalInfoCompleteChecker();

  @override
  List<Object> get props => [];
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
  final LogisticCostDto selectedServiceProvider;

  const SetSelectedServiceProvider({required this.selectedServiceProvider});

  @override
  List<Object> get props => [selectedServiceProvider];
}

class GoToServiceProvidersPage extends RequestNewShipmentEvent {
  const GoToServiceProvidersPage();

  @override
  List<Object> get props => [];
}

class OnSetSenderAddress extends RequestNewShipmentEvent {
  const OnSetSenderAddress();

  @override
  List<Object> get props => [];
}

class OnSetReceiverAddress extends RequestNewShipmentEvent {
  const OnSetReceiverAddress();

  @override
  List<Object> get props => [];
}

class SetShipmentId extends RequestNewShipmentEvent {
  final int shipmentId;

  const SetShipmentId({required this.shipmentId});

  @override
  List<Object> get props => [
        shipmentId,
      ];
}

class ResetCustomerList extends RequestNewShipmentEvent {
  final RequestShipmentTypes requestShipmentType;

  const ResetCustomerList({required this.requestShipmentType});

  @override
  List<Object> get props => [
        requestShipmentType,
      ];
}
