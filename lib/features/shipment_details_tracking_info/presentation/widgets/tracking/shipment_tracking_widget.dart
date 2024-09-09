import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/features/shipment_details_tracking_info/data/core/utils/enums.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/tracking/tracking_timeline_item.dart';

class ShipmentTrackingWidget extends StatelessWidget {
  const ShipmentTrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: TrackingStatusTypes.values.length,
              itemBuilder: (BuildContext context, int index) => TrackingTimelineItem(
                    isFirst: index == 0 ? true : false,
                    isLast: TrackingStatusTypes.values.last.index == index ? true : false,
                    label: TrackingStatusTypes.values[index].name,
                    isComplete: (state.shipmentDto!.status!.name == TrackingStatusTypes.values[index].name ||
                            TrackingStatusTypes.values[index] == TrackingStatusTypes.PAID ||
                            index == 0)
                        ? true
                        : false,
                    createdDate:
                        DateTimeUtil.convertUTCDateToLocalWithoutSec(state.shipmentDto!.createdAt!.toString()) ?? '',
                  )),
        );
      },
    );
  }
}
