part of 'shipment_details_bloc.dart';

class ShipmentDetailsState extends Equatable {
  final StateHelper stateHelper;
  final ShipmentGetDto? shipmentDto;
  final List<ShipmentStatusGetDto>? shipmentTrackingList;
  final ShipmentStatusGetDto? errorTrackingItem;

  const ShipmentDetailsState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.shipmentDto,
    this.shipmentTrackingList,
    this.errorTrackingItem,
  });

  ShipmentDetailsState copyWith({
    StateHelper? stateHelper,
    ShipmentGetDto? shipmentDto,
    List<ShipmentStatusGetDto>? shipmentTrackingList,
    ShipmentStatusGetDto? errorTrackingItem,
  }) {
    return ShipmentDetailsState(
      stateHelper: stateHelper ?? this.stateHelper,
      shipmentDto: shipmentDto ?? this.shipmentDto,
      shipmentTrackingList: shipmentTrackingList ?? this.shipmentTrackingList,
      errorTrackingItem: errorTrackingItem ?? this.errorTrackingItem,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        shipmentDto,
        shipmentTrackingList,
        errorTrackingItem,
      ];
}
