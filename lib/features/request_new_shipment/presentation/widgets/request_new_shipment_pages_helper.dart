import 'package:flutter/material.dart';
import 'package:saayer/features/request_new_shipment/sub_features/receiver/presentation/screens/receiver_screen.dart';
import 'package:saayer/features/request_new_shipment/sub_features/sender/presentation/screens/sender_screen.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_checkout_payment/presentation/screens/shipment_checkout_payment_screen.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/screens/shipment_providers_screen.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_spec_info/presentation/screens/shipment_spec_info_screen.dart';

class RequestNewShipmentPagesHelper {
  RequestNewShipmentPagesHelper();

  List<Widget> requestShipmentPages() => [
        const SenderScreen(),
        const ReceiverScreen(),
        const ShipmentSpecInfoScreen(),
        const ShipmentProvidersScreen(),
        const ShipmentCheckoutPaymentScreen(),
      ];
}
