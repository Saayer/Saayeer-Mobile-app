import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/widgets/tracking/status_info.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/widgets/tracking/tracking_info.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/helper/outbound_shipment_widget_helper.dart';

class ShipmentTrackingWidget extends StatelessWidget {
  const ShipmentTrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
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
