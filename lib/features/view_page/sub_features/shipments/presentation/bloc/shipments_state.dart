part of 'shipments_bloc.dart';

class ShipmentsState extends Equatable {
  final StateHelper stateHelper;
  final ShipmentsTypes selectedShipmentsType;

  final Map<ShipmentsTypes, List<ShipmentEntity>>? shipmentEntityListMap;

  const ShipmentsState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.selectedShipmentsType = ShipmentsTypes.INCOMING,
      this.shipmentEntityListMap});

  ShipmentsState copyWith(
      {StateHelper? stateHelper,
      ShipmentsTypes? selectedShipmentsType,
      Map<ShipmentsTypes, List<ShipmentEntity>>? shipmentEntityListMap}) {
    return ShipmentsState(
        stateHelper: stateHelper ?? this.stateHelper,
        selectedShipmentsType:
            selectedShipmentsType ?? this.selectedShipmentsType,
        shipmentEntityListMap:
            shipmentEntityListMap ?? this.shipmentEntityListMap);
  }

  @override
  List<Object?> get props =>
      [stateHelper, selectedShipmentsType, shipmentEntityListMap];
}
