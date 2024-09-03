import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/details/shipment_info.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/details/bill_info.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/details/sender_receiver_info.dart';

class ShipmentDetailsWidget extends StatelessWidget {
  const ShipmentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                ///ShipmentSpecInfo
                ShipmentInfo(
                  shipmentDto: state.shipmentDto!,
                ),
                const SizedBox(height: 16),

                ///SenderReceiverInfo
                SenderReceiverInfo(
                  shipmentDto: state.shipmentDto!,
                ),
                const SizedBox(height: 16),

                ///ServiceProviderInfo
                BillInfo(
                  shipmentDto: state.shipmentDto!,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }
}
