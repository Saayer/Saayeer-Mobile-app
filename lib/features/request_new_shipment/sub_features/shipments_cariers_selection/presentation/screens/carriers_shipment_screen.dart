import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipments_cariers_selection/presentation/bloc/carriers_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipments_cariers_selection/presentation/pages/carriers_shipment_page.dart';

class CarriersShipmentScreen extends StatelessWidget {
  const CarriersShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider<CarriersShipmentBloc>(
        create: (context) => getIt<CarriersShipmentBloc>(),
        child: const CarriersShipmentPage());
  }
}
