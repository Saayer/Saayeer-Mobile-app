import 'package:flutter/material.dart';
import 'package:moyasar/moyasar.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';

class ShipmentPaymentErrorHandler {
  final PaymentStatus status;
  final String message;

  ShipmentPaymentErrorHandler({
    required this.status,
    required this.message,
  });

  final BuildContext context = getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleShipmentPaymentErrorStatus(status, message);
  }

  void _handleShipmentPaymentErrorStatus(PaymentStatus errorStatus, String message) {
    // ERROR_RequestNewShipment
    switch (errorStatus) {
      case PaymentStatus.failed:
        {
          SaayerDialogs().oneBtnDialog(title: "error_title", message: message);
          break;
        }
      default:
        //ERR_00
        {
          SaayerDialogs().oneBtnDialog(
            title: "error_title",
            message: message,
          );
          break;
        }
    }
  }
}
