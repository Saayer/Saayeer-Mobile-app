import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moyasar/moyasar.dart';
import 'package:saayer/core/services/localization/localization.dart' as localization;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/errors/shipment_payment_error_handler.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/utils/constants/moyasar_constants.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/presentation/bloc/shipment_payment_bloc.dart';

class MoyasarPaymentMethodWidget extends StatelessWidget {
  final double amount;
  final String orderDesc;
  final double weight;
  final int shipmentId;
  final String clientPhone;
  final ShipmentPaymentBloc bloc;

  const MoyasarPaymentMethodWidget({
    super.key,
    required this.amount,
    required this.orderDesc,
    required this.weight,
    required this.shipmentId,
    required this.clientPhone,
    required this.bloc,
  });

  void onPaymentResult(result) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          {
            print('Moyasar Payment Succeed: $result');
            bloc.add(CreatePayment(
                shipmentId: shipmentId,
                transactionId: result.id,
                amount: amount,
                fee: result.fee.toDouble(),
                currency: result.currency));
          }
          break;
        case PaymentStatus.failed:
          {
            ShipmentPaymentErrorHandler(status: result.status, message: result.source.message ?? 'payment_failed')();
            print('Moyasar Payment failed');
          }
          break;
        case PaymentStatus.initiated:
          ShipmentPaymentErrorHandler(status: result.status, message: result.source.message ?? 'payment_failed')();
          print('Moyasar Payment initiated');
          break;
        case PaymentStatus.authorized:
          ShipmentPaymentErrorHandler(status: result.status, message: result.source.message ?? 'payment_failed')();
          print('Moyasar Payment authorized');
          break;
        case PaymentStatus.captured:
          ShipmentPaymentErrorHandler(status: result.status, message: result.source.message ?? 'payment_failed')();
          print('Moyasar Payment captured');
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ApplePay(
          config: _getPaymentConfig(),
          onPaymentResult: onPaymentResult,
        ),
        if (Platform.isIOS) const Text("or"),
        CreditCard(
          config: _getPaymentConfig(),
          onPaymentResult: onPaymentResult,
          locale: localization.Localization.isArabic() ? const Localization.ar() : const Localization.en(),
        )
      ],
    );
  }

  PaymentConfig _getPaymentConfig() {
    return PaymentConfig(
      publishableApiKey: MoyasarConstants.publishableApiKey,
      amount: int.parse((amount * 100).toString().split('.').first),
      description: orderDesc,
      metadata: _getMetadata(),
      creditCard: CreditCardConfig(saveCard: true, manual: false),
      applePay: ApplePayConfig(merchantId: 'YOUR_MERCHANT_ID', label: 'YOUR_STORE_NAME', manual: false),
    );
  }

  Map<String, dynamic> _getMetadata() {
    return {
      'weight': '${weight}kg',
      'shipmentId': shipmentId,
      'ClientPhone': clientPhone,
    };
  }
}
