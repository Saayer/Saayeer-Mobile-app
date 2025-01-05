import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/cached_network_image_widget.dart';
import 'package:saayer/core/API/end_points/builder/end_points_base_url.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class ShipmentProviderCard extends StatelessWidget {
  final LogisticCostDto shipmentProviderModel;
  final ValueChanged<LogisticCostDto?>? onChanged;
  final LogisticCostDto? groupValue;

  const ShipmentProviderCard(
      {super.key, required this.shipmentProviderModel, required this.onChanged, required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
          child: RadioListTile<LogisticCostDto>(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getLeadingWidget(),
                (shipmentProviderModel.logisticService?.isImplemented ?? true)
                    ? (shipmentProviderModel.hasError ?? false)
                        ? Text('not_available'.tr(),
                            style: AppTextStyles.xSmallLabel(SaayerTheme().getColorsPalette.greyColor))
                        :

                        /// Cost & Business days
                        _buildRowColumnWidget(context)
                    : Text('soon'.tr(), style: AppTextStyles.xSmallLabel(SaayerTheme().getColorsPalette.greyColor))
              ],
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            value: ((shipmentProviderModel.hasError ?? false) ||
                    !(shipmentProviderModel.logisticService?.isImplemented ?? true))
                ? LogisticCostDto()
                : shipmentProviderModel,
            groupValue: groupValue,
            activeColor: SaayerTheme().getColorsPalette.primaryColor,
            onChanged: ((shipmentProviderModel.hasError ?? false) ||
                    !(shipmentProviderModel.logisticService?.isImplemented ?? true))
                ? null
                : onChanged,
          )),
    );
  }

  Widget _getLeadingWidget() {
    return CachedNetworkImageWidget(
      imageUrl: EndPointsBaseUrl.init().baseUrl +
          Constants.imagesBaseUrl.replaceFirst("{}", shipmentProviderModel.logisticService?.serviceName ?? ''),
      height: 60,
      width: 60,
    );
  }

  _buildRowColumnWidget(BuildContext context) {
    return ResponsiveRowColumnItem(
        child: ResponsiveRowColumn(
      layout: ResponsiveValue(context,
              conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
              defaultValue: ResponsiveRowColumnType.COLUMN)
          .value,
      columnVerticalDirection: VerticalDirection.down,
      columnMainAxisSize: MainAxisSize.min,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      columnSpacing: 10,
      rowSpacing: 15,
      children: [
        ResponsiveRowColumnItem(
            child: Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            '${shipmentProviderModel.price} ${'sr'.tr()}',
            style: AppTextStyles.boldLabel(),
          ),
        )),
        ResponsiveRowColumnItem(
            child: (shipmentProviderModel.logisticService?.workDaysMinimum == null)
                ? const Text('')
                : Text(
                    '${shipmentProviderModel.logisticService?.workDaysMinimum} - ${shipmentProviderModel.logisticService?.workDaysMaximum} ${'business_days'.tr()}',
                    style: AppTextStyles.xSmallLabel())),
      ],
    ));
  }
}
