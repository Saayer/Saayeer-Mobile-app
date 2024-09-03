import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/tracking/status_info.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/tracking/tracking_info.dart';

class ShipmentTrackingWidget extends StatelessWidget {
  const ShipmentTrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                TrackingInfo(
                  shipmentTrackingEntity: state.shipmentTrackingEntity!,
                ),
                const SizedBox(
                  height: 20,
                ),
                StatusInfo(
                  shipmentTrackingEntity: state.shipmentTrackingEntity!,
                  shipmentDetailsEntity: state.shipmentDto!,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
