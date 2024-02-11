import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class MoreItemWidget extends StatelessWidget {
  final String title;
  final String iconName;
  final Widget? onPressedWidget;
  final bool isPngIcon;

  final double size;

  const MoreItemWidget(
      {super.key,
      required this.title,
      required this.iconName,
      this.onPressedWidget,
      this.isPngIcon = false,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _getLeadingImage(),
      horizontalTitleGap: 10.w,
      onTap: () {
        if (onPressedWidget != null) {
          getIt<NavigationService>().navigateTo(onPressedWidget);
        }
      },
      title: Text(
        title.tr(),
        style: AppTextStyles.liteLabel(),
      ),
      trailing: Icon(Icons.arrow_forward_ios,
          size: 15.r, color: SaayerTheme().getColorsPalette.greyColor),
    );
  }

  Widget _getLeadingImage() {
    if (isPngIcon) {
      return Image.asset(Constants.getIconPath("ic_$iconName.png"),
          width: size.w,
          height: size.h,
          color: SaayerTheme().getColorsPalette.orangeColor);
    }
    return SvgPicture.asset(
      Constants.getIconPath("ic_$iconName.svg"),
      width: size.w,
      height: size.h,
      color: SaayerTheme().getColorsPalette.orangeColor,
    );
  }
}
