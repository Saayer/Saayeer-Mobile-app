import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart';

class EmptyStatusWidget extends StatelessWidget {
  final String title, desc, btnLabel, iconName;
  final TextStyle? titleTextStyle, descTextStyle;

  final double size;
  final double dividerWidth, btnWidth;

  final void Function()? onBtnPressed;

  const EmptyStatusWidget(
      {super.key,
      required this.title,
      required this.desc,
      required this.btnLabel,
      required this.iconName,
      this.titleTextStyle,
      this.descTextStyle,
      required this.size,
      this.btnWidth = 1,
      this.dividerWidth = 2,
      this.onBtnPressed});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: (size + 5).r,
                    backgroundColor:
                        SaayerTheme().getColorsPalette.blackTextColor,
                    child: CircleAvatar(
                      radius: size.r,
                      backgroundColor:
                          SaayerTheme().getColorsPalette.backgroundColor,
                      child: SvgPicture.asset(
                        Constants.getIconPath("ic_$iconName.svg"),
                        width: size.w,
                        height: size.h,
                        color: SaayerTheme().getColorsPalette.blackTextColor,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 180,
                    child: SizedBox(
                      width: width / (dividerWidth),
                      child: Divider(
                        thickness: 5.w,
                        color: SaayerTheme().getColorsPalette.blackTextColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                title,
                style: titleTextStyle ?? AppTextStyles.boldLiteLabel(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                desc,
                style: descTextStyle ?? AppTextStyles.liteLabel(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: width / btnWidth,
                color: SaayerTheme().getColorsPalette.backgroundColor,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 50.h, left: 16.w, right: 16.w, top: 20.h),
                  child: SaayerDefaultTextButton(
                    text: btnLabel,
                    isEnabled: true,
                    borderRadius: 16.r,
                    onPressed: () {
                      if (onBtnPressed != null) {
                        onBtnPressed!();
                      }
                    },
                    btnWidth: width / 1.2,
                    btnHeight: 50.h,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
