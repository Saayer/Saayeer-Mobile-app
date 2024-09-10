import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipment_details_tracking_info/domain/entities/shipment_tracking_entity.dart';
import 'package:saayer/features/shipments/presentation/widgets/shipment_item_widget_helper.dart';

class StatusInfo extends StatelessWidget {
  final ShipmentTrackingEntity shipmentTrackingEntity;
  final ShipmentGetDto shipmentDetailsEntity;

  const StatusInfo({super.key, required this.shipmentTrackingEntity, required this.shipmentDetailsEntity});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final Color shipmentStatusColor = ShipmentItemWidgetHelper().getColor(shipmentDetailsEntity.status!);
    final String statusName = shipmentDetailsEntity.status!.name;
    return Container(
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: shipmentStatusColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Text(
                statusName.tr(),
                style: AppTextStyles.sectionTitle(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${statusName}_msg".tr(),
                style: AppTextStyles.microLabel(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Lottie.asset(height: 150, Constants.getLottiePath("${statusName}_shipment.json"))
            ],
          ),
        ));
  }
}
