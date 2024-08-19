import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/pages/shipment_details_page.dart';
import 'package:saayer/features/shipments/domain/entities/shipment_entity.dart';

class ShipmentDetailsScreen extends StatelessWidget {
  final ShipmentEntity shipmentEntity;

  const ShipmentDetailsScreen({super.key, required this.shipmentEntity});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
          getIt<ShipmentDetailsBloc>()..add(InitShipmentDetails(shipmentEntity: shipmentEntity)),
      child: ShipmentDetailsPage(shipmentEntity: shipmentEntity),
    );
  }
}
