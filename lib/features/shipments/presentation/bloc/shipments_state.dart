part of 'shipments_bloc.dart';

@immutable
class ShipmentsState extends Equatable {
  final StateHelper stateHelper;
  final ShipmentsListTypes selectedShipmentsType;
  final bool isFromHome;
  final List<ShipmentGetDto>? exportShipmentsList;
  final List<ShipmentGetDto>? importShipmentsList;
  final List<ShipmentGetDtoExtended>? adminShipmentsList;
  final ShipmentQuery? exportShipmentQuery;
  final ShipmentQuery? importShipmentQuery;
  final ShipmentQueryLAdmin? adminShipmentQuery;
  final bool? hasNextPage;
  final List<StoreGetDto>? storesList;
  final List<LogisticServiceGetDto>? serviceProvidersList;
  final List<ClientNamesRespnse>? clientsList;

  const ShipmentsState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.selectedShipmentsType = ShipmentsListTypes.IMPORT,
    this.exportShipmentsList,
    this.importShipmentsList,
    this.adminShipmentsList,
    this.exportShipmentQuery,
    this.importShipmentQuery,
    this.adminShipmentQuery,
    this.hasNextPage,
    this.isFromHome = false,
    this.storesList,
    this.serviceProvidersList,
    this.clientsList,
  });

  ShipmentsState copyWith({
    StateHelper? stateHelper,
    ShipmentsListTypes? selectedShipmentsType,
    List<ShipmentGetDto>? exportShipmentsList,
    List<ShipmentGetDto>? importShipmentsList,
    List<ShipmentGetDtoExtended>? adminShipmentsList,
    ShipmentQuery? exportShipmentQuery,
    ShipmentQuery? importShipmentQuery,
    ShipmentQueryLAdmin? adminShipmentQuery,
    bool? hasNextPage,
    bool? isFromHome,
    List<StoreGetDto>? storesList,
    List<LogisticServiceGetDto>? serviceProvidersList,
    List<ClientNamesRespnse>? clientsList,
  }) {
    return ShipmentsState(
      stateHelper: stateHelper ?? this.stateHelper,
      selectedShipmentsType: selectedShipmentsType ?? this.selectedShipmentsType,
      isFromHome: isFromHome ?? this.isFromHome,
      exportShipmentsList: exportShipmentsList ?? this.exportShipmentsList,
      importShipmentsList: importShipmentsList ?? this.importShipmentsList,
      adminShipmentsList: adminShipmentsList ?? this.adminShipmentsList,
      exportShipmentQuery: exportShipmentQuery ?? this.exportShipmentQuery,
      importShipmentQuery: importShipmentQuery ?? this.importShipmentQuery,
      adminShipmentQuery: adminShipmentQuery ?? this.adminShipmentQuery,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      storesList: storesList ?? this.storesList,
      serviceProvidersList: serviceProvidersList ?? this.serviceProvidersList,
      clientsList: clientsList ?? this.clientsList,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        selectedShipmentsType,
        isFromHome,
        exportShipmentsList,
        importShipmentsList,
        adminShipmentsList,
        exportShipmentQuery,
        importShipmentQuery,
        adminShipmentQuery,
        hasNextPage,
        storesList,
        serviceProvidersList,
        clientsList,
      ];
}
