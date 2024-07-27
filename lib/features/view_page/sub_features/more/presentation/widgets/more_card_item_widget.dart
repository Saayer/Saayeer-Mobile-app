import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class MoreCardItemWidget extends StatelessWidget {
  final String title, iconName;
  final Widget? onPressedWidget;

  const MoreCardItemWidget(
      {super.key,
      required this.title,
      required this.iconName,
      this.onPressedWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressedWidget != null) {
          getIt<NavigationService>().navigateTo(onPressedWidget!);
        }
      },
      child: Container(
        height: 84,
        decoration: BoxDecoration(
          color: SaayerTheme().getColorsPalette.backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
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
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    Constants.getIconPath("ic_$iconName.svg"),
                    height: 22,
                    width: 22,
                    fit: BoxFit.cover,
                    color: SaayerTheme().getColorsPalette.orangeColor,
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 15,
                      color: SaayerTheme().getColorsPalette.greyColor),
                ],
              ),
              SizedBox(
                height: 8,
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
