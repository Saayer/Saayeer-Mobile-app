import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/domain/entities/shipment_details_entity.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/helper/outbound_shipment_widget_helper.dart';

class BasicInfo extends StatelessWidget {
  final ShipmentDetailsEntity shipmentDetailsEntity;

  const BasicInfo({super.key, required this.shipmentDetailsEntity});

  @override
  Widget build(BuildContext context) {
    List<InfoRow> infoRowList = [
      InfoRow(
          iconData: LineIcons.weight,
          text: "${shipmentDetailsEntity.weight ?? ""} ${"kg".tr()}"),
      InfoRow(
        iconData: LineIcons.moneyBill,
        text: "${shipmentDetailsEntity.price ?? ""} ${"sr".tr()}",
      ),
      InfoRow(
        iconData: Icons.date_range,
        text: shipmentDetailsEntity.date,
      ),
    ];
    final Color shipmentStatusColor = OutboundShipmentWidgetHelper()
        .getColor(shipmentDetailsEntity.shipmentStatus);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: SaayerTheme().getColorsPalette.backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                shipmentDetailsEntity.type ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.buttonLabel(),
              ),
              SizedBox(
                height: 5.h,
              ),
              ...(infoRowList.map((e) {
                return Column(
                  children: [
                    e,
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                );
              }).toList()),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                Constants.getIconPath("ic_shipment.svg"),
                fit: BoxFit.contain,
                height: 50.h,
                width: 50.w,
                color: SaayerTheme().getColorsPalette.blackTextColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: shipmentStatusColor,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Text(
                      shipmentDetailsEntity.shipmentStatus.name.tr(),
                      style: AppTextStyles.label(),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData iconData;
  final String text;

  const InfoRow({
    super.key,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          iconData,
          size: 20.r,
          color: SaayerTheme().getColorsPalette.lightOrangeColor,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.smallLabel(),
        ),
      ],
    );
  }
}
