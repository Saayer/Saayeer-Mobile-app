import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/common/text/rich_text_widget.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/domain/entities/outbound_shipment_entity.dart';
import 'package:saayer/features/shipments/domain/entities/shipment_entity.dart';

class OutboundShipmentWidgetHelper {
  Color getColor(ShipmentStatus shipmentStatus) {
    switch (shipmentStatus) {
      case ShipmentStatus.RECEIVED:
        {
          return !SaayerTheme().isDarkThemeMode
              ? SaayerTheme().getColorsPalette.lightOrangeColor.withOpacity(0.3)
              : SaayerTheme().getColorsPalette.orangeColor.withOpacity(0.8);
        }
      case ShipmentStatus.DELIVERED:
        {
          return SaayerTheme().getColorsPalette.lightYellowColor;
        }
      case ShipmentStatus.PAID:
        {
          return SaayerTheme().getColorsPalette.lightGreenColor;
        }
    }
  }

  Widget _getLeadingWidget(Color shipmentStatusColor) {
    return Container(
      width: 50.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: shipmentStatusColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: GenericSvgWidget(
          path: Constants.getIconPath("ic_shipment.svg"),
          color: SaayerTheme().getColorsPalette.blackTextColor,
        ),
      ),
    );
  }

  Widget _getInfoWidget(OutboundShipmentEntity outboundShipmentEntity) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichTextWidget(
            keyStr: 'shipment_number',
            valueStr: outboundShipmentEntity.id,
          ),
          RichTextWidget(
            keyStr: 'receiverName',
            valueStr: outboundShipmentEntity.receiverName,
          ),
          RichTextWidget(
            keyStr: 'shipment_date',
            valueStr: outboundShipmentEntity.date,
          ),
        ],
      ),
    );
  }

  Widget _getAmountWithTagWidget(OutboundShipmentEntity outboundShipmentEntity, Color shipmentStatusColor) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 100.w,
            child: Center(
              child: Text.rich(
                softWrap: true,
                maxLines: 3,
                TextSpan(
                  children: [
                    TextSpan(
                        text: (double.tryParse(outboundShipmentEntity.amount) ?? 0).toString(),
                        style: AppTextStyles.smallBoldLabel()),
                    TextSpan(
                        text: "  ${"sr".tr()}",
                        style: AppTextStyles.microLabel(SaayerTheme().getColorsPalette.greyColor)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
              width: 80.w,
              decoration: BoxDecoration(
                color: shipmentStatusColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                child: Text(
                  outboundShipmentEntity.shipmentStatus.name.tr(),
                  style: AppTextStyles.xSmallLabel(),
                  textAlign: TextAlign.center,
                ),
              )),
        ],
      ),
    );
  }

  Widget getOutboundShipmentWidget(ShipmentEntity shipmentEntity, bool isFromHome) {
    final OutboundShipmentEntity outboundShipmentEntity = shipmentEntity as OutboundShipmentEntity;
    final Color shipmentStatusColor = getColor(shipmentEntity.shipmentStatus);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: (isFromHome ? 5 : 10).h),
      child: Container(
        decoration: BoxDecoration(
          color: SaayerTheme().getColorsPalette.backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
              spreadRadius: isFromHome ? 2 : 5,
              blurRadius: 10,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (isFromHome ? 5 : 10).w, vertical: (isFromHome ? 5 : 16).h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _getLeadingWidget(shipmentStatusColor),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _getInfoWidget(outboundShipmentEntity),
                    SizedBox(
                      width: 5.w,
                    ),
                    _getAmountWithTagWidget(outboundShipmentEntity, shipmentStatusColor)
                  ],
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Icon(Icons.arrow_forward_ios, size: 15.r, color: SaayerTheme().getColorsPalette.greyColor),
            ],
          ),
        ),
      ),
    );
  }
}
