import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/presentation/bloc/shipment_payment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/presentation/pages/shipment_payment_page.dart';

class ShipmentPaymentScreen extends StatelessWidget {
  const ShipmentPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<ShipmentPaymentBloc>();
        return bloc;
      },
      child: const ShipmentPaymentPage(),
    );
  }
}
