import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments/presentation/widgets/shipment_item_widget_helper.dart';

class ShipmentInfo extends StatelessWidget {
  final ShipmentGetDto shipmentDto;

  const ShipmentInfo({super.key, required this.shipmentDto});

  @override
  Widget build(BuildContext context) {
    List<InfoRow> infoRowList = [
      InfoRow(
        iconData: LineIcons.weight,
        isDateTime: false,
        text: "${shipmentDto.weight} ${"kg".tr()}",
      ),
      InfoRow(
        iconData: LineIcons.textWidth,
        isDateTime: false,
        text: "${shipmentDto.width} ${"cm".tr()}",
      ),
      InfoRow(
        iconData: LineIcons.textHeight,
        isDateTime: false,
        text: "${shipmentDto.height} ${"cm".tr()}",
      ),
      InfoRow(
        iconData: Icons.expand,
        isDateTime: false,
        text: "${shipmentDto.length} ${"cm".tr()}",
      ),
      InfoRow(
        iconData: LineIcons.info,
        isDateTime: false,
        text: "${shipmentDto.contentDesc}",
      ),
      InfoRow(
        iconData: Icons.date_range,
        isDateTime: true,
        text: DateTimeUtil.convertUTCDateToLocalWithoutSec(shipmentDto.createdAt ?? '') ?? '',
      ),
    ];
    final Color shipmentStatusColor = ShipmentItemWidgetHelper().getColor(shipmentDto.status!);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                shipmentDto.senderStoreId == null ? 'import_shipment'.tr() : 'export_shipment'.tr(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.buttonLabel(),
              ),
              const SizedBox(
                height: 5,
              ),
              ...(infoRowList.map((e) {
                return Column(
                  children: [
                    e,
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                );
              }).toList()),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Column(
            children: [
              GenericSvgWidget(
                path: Constants.getIconPath("ic_shipment.svg"),
                size: 50,
                color: SaayerTheme().getColorsPalette.blackTextColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: shipmentStatusColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Text(
                      shipmentDto.status!.name.tr(),
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
  final bool isDateTime;

  const InfoRow({
    super.key,
    required this.iconData,
    required this.text,
    required this.isDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          iconData,
          size: 20,
          color: SaayerTheme().getColorsPalette.lightOrangeColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            isDateTime ? text.split(' ').sublist(1).join(' ') : text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.smallLabel(),
          ),
        ),
        isDateTime
            ? Text(
                ' ${text.split(' ').first}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.smallLabel(),
              )
            : Container(),
      ],
    );
  }
}
