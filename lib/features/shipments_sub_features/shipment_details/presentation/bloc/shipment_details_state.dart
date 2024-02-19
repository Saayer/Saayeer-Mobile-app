part of 'shipment_details_bloc.dart';

class ShipmentDetailsState extends Equatable {
  final StateHelper stateHelper;
  final ShipmentDetailsEntity? shipmentDetailsEntity;
  final ShipmentTrackingEntity? shipmentTrackingEntity;

  const ShipmentDetailsState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.shipmentDetailsEntity,
      this.shipmentTrackingEntity});

  ShipmentDetailsState copyWith({
    StateHelper? stateHelper,
    ShipmentDetailsEntity? shipmentDetailsEntity,
    ShipmentTrackingEntity? shipmentTrackingEntity,
  }) {
    return ShipmentDetailsState(
      stateHelper: stateHelper ?? this.stateHelper,
      shipmentDetailsEntity:
          shipmentDetailsEntity ?? this.shipmentDetailsEntity,
      shipmentTrackingEntity:
          shipmentTrackingEntity ?? this.shipmentTrackingEntity,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        shipmentDetailsEntity,
        shipmentTrackingEntity,
      ];
}
