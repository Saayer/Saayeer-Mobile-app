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
  final String? sourceCompany;
  final String? sourceGatewayId;
  final String? sourceMessage;
  final String? sourceName;
  final String? sourceNumber;
  final String? sourceReferenceNumber;
  final String? sourceType;
  final String? status;

  const CreatePayment({
    required this.shipmentId,
    required this.transactionId,
    required this.amount,
    required this.fee,
    required this.currency,
    required this.sourceCompany,
    required this.sourceGatewayId,
    required this.sourceMessage,
    required this.sourceName,
    required this.sourceNumber,
    required this.sourceReferenceNumber,
    required this.sourceType,
    required this.status,
  });

  @override
  List<Object?> get props => [
        shipmentId,
        transactionId,
        amount,
        fee,
        currency,
        sourceCompany,
        sourceGatewayId,
        sourceMessage,
        sourceName,
        sourceNumber,
        sourceReferenceNumber,
        sourceType,
        status,
      ];
}
