part of 'shipment_providers_bloc.dart';

@immutable
class ShipmentProvidersState extends Equatable {
  final StateHelper stateHelper;
  final List<ShipmentCost>? shipmentProvidersResponse;
  final ShipmentGetDto? shipmentGetDto;

  const ShipmentProvidersState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.shipmentProvidersResponse,
    this.shipmentGetDto,
  });

  ShipmentProvidersState copyWith({
    StateHelper? stateHelper,
    List<ShipmentCost>? shipmentProvidersResponse,
    ShipmentGetDto? shipmentGetDto,
  }) {
    return ShipmentProvidersState(
      stateHelper: stateHelper ?? this.stateHelper,
      shipmentProvidersResponse: shipmentProvidersResponse ?? this.shipmentProvidersResponse,
      shipmentGetDto: shipmentGetDto ?? this.shipmentGetDto,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        shipmentProvidersResponse,
        shipmentGetDto,
      ];
}
