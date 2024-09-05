part of 'shipment_payment_bloc.dart';

abstract class ShipmentPaymentEvent extends Equatable {
  const ShipmentPaymentEvent();
}

class CreatePayment extends ShipmentPaymentEvent {
  final int? shipmentId;
  final String? transactionId;
  final double? amount;
  final double? fee;
  final String? currency;

  const CreatePayment({
    required this.shipmentId,
    required this.transactionId,
    required this.amount,
    required this.fee,
    required this.currency,
  });

  @override
  List<Object?> get props => [
        shipmentId,
        transactionId,
        amount,
        fee,
        currency,
      ];
}
