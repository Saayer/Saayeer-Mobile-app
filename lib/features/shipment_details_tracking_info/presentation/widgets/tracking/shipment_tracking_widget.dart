import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/core/services/url_services/lunch_url_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/tracking/tracking_timeline_item.dart';

class ShipmentTrackingWidget extends StatelessWidget {
  final int? shipmentId;

  const ShipmentTrackingWidget({super.key, required this.shipmentId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: (state.shipmentTrackingList ?? []).length + 1,
              itemBuilder: (BuildContext context, int index) => index != (state.shipmentTrackingList ?? []).length
                  ? TrackingTimelineItem(
                      isFirst: index == 0 ? true : false,
                      isLast: index == state.shipmentTrackingList!.length - 1 ? true : false,
                      label: state.shipmentTrackingList![index].status!.name,
                      isComplete: state.shipmentTrackingList![index].createdAt == null ? false : true,
                      description: state.shipmentTrackingList![index].description ?? '',
                      createdDate: DateTimeUtil.convertUTCDateToLocalWithoutSec(
                              (state.shipmentTrackingList![index].createdAt ?? '')) ??
                          '',
                    )
                  : state.errorTrackingItem == null
                      ? Container()
                      : _buildShowErrorTrackingItem(state.errorTrackingItem)),
        );
      },
    );
  }

  _buildShowErrorTrackingItem(ShipmentStatusGetDto? errorTrackingItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                Constants.getGifPath("error.gif"),
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      errorTrackingItem!.status!.name,
                      style: AppTextStyles.boldLabel(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      errorTrackingItem.description ?? '',
                      style: AppTextStyles.smallLabel(),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: 'tracking_error_msg'.tr(), style: AppTextStyles.boldLabel()),
            TextSpan(
                text: 'contact_us'.tr(),
                style: AppTextStyles.boldLabel(SaayerTheme().getColorsPalette.blueColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ///
                    LunchUrlService.lunchGenericUrl(
                        'whatsapp://send?phone=${Constants.saayerPhone}&text=${'shipment_error_whatsapp_msg'.tr().replaceFirst('{}', shipmentId.toString())}');
                  })
          ]))
        ],
      ),
    );
  }
}
