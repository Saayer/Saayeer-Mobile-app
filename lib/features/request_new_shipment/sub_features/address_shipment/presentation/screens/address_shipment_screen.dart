import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/request_new_shipment/sub_features/address_shipment/presentation/bloc/address_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/address_shipment/presentation/pages/address_shipment_page.dart';

class AddressShipmentScreen extends StatelessWidget {
  const AddressShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider<AddressShipmentBloc>(
        create: (context) => getIt<AddressShipmentBloc>(),
        child: const AddressShipmentPage());
  }
}
