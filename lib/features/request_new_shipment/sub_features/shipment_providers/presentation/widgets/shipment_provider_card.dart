import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/cached_network_image_widget.dart';
import 'package:saayer/common/text/rich_text_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/shipment_provider_model.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';

class ShipmentProviderCard extends StatelessWidget {
  final ShipmentProviderModel shipmentProviderModel;

  const ShipmentProviderCard({required this.shipmentProviderModel, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<RequestNewShipmentBloc>().add(GoToNextPageEvent());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Container(
          decoration: BoxDecoration(
            color: SaayerTheme().getColorsPalette.backgroundColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color:
                    SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _getLeadingWidget(),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shipmentProviderModel.name!,
                        style: AppTextStyles.mainLabel(),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      RichTextWidget(
                        keyStr: 'service_type'.tr(),
                        valueStr: shipmentProviderModel.featuereName!,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      RichTextWidget(
                        keyStr: 'delivery_days'.tr(),
                        valueStr: shipmentProviderModel.deliverDaysPharse!,
                      ),
                    ],
                  ),
                ),
                Text(
                  shipmentProviderModel.totalPrice!.toString(),
                  style: AppTextStyles.boldLiteLabel(),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 15.r,
                    color: SaayerTheme().getColorsPalette.greyColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getLeadingWidget() {
    return Container(
      width: 80.w,
      height: 80.h,
      // decoration: BoxDecoration(
      //   color: shipmentStatusColor,
      //   borderRadius: BorderRadius.circular(12.r),
      // ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: CachedNetworkImageWidget(
          imageUrl: shipmentProviderModel.icon!,
        ),
      ),
    );
  }
}
