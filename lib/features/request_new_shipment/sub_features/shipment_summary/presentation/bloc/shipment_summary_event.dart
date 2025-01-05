part of 'shipment_summary_bloc.dart';

abstract class ShipmentSummaryEvent extends Equatable {
  const ShipmentSummaryEvent();
}

class GetSenderStoreDetailsById extends ShipmentSummaryEvent {
  final int? storeId;

  const GetSenderStoreDetailsById({required this.storeId});

  @override
  List<Object?> get props => [storeId];
}

class GetSenderCustomerDetailsById extends ShipmentSummaryEvent {
  final int? customerId;

  const GetSenderCustomerDetailsById({required this.customerId});

  @override
  List<Object?> get props => [customerId];
}

class GetReceiverStoreDetailsById extends ShipmentSummaryEvent {
  final int? storeId;

  const GetReceiverStoreDetailsById({required this.storeId});

  @override
  List<Object?> get props => [storeId];
}

class GetReceiverCustomerDetailsById extends ShipmentSummaryEvent {
  final int? customerId;

  const GetReceiverCustomerDetailsById({required this.customerId});

  @override
  List<Object?> get props => [customerId];
}

class AddNewShipment extends ShipmentSummaryEvent {
  final ShipmentCostRequest? shipmentAddDto;
  final LogisticCostDto? selectedServiceProvider;
  final int? senderStoreId;
  final int? senderCustomerId;
  final int? receiverStoreId;
  final int? receiverCustomerId;

  const AddNewShipment({
    required this.shipmentAddDto,
    required this.selectedServiceProvider,
    required this.senderStoreId,
    required this.senderCustomerId,
    required this.receiverStoreId,
    required this.receiverCustomerId,
  });

  @override
  List<Object?> get props => [
        shipmentAddDto,
        selectedServiceProvider,
        senderStoreId,
        senderCustomerId,
        receiverStoreId,
        receiverCustomerId,
      ];
}
