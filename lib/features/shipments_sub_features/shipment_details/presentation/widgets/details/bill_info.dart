import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saayer/common/dashed_line_vertical_painter.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/domain/entities/shipment_details_entity.dart';

class BillInfo extends StatelessWidget {
  final ShipmentDetailsEntity shipmentDetailsEntity;

  const BillInfo({super.key, required this.shipmentDetailsEntity});

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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  Constants.getIconPath("ic_bill.svg"),
                  fit: BoxFit.cover,
                  height: 25.h,
                  width: 25.w,
                  color: SaayerTheme().getColorsPalette.lightOrangeColor,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "bill".tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.boldLiteLabel(),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "shipping_fees".tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.label(),
                ),
                Text(
                  "${shipmentDetailsEntity.shippingFees ?? ""} ${"sr".tr()}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallLabel(
                      SaayerTheme().getColorsPalette.darkGreyColor),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Divider(
                thickness: 1,
                color: SaayerTheme().getColorsPalette.blackTextColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "total_price".tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.boldLabel(),
                ),
                Text(
                  "${shipmentDetailsEntity.totalPrice ?? ""} ${"sr".tr()}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallLabel(
                      SaayerTheme().getColorsPalette.darkGreyColor),
                ),
              ],
            ),
          ],
        ));
  }
}
