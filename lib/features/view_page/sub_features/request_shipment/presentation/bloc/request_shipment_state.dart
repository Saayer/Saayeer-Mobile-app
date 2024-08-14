part of 'request_shipment_bloc.dart';

class RequestShipmentState extends Equatable {
  final StateHelper stateHelper;
  final int currentPage;
  final AddressInfoEntity? addressInfoEntity;
  final ShipmentSpecsEntity? shipmentSpecsEntity;
  final List<CustomerGetDto>? customersAddresses;
  final CustomerQuery? senderCustomerQuery;
  final CustomerQuery? receiverCustomerQuery;
  final bool? hasNextPage;
  final List<StoreGetDto>? storesList;

  const RequestShipmentState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
    this.currentPage = 0,
    this.addressInfoEntity,
    this.shipmentSpecsEntity,
    this.customersAddresses,
    this.senderCustomerQuery,
    this.receiverCustomerQuery,
    this.hasNextPage,
    this.storesList,
  });

  RequestShipmentState copyWith({
    StateHelper? stateHelper,
    int? currentPage,
    AddressInfoEntity? addressInfoEntity,
    ShipmentSpecsEntity? shipmentSpecsEntity,
    List<CustomerGetDto>? customersAddresses,
    CustomerQuery? senderCustomerQuery,
    CustomerQuery? receiverCustomerQuery,
    bool? hasNextPage,
    List<StoreGetDto>? storesList,
  }) {
    return RequestShipmentState(
      stateHelper: stateHelper ?? this.stateHelper,
      currentPage: currentPage ?? this.currentPage,
      addressInfoEntity: addressInfoEntity ?? this.addressInfoEntity,
      shipmentSpecsEntity: shipmentSpecsEntity ?? this.shipmentSpecsEntity,
      customersAddresses: customersAddresses ?? this.customersAddresses,
      senderCustomerQuery: senderCustomerQuery ?? this.senderCustomerQuery,
      receiverCustomerQuery: receiverCustomerQuery ?? this.receiverCustomerQuery,
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
        senderCustomerQuery,
        receiverCustomerQuery,
        hasNextPage,
        storesList,
      ];
}
