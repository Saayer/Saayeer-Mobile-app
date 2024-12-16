part of 'shipment_details_bloc.dart';

class ShipmentDetailsState extends Equatable {
  final StateHelper stateHelper;
  final ShipmentGetDto? shipmentDto;
  final ShipmentGetDtoExtended? adminShipmentDto;
  final List<ShipmentStatusGetDto>? shipmentTrackingList;
  final ShipmentStatusGetDto? errorTrackingItem;

  const ShipmentDetailsState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.shipmentDto,
    this.adminShipmentDto,
    this.shipmentTrackingList,
    this.errorTrackingItem,
  });

  ShipmentDetailsState copyWith({
    StateHelper? stateHelper,
    ShipmentGetDto? shipmentDto,
    ShipmentGetDtoExtended? adminShipmentDto,
    List<ShipmentStatusGetDto>? shipmentTrackingList,
    ShipmentStatusGetDto? errorTrackingItem,
  }) {
    return ShipmentDetailsState(
      stateHelper: stateHelper ?? this.stateHelper,
      shipmentDto: shipmentDto ?? this.shipmentDto,
      adminShipmentDto: adminShipmentDto ?? this.adminShipmentDto,
      shipmentTrackingList: shipmentTrackingList ?? this.shipmentTrackingList,
      errorTrackingItem: errorTrackingItem ?? this.errorTrackingItem,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        shipmentDto,
        adminShipmentDto,
        shipmentTrackingList,
        errorTrackingItem,
      ];
}
