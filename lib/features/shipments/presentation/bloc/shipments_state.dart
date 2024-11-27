part of 'shipments_bloc.dart';

@immutable
class ShipmentsState extends Equatable {
  final StateHelper stateHelper;
  final ShipmentsListTypes selectedShipmentsType;
  final bool isFromHome;
  final List<ShipmentGetDto>? exportShipmentsList;
  final List<ShipmentGetDto>? importShipmentsList;
  final ShipmentQuery? exportShipmentQuery;
  final ShipmentQuery? importShipmentQuery;
  final bool? hasNextPage;
  final List<StoreGetDto>? storesList;
  final List<LogisticsServiceBase>? serviceProvidersList;

  const ShipmentsState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.selectedShipmentsType = ShipmentsListTypes.IMPORT,
    this.exportShipmentsList,
    this.importShipmentsList,
    this.exportShipmentQuery,
    this.importShipmentQuery,
    this.hasNextPage,
    this.isFromHome = false,
    this.storesList,
    this.serviceProvidersList,
  });

  ShipmentsState copyWith({
    StateHelper? stateHelper,
    ShipmentsListTypes? selectedShipmentsType,
    List<ShipmentGetDto>? exportShipmentsList,
    List<ShipmentGetDto>? importShipmentsList,
    ShipmentQuery? exportShipmentQuery,
    ShipmentQuery? importShipmentQuery,
    bool? hasNextPage,
    bool? isFromHome,
    List<StoreGetDto>? storesList,
    List<LogisticsServiceBase>? serviceProvidersList,
  }) {
    return ShipmentsState(
      stateHelper: stateHelper ?? this.stateHelper,
      selectedShipmentsType: selectedShipmentsType ?? this.selectedShipmentsType,
      isFromHome: isFromHome ?? this.isFromHome,
      exportShipmentsList: exportShipmentsList ?? this.exportShipmentsList,
      importShipmentsList: importShipmentsList ?? this.importShipmentsList,
      exportShipmentQuery: exportShipmentQuery ?? this.exportShipmentQuery,
      importShipmentQuery: importShipmentQuery ?? this.importShipmentQuery,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      storesList: storesList ?? this.storesList,
      serviceProvidersList: serviceProvidersList ?? this.serviceProvidersList,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        selectedShipmentsType,
        isFromHome,
        exportShipmentsList,
        importShipmentsList,
        exportShipmentQuery,
        importShipmentQuery,
        hasNextPage,
        storesList,
        serviceProvidersList,
      ];
}
