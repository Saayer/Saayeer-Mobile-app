part of 'request_shipment_bloc.dart';

abstract class RequestShipmentEvent extends Equatable {
  const RequestShipmentEvent();
}

class InitUserInfoViewPageEvent extends RequestShipmentEvent {
  final int currentPage;

  const InitUserInfoViewPageEvent({
    required this.currentPage,
  });

  @override
  List<Object> get props => [currentPage];
}

class GoToNextPageEvent extends RequestShipmentEvent {
  @override
  List<Object> get props => [];
}
