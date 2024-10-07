import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class ShipmentsStatisticItemWidget extends StatelessWidget {
  final String title;
  final String shipmentsNum;
  final bool animatedIcon;
  final GestureTapCallback? onTap;

  const ShipmentsStatisticItemWidget({
    super.key,
    required this.title,
    required this.shipmentsNum,
    required this.animatedIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: animatedIcon
              ? SaayerTheme().getColorsPalette.backgroundColor
              : SaayerTheme().getColorsPalette.primaryColor,
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
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      animatedIcon
                          ? Lottie.asset(
                              height: largerThanTablet(context) ? 50 : 35,
                              Constants.getLottiePath("${title}_shipment.json"),
                            )
                          : Image.asset(
                              Constants.getIconPath("ic_logo.png"),
                              width: largerThanTablet(context) ? 50 : 35,
                              height: largerThanTablet(context) ? 50 : 35,
                              color: SaayerTheme().getColorsPalette.whiteColor,
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        shipmentsNum,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.label(animatedIcon ? null : SaayerTheme().getColorsPalette.whiteColor),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 15,
                      color: animatedIcon
                          ? SaayerTheme().getColorsPalette.blackColor
                          : SaayerTheme().getColorsPalette.whiteColor)
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      title.tr(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.label(animatedIcon ? null : SaayerTheme().getColorsPalette.whiteColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
