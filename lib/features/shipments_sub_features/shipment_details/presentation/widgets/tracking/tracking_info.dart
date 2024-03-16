import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saayer/core/helpers/snackbar_helper/snackbar_helper.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/domain/entities/shipment_tracking_entity.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/helper/outbound_shipment_widget_helper.dart';

class TrackingInfo extends StatelessWidget {
  final ShipmentTrackingEntity shipmentTrackingEntity;

  const TrackingInfo({super.key, required this.shipmentTrackingEntity});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "tracking_id".tr(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.boldLiteLabel(),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(
                              text: shipmentTrackingEntity.trackingId))
                          .whenComplete(() {
                        SnackbarHelper.show(msg: "tracking_id_copied_msg");
                      });
                    },
                    child: Icon(
                      Icons.copy,
                      size: 20.r,
                      color: SaayerTheme().getColorsPalette.darkGreyColor,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    shipmentTrackingEntity.trackingId ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.smallParagraph(),
                  ),
                ],
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
            ],
          ),
        ],
      ),
    );
  }
}
