import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class BillInfo extends StatelessWidget {
  final ShipmentGetDto shipmentDto;
  final ShipmentGetDtoExtended adminShipmentDto;

  const BillInfo({
    super.key,
    required this.shipmentDto,
    required this.adminShipmentDto,
  });

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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GenericSvgWidget(
                  path: Constants.getIconPath("ic_bill.svg"),
                  size: 25,
                  color: SaayerTheme().getColorsPalette.lightOrangeColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "bill".tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.boldLiteLabel(),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "service_provider".tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.label(),
                ),
                Text(
                  _getLogisticServiceName(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallLabel(SaayerTheme().getColorsPalette.darkGreyColor),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Divider(
                thickness: 1,
                color: SaayerTheme().getColorsPalette.blackTextColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "cost".tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.boldLabel(),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    _getShipmentCost(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.smallLabel(SaayerTheme().getColorsPalette.darkGreyColor),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  String _getLogisticServiceName() {
    if (UserUtils.isAdmin()) {
      return adminShipmentDto.logisticServiceName ?? "";
    } else {
      return shipmentDto.logisticServiceName ?? "";
    }
  }

  String _getShipmentCost() {
    if (UserUtils.isAdmin()) {
      return "${(adminShipmentDto.cost ?? 0).toStringAsFixed(2)} ${"sr".tr()}";
    } else {
      return "${(shipmentDto.cost ?? 0).toStringAsFixed(2)} ${"sr".tr()}";
    }
  }
}
