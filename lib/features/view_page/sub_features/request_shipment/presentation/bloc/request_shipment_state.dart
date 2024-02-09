part of 'request_shipment_bloc.dart';
//
// abstract class RequestShipmentState extends Equatable {
//   const RequestShipmentState();
// }
//
// class RequestShipmentInitial extends RequestShipmentState {
//   @override
//   List<Object> get props => [];
// }

class RequestShipmentState extends Equatable {
  final StateHelper stateHelper;
  final int currentPage;

  const RequestShipmentState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
        this.currentPage = 0});

  RequestShipmentState copyWith({
    StateHelper? stateHelper,
    int? currentPage,
  }) {
    return RequestShipmentState(
      stateHelper: stateHelper ?? this.stateHelper,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [stateHelper, currentPage];
}