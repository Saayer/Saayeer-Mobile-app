import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/dashed_line_vertical_painter.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class SenderReceiverInfo extends StatelessWidget {
  final ShipmentGetDto shipmentDto;

  const SenderReceiverInfo({super.key, required this.shipmentDto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: SaayerTheme().getColorsPalette.backgroundColor,
        borderRadius: BorderRadius.circular(16),
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
              GenericSvgWidget(
                path: Constants.getIconPath("ic_shipment.svg"),
                size: 28,
                color: SaayerTheme().getColorsPalette.primaryColor,
              ),
              Row(
                children: [
                  if (Localization.isEnglish())
                    const SizedBox(
                      width: 3,
                    ),
                  CustomPaint(size: const Size(3, 100), painter: DashedLineVerticalPainter()),
                  if (Localization.isArabic())
                    const SizedBox(
                      width: 3,
                    ),
                ],
              ),
              Icon(
                Icons.pin_drop_outlined,
                size: 28,
                color: SaayerTheme().getColorsPalette.orangeColor,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  shipmentDto.senderStore == null
                      ? shipmentDto.senderCustomer!.fullName ?? ''
                      : shipmentDto.senderStore!.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.boldLiteLabel(),
                ),
                Text(
                  "(${"sender".tr()})",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallLabel(SaayerTheme().getColorsPalette.greyColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  shipmentDto.senderStore == null
                      ? _buildAddress(shipmentDto.senderCustomer!)
                      : _buildAddress(shipmentDto.senderStore!),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallParagraph(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Divider(
                    thickness: 1,
                    color: SaayerTheme().getColorsPalette.blackTextColor,
                  ),
                ),
                Text(
                  shipmentDto.receiverStore == null
                      ? shipmentDto.receiverCustomer!.fullName ?? ''
                      : shipmentDto.receiverStore!.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.boldLiteLabel(),
                ),
                Text(
                  "(${"receiver".tr()})",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallLabel(SaayerTheme().getColorsPalette.greyColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  shipmentDto.receiverStore == null
                      ? _buildAddress(shipmentDto.receiverCustomer!)
                      : _buildAddress(shipmentDto.receiverStore!),
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
  String _buildAddress(dynamic address) {
    return '${StringsUtil.getLanguageName(arName: address.governorateNameAr ?? '', enName: address.governorateNameEn ?? '')} '
        '- ${StringsUtil.getLanguageName(arName: address.cityNameAr ?? '', enName: address.cityNameEn ?? '')} '
        '- ${address.addressDetails ?? ''}';
  }
}
