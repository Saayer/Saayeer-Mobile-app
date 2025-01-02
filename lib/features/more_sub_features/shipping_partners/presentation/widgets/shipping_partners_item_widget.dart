import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/cached_network_image_widget.dart';
import 'package:saayer/core/API/end_points/builder/end_points_base_url.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class ShippingPartnersItemWidget extends StatelessWidget {
  final LogisticServiceGetDto shippingPartnersItem;

  const ShippingPartnersItemWidget({
    super.key,
    required this.shippingPartnersItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
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
          child: ListTile(
            leading: _getLeadingWidget(),
            trailing: (shippingPartnersItem.isImplemented ?? true)
                ? Text('shipping_partners_available'.tr())
                : Text('soon'.tr(), style: AppTextStyles.xSmallLabel(SaayerTheme().getColorsPalette.greyColor)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          )),
    );
  }

  Widget _getLeadingWidget() {
    return CachedNetworkImageWidget(
      imageUrl: EndPointsBaseUrl.init().baseUrl +
          Constants.imagesBaseUrl.replaceFirst("{}", shippingPartnersItem.serviceName ?? ''),
      height: 60,
      width: 60,
    );
  }
}
