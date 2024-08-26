part of 'shipment_checkout_payment_bloc.dart';

abstract class ShipmentCheckoutPaymentEvent extends Equatable {
  const ShipmentCheckoutPaymentEvent();
}

class GetSenderStoreDetailsById extends ShipmentCheckoutPaymentEvent {
  final int? storeId;

  const GetSenderStoreDetailsById({required this.storeId});

  @override
  List<Object?> get props => [storeId];
}

class GetSenderCustomerDetailsById extends ShipmentCheckoutPaymentEvent {
  final int? customerId;

  const GetSenderCustomerDetailsById({required this.customerId});

  @override
  List<Object?> get props => [customerId];
}

class GetReceiverStoreDetailsById extends ShipmentCheckoutPaymentEvent {
  final int? storeId;

  const GetReceiverStoreDetailsById({required this.storeId});

  @override
  List<Object?> get props => [storeId];
}

class GetReceiverCustomerDetailsById extends ShipmentCheckoutPaymentEvent {
  final int? customerId;

  const GetReceiverCustomerDetailsById({required this.customerId});

  @override
  List<Object?> get props => [customerId];
}

class AddNewShipment extends ShipmentCheckoutPaymentEvent {
  final ShipmentCostObj? shipmentAddDto;
  final ServiceCost? selectedServiceProvider;
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
