part of 'request_shipment_bloc.dart';

class RequestShipmentState extends Equatable {
  final StateHelper stateHelper;
  final int currentPage;
  final AddressInfoEntity? addressInfoEntity;
  final ShipmentSpecsEntity? shipmentSpecsEntity;
  final List<CustomerGetDto>? customersAddresses;
  final CustomerQuery? customerQuery;
  final bool? hasNextPage;
  final List<StoreGetDto>? storesList;

  const RequestShipmentState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
    this.currentPage = 0,
    this.addressInfoEntity,
    this.shipmentSpecsEntity,
    this.customersAddresses,
    this.customerQuery,
    this.hasNextPage,
    this.storesList,
  });

  RequestShipmentState copyWith({
    StateHelper? stateHelper,
    int? currentPage,
    AddressInfoEntity? addressInfoEntity,
    ShipmentSpecsEntity? shipmentSpecsEntity,
    List<CustomerGetDto>? customersAddresses,
    CustomerQuery? customerQuery,
    bool? hasNextPage,
    List<StoreGetDto>? storesList,
  }) {
    return RequestShipmentState(
      stateHelper: stateHelper ?? this.stateHelper,
      currentPage: currentPage ?? this.currentPage,
      addressInfoEntity: addressInfoEntity ?? this.addressInfoEntity,
      shipmentSpecsEntity: shipmentSpecsEntity ?? this.shipmentSpecsEntity,
      customersAddresses: customersAddresses ?? this.customersAddresses,
      customerQuery: customerQuery ?? this.customerQuery,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      storesList: storesList ?? this.storesList,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        currentPage,
        addressInfoEntity,
        shipmentSpecsEntity,
        customersAddresses,
        customerQuery,
        hasNextPage,
        storesList,
      ];
}
