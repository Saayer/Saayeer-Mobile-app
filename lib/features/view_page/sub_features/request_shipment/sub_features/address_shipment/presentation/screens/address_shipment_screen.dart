import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/presentation/bloc/address_shipment_bloc.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/presentation/pages/address_shipment_page.dart';

class AddressShipmentScreen extends StatelessWidget {
  const AddressShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocProvider<AddressShipmentBloc>(
        create: (context) => getIt<AddressShipmentBloc>(),
        child: const AddressShipmentPage());
  }
}