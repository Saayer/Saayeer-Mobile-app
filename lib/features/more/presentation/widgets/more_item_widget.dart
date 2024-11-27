import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/more_sub_features/static_pages/core/enums/enums.dart';

class MoreItemWidget extends StatelessWidget {
  final String title;
  final String iconName;
  final String? onPressedRouteName;
  final bool isPngIcon;
  final StaticPagesTypes? routeArgument;

  final double size;

  const MoreItemWidget(
      {super.key,
      required this.title,
      required this.iconName,
      this.onPressedRouteName,
      this.routeArgument,
      this.isPngIcon = false,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _getLeadingImage(),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      horizontalTitleGap: 10,
      onTap: () {
        if (onPressedRouteName != null) {
          getIt<NavigationService>().navigateToNamed(onPressedRouteName!, arguments: routeArgument);
        }
      },
      title: Text(
        title.tr(),
        style: AppTextStyles.liteLabel(),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 15, color: SaayerTheme().getColorsPalette.greyColor),
    );
  }

  Widget _getLeadingImage() {
    if (isPngIcon) {
      return Image.asset(Constants.getIconPath("ic_$iconName.png"),
          width: size, height: size, color: SaayerTheme().getColorsPalette.orangeColor);
    }
    return GenericSvgWidget(
      path: Constants.getIconPath("ic_$iconName.svg"),
      size: size,
      color: SaayerTheme().getColorsPalette.orangeColor,
    );
  }
}
