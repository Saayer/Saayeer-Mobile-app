part of 'shipment_details_bloc.dart';

class ShipmentDetailsState extends Equatable {
  final StateHelper stateHelper;
  final ShipmentGetDto? shipmentDto;
  final ShipmentTrackingEntity? shipmentTrackingEntity;

  const ShipmentDetailsState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.shipmentDto,
      this.shipmentTrackingEntity});

  ShipmentDetailsState copyWith({
    StateHelper? stateHelper,
    ShipmentGetDto? shipmentDto,
    ShipmentTrackingEntity? shipmentTrackingEntity,
  }) {
    return ShipmentDetailsState(
      stateHelper: stateHelper ?? this.stateHelper,
      shipmentDto:
          shipmentDto ?? this.shipmentDto,
      shipmentTrackingEntity:
          shipmentTrackingEntity ?? this.shipmentTrackingEntity,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        shipmentDto,
        shipmentTrackingEntity,
      ];
}
