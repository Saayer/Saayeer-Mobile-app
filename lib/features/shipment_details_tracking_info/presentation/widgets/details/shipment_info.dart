import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments/presentation/widgets/shipment_item_widget_helper.dart';

class ShipmentInfo extends StatelessWidget {
  final ShipmentGetDto shipmentDto;
  final ShipmentGetDtoExtended adminShipmentDto;

  const ShipmentInfo({
    super.key,
    required this.shipmentDto,
    required this.adminShipmentDto,
  });

  @override
  Widget build(BuildContext context) {
    List<InfoRow> infoRowList = [
      InfoRow(
        iconData: LineIcons.weight,
        isDateTime: false,
        text: _getShipmentWeight(),
      ),
      InfoRow(
        iconData: LineIcons.textWidth,
        isDateTime: false,
        text: _getShipmentWidth(),
      ),
      InfoRow(
        iconData: LineIcons.textHeight,
        isDateTime: false,
        text: _getShipmentHeight(),
      ),
      InfoRow(
        iconData: Icons.expand,
        isDateTime: false,
        text: _getShipmentLength(),
      ),
      InfoRow(
        iconData: LineIcons.info,
        isDateTime: false,
        text: _getShipmentContentDesc(),
      ),
      InfoRow(
        iconData: Icons.date_range,
        isDateTime: true,
        text: _getShipmentCreatedAt(),
      ),
    ];
    final Color shipmentStatusColor =
        ShipmentItemWidgetHelper().getColor(UserUtils.isAdmin() ? adminShipmentDto.status! : shipmentDto.status!);
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  _getImportExportTitle(),
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
                      _getShipmentStatusName(),
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

  String _getShipmentWeight() {
    if (UserUtils.isAdmin()) {
      return "${adminShipmentDto.weight} ${"kg".tr()}";
    } else {
      return "${shipmentDto.weight} ${"kg".tr()}";
    }
  }

  String _getShipmentWidth() {
    if (UserUtils.isAdmin()) {
      return "${adminShipmentDto.width} ${"cm".tr()}";
    } else {
      return "${shipmentDto.width} ${"cm".tr()}";
    }
  }

  String _getShipmentHeight() {
    if (UserUtils.isAdmin()) {
      return "${adminShipmentDto.height} ${"cm".tr()}";
    } else {
      return "${shipmentDto.height} ${"cm".tr()}";
    }
  }

  String _getShipmentLength() {
    if (UserUtils.isAdmin()) {
      return "${adminShipmentDto.length} ${"cm".tr()}";
    } else {
      return "${shipmentDto.length} ${"cm".tr()}";
    }
  }

  String _getShipmentContentDesc() {
    if (UserUtils.isAdmin()) {
      return "${adminShipmentDto.contentDesc}";
    } else {
      return "${shipmentDto.contentDesc}";
    }
  }

  String _getShipmentCreatedAt() {
    if (UserUtils.isAdmin()) {
      return DateTimeUtil.convertUTCDateToLocalWithoutSec(adminShipmentDto.createdAt ?? '') ?? '';
    } else {
      return DateTimeUtil.convertUTCDateToLocalWithoutSec(shipmentDto.createdAt ?? '') ?? '';
    }
  }

  String _getImportExportTitle() {
    if (UserUtils.isAdmin()) {
      return adminShipmentDto.senderStoreId == null ? 'import_shipment'.tr() : 'export_shipment'.tr();
    } else {
      return shipmentDto.senderStoreId == null ? 'import_shipment'.tr() : 'export_shipment'.tr();
    }
  }

  String _getShipmentStatusName() {
    if (UserUtils.isAdmin()) {
      return adminShipmentDto.status!.name.tr();
    } else {
      return shipmentDto.status!.name.tr();
    }
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
        Flexible(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              isDateTime ? text.split(' ').sublist(1).join(' ') : text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.smallLabel(),
            ),
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
