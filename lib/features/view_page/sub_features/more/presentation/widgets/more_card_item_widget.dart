import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class MoreCardItemWidget extends StatelessWidget {
  final String title, iconName;

  const MoreCardItemWidget(
      {super.key, required this.title, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 84.h,
        decoration: BoxDecoration(
          color: SaayerTheme().getColorsPalette.backgroundColor,
          // gradient: LinearGradient(
          //     colors: [
          //       SaayerTheme().getColorsPalette.orangeColor.withOpacity(1),
          //       SaayerTheme()
          //           .getColorsPalette
          //           .lightOrangeColor
          //           .withOpacity(0.5),
          //     ],
          //     begin: const FractionalOffset(0.0, 0.5),
          //     end: const FractionalOffset(1.0, 0.0),
          //     stops: const [0.0, 1.0],
          //     tileMode: TileMode.clamp),
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
          padding: EdgeInsets.all(12.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    Constants.getIconPath("ic_$iconName.svg"),
                    height: 26.h,
                    width: 26.w,
                    fit: BoxFit.cover,
                    color: SaayerTheme().getColorsPalette.orangeColor,
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 15.r,
                      color: SaayerTheme().getColorsPalette.greyColor),
                ],
              ),
              SizedBox(
                height: 8.h,
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
