part of 'shipment_payment_bloc.dart';

abstract class ShipmentPaymentEvent extends Equatable {
  const ShipmentPaymentEvent();
}

class ConfirmPayment extends ShipmentPaymentEvent {
  final ShipmentCostObj? shipmentAddDto;
  final ServiceCost? selectedServiceProvider;
  final int? senderStoreId;
  final int? senderCustomerId;
  final int? receiverStoreId;
  final int? receiverCustomerId;

  const ConfirmPayment({
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
