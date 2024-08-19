import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/widgets/tracking/status_info.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/widgets/tracking/tracking_info.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                TrackingInfo(
                  shipmentTrackingEntity: state.shipmentTrackingEntity!,
                ),
                SizedBox(
                  height: 20.h,
                ),
                StatusInfo(
                  shipmentTrackingEntity: state.shipmentTrackingEntity!,
                  shipmentDetailsEntity: state.shipmentDetailsEntity!,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
