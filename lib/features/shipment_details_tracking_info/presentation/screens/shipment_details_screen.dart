import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/pages/shipment_details_page.dart';

class ShipmentDetailsScreen extends StatelessWidget {
  final ShipmentGetDto shipmentDto;

  const ShipmentDetailsScreen({super.key, required this.shipmentDto});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocProvider(
        create: (context) => getIt<ShipmentDetailsBloc>()
          ..add(InitShipmentDetails(shipmentDto: shipmentDto))
          ..add(GetShipmentTrackingList(shipmentId: shipmentDto.shipmentId!)),
        child: ShipmentDetailsPage(shipmentEntity: shipmentDto),
      ),
    );
  }
}
