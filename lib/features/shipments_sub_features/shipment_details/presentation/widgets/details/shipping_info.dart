import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saayer/common/dashed_line_vertical_painter.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/domain/entities/shipment_details_entity.dart';

class ShippingInfo extends StatelessWidget {
  final ShipmentDetailsEntity shipmentDetailsEntity;

  const ShippingInfo({super.key, required this.shipmentDetailsEntity});

  @override
  Widget build(BuildContext context) {
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
            children: [
              SvgPicture.asset(
                Constants.getIconPath("ic_shipment.svg"),
                fit: BoxFit.cover,
                height: 28.h,
                width: 28.w,
                color: SaayerTheme().getColorsPalette.primaryColor,
              ),
              Row(
                children: [
                  if (Localization.isEnglish())
                    SizedBox(
                      width: 3.w,
                    ),
                  CustomPaint(
                      size: Size(3.w, 100.h),
                      painter: DashedLineVerticalPainter()),
                  if (Localization.isArabic())
                    SizedBox(
                      width: 3.w,
                    ),
                ],
              ),
              Icon(
                Icons.pin_drop_outlined,
                size: 28.r,
                color: SaayerTheme().getColorsPalette.orangeColor,
              ),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  shipmentDetailsEntity.senderName ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.boldLiteLabel(),
                ),
                Text(
                  "(${"sender".tr()})",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallLabel(
                      SaayerTheme().getColorsPalette.greyColor),
                ),
                Text(
                  shipmentDetailsEntity.senderAddress ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallParagraph(),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                  child: Divider(
                    thickness: 1,
                    color: SaayerTheme().getColorsPalette.blackTextColor,
                  ),
                ),
                Text(
                  shipmentDetailsEntity.receiverName ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.boldLiteLabel(),
                ),
                Text(
                  "(${"receiver".tr()})",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallLabel(
                      SaayerTheme().getColorsPalette.greyColor),
                ),
                Text(
                  shipmentDetailsEntity.receiverAddress ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallParagraph(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
