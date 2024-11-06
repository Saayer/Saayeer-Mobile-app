import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/helpers/snackbar_helper/snackbar_helper.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class TrackingInfo extends StatelessWidget {
  const TrackingInfo({
    super.key,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "tracking_id".tr(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.boldLiteLabel(),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(const ClipboardData(text: '15606sedfs65f1')).whenComplete(() {
                        SnackbarHelper.show(msg: "tracking_id_copied_msg");
                      });
                    },
                    child: Icon(
                      Icons.copy,
                      size: 20,
                      color: SaayerTheme().getColorsPalette.darkGreyColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "dfgdfg5151df15d10dfg",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.smallParagraph(),
                  ),
                ],
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
            ],
          ),
        ],
      ),
    );
  }
}
