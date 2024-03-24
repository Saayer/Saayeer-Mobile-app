import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/domain/entities/shipment_specs_entity.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/presentation/bloc/shipment_specs_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/presentation/pages/shipment_specs_page.dart';

class ShipmentSpecsScreen extends StatelessWidget {
  final bool isAddShipmentRequest;
  final void Function(ShipmentSpecsEntity)? onBack;

  const ShipmentSpecsScreen(
      {super.key, required this.isAddShipmentRequest, this.onBack});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocProvider<ShipmentSpecsBloc>(
        create: (context) => getIt<ShipmentSpecsBloc>(),
        child: ShipmentSpecsPage(
            isAddShipmentRequest: isAddShipmentRequest, onBack: onBack));
  }
}
