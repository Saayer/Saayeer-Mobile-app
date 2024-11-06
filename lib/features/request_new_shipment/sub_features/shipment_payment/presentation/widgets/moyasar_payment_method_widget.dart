import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moyasar/moyasar.dart';
import 'package:saayer/core/API/end_points/builder/end_points_base_url.dart';
import 'package:saayer/core/app_config/app_flavor.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/services/localization/localization.dart' as localization;
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/errors/shipment_payment_error_handler.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/utils/constants/moyasar_constants.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/presentation/bloc/shipment_payment_bloc.dart';
import 'package:moyasar/src/models/payment_type.dart';
import "package:universal_html/html.dart" as html;

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
      if (kIsWeb) {
        ///
        getIt<SharedPrefService>().setPaymentResponse(result);

        ///
        _openTransactionUrl((result.source as CardPaymentResponseSource).transactionUrl);
      } else {
        switch (result.status) {
          case PaymentStatus.paid:
            {
              const CardCompany company = CardCompany.amex;
              print(company.name);
              print('Moyasar Payment Succeed: $result');
              bloc.add(CreatePayment(
                  shipmentId: shipmentId,
                  transactionId: result.id,
                  amount: amount,
                  fee: result.fee.toDouble(),
                  currency: result.currency,
                  sourceCompany: (result.source.company as CardCompany).name,
                  sourceGatewayId: result.source.gatewayId,
                  sourceMessage: result.source.message,
                  sourceName: result.source.name,
                  sourceNumber: result.source.number,
                  sourceReferenceNumber: result.source.referenceNumber ?? '',
                  sourceType: (result.source.type as PaymentType).name,
                  status: result.status.name));
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
  }

  Future<void> _openTransactionUrl(String url) async {
    html.window.open(url, '_self');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (defaultTargetPlatform == TargetPlatform.iOS)
          ApplePay(
            config: _getPaymentConfig(),
            onPaymentResult: onPaymentResult,
          ),
        if (defaultTargetPlatform == TargetPlatform.iOS) const Text("or"),
        Directionality(
          textDirection: TextDirection.ltr,
          child: CreditCard(
            config: _getPaymentConfig(),
            onPaymentResult: onPaymentResult,
            locale: localization.Localization.isArabic() ? const Localization.ar() : const Localization.en(),
          ),
        )
      ],
    );
  }

  PaymentConfig _getPaymentConfig() {
    return PaymentConfig(
      publishableApiKey: getIt<AppFlavor>().appFlavorEntity.flavorType == FlavorType.PROD
          ? MoyasarConstants.publishableLiveApiKey
          : MoyasarConstants.publishableTestApiKey,
      amount: int.parse((amount * 100).toString().split('.').first),
      description: orderDesc,
      callbackUrl: kIsWeb
          ? '${EndPointsBaseUrl.init().baseRedirectUrl}${Routes.paymentWebCallbackResponseNamedPage}'
          : "https://example.com/thanks",
      metadata: _getMetadata(),
      creditCard: CreditCardConfig(saveCard: false, manual: false),
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
