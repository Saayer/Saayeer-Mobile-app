part of 'shipment_summary_bloc.dart';

class ShipmentSummaryState extends Equatable {
  final StateHelper stateHelper;
  final StoreGetDto? senderStoreDto;
  final CustomerGetDto? senderCustomerDto;
  final StoreGetDto? receiverStoreDto;
  final CustomerGetDto? receiverCustomerDto;
  final ShipmentGetDto? shipmentGetDto;

  const ShipmentSummaryState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
    this.senderStoreDto,
    this.senderCustomerDto,
    this.receiverStoreDto,
    this.receiverCustomerDto,
    this.shipmentGetDto,
  });

  ShipmentSummaryState copyWith({
    StateHelper? stateHelper,
    StoreGetDto? senderStoreDto,
    CustomerGetDto? senderCustomerDto,
    StoreGetDto? receiverStoreDto,
    CustomerGetDto? receiverCustomerDto,
    ShipmentGetDto? shipmentGetDto,
  }) {
    return ShipmentSummaryState(
      stateHelper: stateHelper ?? this.stateHelper,
      senderStoreDto: senderStoreDto ?? this.senderStoreDto,
      senderCustomerDto: senderCustomerDto ?? this.senderCustomerDto,
      receiverStoreDto: receiverStoreDto ?? this.receiverStoreDto,
      receiverCustomerDto: receiverCustomerDto ?? this.receiverCustomerDto,
      shipmentGetDto: shipmentGetDto ?? this.shipmentGetDto,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        senderStoreDto,
        senderCustomerDto,
        receiverStoreDto,
        receiverCustomerDto,
        shipmentGetDto,
      ];
}
