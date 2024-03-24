part of 'request_shipment_bloc.dart';

class RequestShipmentState extends Equatable {
  final StateHelper stateHelper;
  final int currentPage;
  final AddressInfoEntity? addressInfoEntity;
  final ShipmentSpecsEntity? shipmentSpecsEntity;

  const RequestShipmentState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
    this.currentPage = 0,
    this.addressInfoEntity,
    this.shipmentSpecsEntity,
  });

  RequestShipmentState copyWith({
    StateHelper? stateHelper,
    int? currentPage,
    AddressInfoEntity? addressInfoEntity,
    ShipmentSpecsEntity? shipmentSpecsEntity,
  }) {
    return RequestShipmentState(
      stateHelper: stateHelper ?? this.stateHelper,
      currentPage: currentPage ?? this.currentPage,
      addressInfoEntity: addressInfoEntity ?? this.addressInfoEntity,
      shipmentSpecsEntity: shipmentSpecsEntity ?? this.shipmentSpecsEntity,
    );
  }

  @override
  List<Object> get props => [
        stateHelper,
        currentPage,
      ];
}
