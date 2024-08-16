part of 'shipments_bloc.dart';

@immutable
class ShipmentsState extends Equatable {
  final StateHelper stateHelper;
  final ShipmentsTypes selectedShipmentsType;
  final Map<ShipmentsTypes, List<ShipmentEntity>>? shipmentEntityListMap;
  final bool isFromHome;

  const ShipmentsState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.selectedShipmentsType = ShipmentsTypes.INCOMING,
      this.shipmentEntityListMap,
      this.isFromHome = false});

  ShipmentsState copyWith(
      {StateHelper? stateHelper,
      ShipmentsTypes? selectedShipmentsType,
      Map<ShipmentsTypes, List<ShipmentEntity>>? shipmentEntityListMap,
      bool? isFromHome}) {
    return ShipmentsState(
        stateHelper: stateHelper ?? this.stateHelper,
        selectedShipmentsType:
            selectedShipmentsType ?? this.selectedShipmentsType,
        shipmentEntityListMap:
            shipmentEntityListMap ?? this.shipmentEntityListMap,
        isFromHome: isFromHome ?? this.isFromHome);
  }

  @override
  List<Object?> get props =>
      [stateHelper, selectedShipmentsType, shipmentEntityListMap, isFromHome];
}
