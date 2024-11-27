import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class MoreCardItemWidget extends StatelessWidget {
  final String title, iconName;
  final String? onPressedRouteName;

  const MoreCardItemWidget({super.key, required this.title, required this.iconName, this.onPressedRouteName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressedRouteName != null) {
          if (onPressedRouteName == Routes.personalInfoNamedPage) {
            /// sent true as arguments if navigatedFromRequestShipment else false
            getIt<NavigationService>().navigateToNamed(onPressedRouteName!, arguments: false);
          } else {
            getIt<NavigationService>().navigateToNamed(onPressedRouteName!);
          }
        }
      },
      child: Container(
        //height: 84,
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
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenericSvgWidget(
                    path: Constants.getIconPath("ic_$iconName.svg"),
                    size: 25,
                    color: SaayerTheme().getColorsPalette.orangeColor,
                  ),
                  Icon(Icons.arrow_forward_ios, size: 15, color: SaayerTheme().getColorsPalette.greyColor),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      title.tr(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.label(),
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
