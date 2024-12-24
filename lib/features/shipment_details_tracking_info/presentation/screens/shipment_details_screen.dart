import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/pages/shipment_details_page.dart';

class ShipmentDetailsScreen extends StatelessWidget {
  final ShipmentGetDto shipmentDto;
  final ShipmentGetDtoExtended adminShipmentDto;

  const ShipmentDetailsScreen({
    super.key,
    required this.shipmentDto,
    required this.adminShipmentDto,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocProvider(
        create: (context) {
          var bloc = getIt<ShipmentDetailsBloc>();
          bloc.add(InitShipmentDetails(shipmentDto: shipmentDto, adminShipmentDto: adminShipmentDto));

          ///
          if (UserUtils.isAdmin()) {
            bloc.add(GetShipmentTrackingList(shipmentId: adminShipmentDto.shipmentId!));
          } else {
            bloc.add(GetShipmentTrackingList(shipmentId: shipmentDto.shipmentId!));
          }

          return bloc;
        },
        child: ShipmentDetailsPage(
          shipmentEntity: shipmentDto,
          adminShipmentDto: adminShipmentDto,
        ),
      ),
    );
  }
}
