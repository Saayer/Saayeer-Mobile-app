import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/presentation/pages/request_new_shipment_page.dart';

class RequestNewShipmentScreen extends StatelessWidget {
  const RequestNewShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<RequestNewShipmentBloc>();
        bloc.add(const GetStoresAddresses());
        return bloc;
      },
      child: const RequestNewShipmentPage(),
    );
  }
}
