import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/text/rich_text_widget.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class ClientItemWidgetHelper {
  Widget getClientItemWidget({
    required ClientGetDto clientGetDto,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: SaayerTheme().getColorsPalette.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _getLeadingWidget(),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _getInfoWidget(clientGetDto),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              _getInfoWidget2(clientGetDto),
              Icon(Icons.arrow_forward_ios, size: 15, color: SaayerTheme().getColorsPalette.greyColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLeadingWidget() {
    return Container(
        width: 50,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          Constants.getIconPath("ic_logo.png"),
          width: 30,
          height: 30,
        ));
  }

  Widget _getInfoWidget(ClientGetDto clientGetDto) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichTextWidget(
            keyStr: 'client_number',
            valueStr: clientGetDto.clientId.toString(),
          ),
          const SizedBox(height: 4),
          if (clientGetDto.businessName != null && clientGetDto.businessName!.isNotEmpty) ...[
            RichTextWidget(
              keyStr: 'business_name',
              valueStr: clientGetDto.businessName.toString(),
            ),
            const SizedBox(height: 4)
          ],
          RichTextWidget(
            keyStr: 'client_name',
            valueStr: clientGetDto.fullName ?? '',
          ),
          const SizedBox(height: 4),
          RichTextWidget(
            keyStr: 'phone_num',
            valueStr: clientGetDto.phoneNo ?? '',
          ),
          const SizedBox(height: 4),
          if (clientGetDto.email != null && clientGetDto.email!.isNotEmpty) ...[
            RichTextWidget(
              keyStr: 'email',
              valueStr: clientGetDto.email ?? '',
            ),
            const SizedBox(height: 4)
          ],
        ],
      ),
    );
  }

  Widget _getInfoWidget2(ClientGetDto clientGetDto) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichTextWidget(
            keyStr: 'stores',
            valueStr: (clientGetDto.numberOfStores ?? '').toString(),
          ),
          const SizedBox(height: 4),
          RichTextWidget(
            keyStr: 'total_shipments',
            valueStr: (clientGetDto.totalShipments ?? '').toString(),
          ),
          const SizedBox(height: 4),
          RichTextWidget(
            keyStr: 'total_paid',
            valueStr: (clientGetDto.totalPaid ?? 0).toStringAsFixed(2),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text("${'join_date'.tr()} : ",
                  style: AppTextStyles.microLabel(SaayerTheme().getColorsPalette.greyColor)),
              Flexible(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                      (DateTimeUtil.convertUTCDateToLocalWithoutSec(clientGetDto.createdAt ?? '') ?? '')
                          .split(' ')
                          .sublist(1)
                          .join(' '),
                      style: AppTextStyles.xSmallLabel()),
                ),
              ),
              Text(
                  ' ${(DateTimeUtil.convertUTCDateToLocalWithoutSec(clientGetDto.createdAt ?? '') ?? '').split('').first}',
                  style: AppTextStyles.xSmallLabel()),
            ],
          ),
          const SizedBox(height: 4),
          if (clientGetDto.address != null && clientGetDto.address!.isNotEmpty) ...[
            RichTextWidget(
              keyStr: 'address',
              valueStr: clientGetDto.address ?? '',
            ),
          ],
        ],
      ),
    );
  }
}
