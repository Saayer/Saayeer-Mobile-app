import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/domain/entities/shipment_details_entity.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/domain/entities/shipment_tracking_entity.dart';
import 'package:saayer/features/shipments/presentation/widgets/shipment_item_widget_helper.dart';

class StatusInfo extends StatelessWidget {
  final ShipmentTrackingEntity shipmentTrackingEntity;
  final ShipmentDetailsEntity shipmentDetailsEntity;

  const StatusInfo(
      {super.key,
      required this.shipmentTrackingEntity,
      required this.shipmentDetailsEntity});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final Color shipmentStatusColor = ShipmentItemWidgetHelper()
        .getColor(shipmentDetailsEntity.shipmentStatus);
    final String statusName = shipmentDetailsEntity.shipmentStatus.name;
    return Container(
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: shipmentStatusColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Text(
                statusName.tr(),
                style: AppTextStyles.sectionTitle(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "${statusName}_msg".tr(),
                style: AppTextStyles.microLabel(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              Lottie.asset(
                  height: 150.h,
                  Constants.getLottiePath("${statusName}_shipment.json"))
            ],
          ),
        ));
  }
}
