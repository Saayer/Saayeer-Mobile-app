part of 'shipment_providers_bloc.dart';

@immutable
class ShipmentProvidersState extends Equatable {
  final StateHelper stateHelper;
  final List<ServiceCost>? shipmentProvidersResponse;

  const ShipmentProvidersState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.shipmentProvidersResponse,
  });

  ShipmentProvidersState copyWith({
    StateHelper? stateHelper,
    List<ServiceCost>? shipmentProvidersResponse,
  }) {
    return ShipmentProvidersState(
      stateHelper: stateHelper ?? this.stateHelper,
      shipmentProvidersResponse: shipmentProvidersResponse ?? this.shipmentProvidersResponse,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        shipmentProvidersResponse,
      ];
}
