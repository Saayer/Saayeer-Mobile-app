import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipment_information/presentation/bloc/information_shipment_bloc.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipment_information/presentation/pages/information_shipment_page.dart';

class InformationShipmentScreen extends StatelessWidget {
  const InformationShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocProvider<InformationShipmentBloc>(
        create: (context) => getIt<InformationShipmentBloc>(),
        child: const InformationShipmentPage());
  }
}
