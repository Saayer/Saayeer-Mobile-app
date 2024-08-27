import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/cached_network_image_widget.dart';
import 'package:saayer/common/text/rich_text_widget.dart';
import 'package:saayer/core/API/end_points/builder/end_points_base_url.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';

class ShipmentItemWidgetHelper {
  Widget getShipmentWidget({
    required ShipmentGetDto shipmentDto,
    required bool isFromHome,
    required ShipmentsListTypes shipmentsListType,
  }) {
    final Color shipmentStatusColor = getColor(ShipmentsStatus.PAID);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: (isFromHome ? 5 : 10)),
      child: Container(
        decoration: BoxDecoration(
          color: SaayerTheme().getColorsPalette.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
              spreadRadius: isFromHome ? 2 : 5,
              blurRadius: 10,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (isFromHome ? 5 : 10), vertical: (isFromHome ? 5 : 10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _getLeadingWidget(shipmentDto),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _getInfoWidget(shipmentDto, shipmentsListType),
                    const SizedBox(
                      width: 5,
                    ),
                    _getAmountWithTagWidget(shipmentDto, shipmentStatusColor)
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_forward_ios, size: 15, color: SaayerTheme().getColorsPalette.greyColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLeadingWidget(ShipmentGetDto shipmentDto) {
    return Container(
        width: 50,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: CachedNetworkImageWidget(
          imageUrl: EndPointsBaseUrl.init().baseUrl +
              Constants.imagesBaseUrl.replaceFirst("{}", shipmentDto.logisticServiceName ?? ''),
        ));
  }

  Widget _getInfoWidget(ShipmentGetDto shipmentDto, ShipmentsListTypes shipmentsListType) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichTextWidget(
            keyStr: 'shipment_number',
            valueStr: shipmentDto.shipmentId.toString(),
          ),
          const SizedBox(height: 4),
          RichTextWidget(
            keyStr: shipmentsListType == ShipmentsListTypes.EXPORT ? 'receiverName' : 'senderName',
            valueStr: shipmentsListType == ShipmentsListTypes.EXPORT
                ? shipmentDto.receiverStore == null
                    ? shipmentDto.receiverCustomer?.fullName ?? ''
                    : shipmentDto.receiverStore?.name ?? ''
                : shipmentDto.senderStore == null
                    ? shipmentDto.senderCustomer?.fullName ?? ''
                    : shipmentDto.senderStore?.name ?? '',
          ),
          const SizedBox(height: 4),
          RichTextWidget(
            keyStr: 'shipment_date',
            valueStr: DateTimeUtil.convertUTCDateToLocalWithoutSec(shipmentDto.createdAt.toString()) ?? '',
          ),
          const SizedBox(height: 4),
          RichTextWidget(
            keyStr: 'address',
            valueStr: _getAddress(shipmentsListType, shipmentDto),
          ),
        ],
      ),
    );
  }

  Widget _getAmountWithTagWidget(ShipmentGetDto shipmentDto, Color shipmentStatusColor) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichTextWidget(
            keyStr: 'weight_kg',
            valueStr: shipmentDto.weight.toString(),
          ),
          const SizedBox(
            height: 5,
          ),
          Text.rich(
            softWrap: true,
            maxLines: 3,
            TextSpan(
              children: [
                TextSpan(text: (shipmentDto.cost).toString(), style: AppTextStyles.smallBoldLabel()),
                TextSpan(
                    text: "  ${"sar".tr()}", style: AppTextStyles.microLabel(SaayerTheme().getColorsPalette.greyColor)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              width: 80,
              decoration: BoxDecoration(
                color: shipmentStatusColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Text(
                  shipmentDto.status.toString(),
                  style: AppTextStyles.xSmallLabel(),
                  textAlign: TextAlign.center,
                ),
              )),
        ],
      ),
    );
  }

  Color getColor(ShipmentsStatus shipmentStatus) {
    switch (shipmentStatus) {
      case ShipmentsStatus.RECEIVED:
        {
          return !SaayerTheme().isDarkThemeMode
              ? SaayerTheme().getColorsPalette.lightOrangeColor.withOpacity(0.3)
              : SaayerTheme().getColorsPalette.orangeColor.withOpacity(0.8);
        }
      case ShipmentsStatus.DELIVERED:
        {
          return SaayerTheme().getColorsPalette.lightYellowColor;
        }
      case ShipmentsStatus.PAID:
        {
          return SaayerTheme().getColorsPalette.lightGreenColor;
        }
    }
  }

  String _getAddress(ShipmentsListTypes shipmentsListType, ShipmentGetDto shipmentDto) {
    switch (shipmentsListType) {
      case ShipmentsListTypes.EXPORT:
        {
          if (shipmentDto.receiverStore == null) {
            return _buildAddress(shipmentDto.receiverCustomer);
          } else {
            return _buildAddress(shipmentDto.receiverStore);
          }
        }
      case ShipmentsListTypes.IMPORT:
        {
          if (shipmentDto.senderStore == null) {
            return _buildAddress(shipmentDto.senderCustomer);
          } else {
            return _buildAddress(shipmentDto.senderStore);
          }
        }
    }
  }

  String _buildAddress(dynamic address) {
    return '${StringsUtil.getLanguageName(arName: address.governorateNameAr ?? '', enName: address.governorateNameEn ?? '')} '
        '- ${StringsUtil.getLanguageName(arName: address.cityNameAr ?? '', enName: address.cityNameEn ?? '')}';
  }
}
