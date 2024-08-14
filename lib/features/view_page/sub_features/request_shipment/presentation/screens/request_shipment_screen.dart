import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/pages/request_shipment_page.dart';

class RequestShipmentScreen extends StatelessWidget {
  const RequestShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<RequestShipmentBloc>();
        bloc.add(const GetStoresAddresses());
        return bloc;
      },
      child: const RequestShipmentPage(),
    );
  }
}
