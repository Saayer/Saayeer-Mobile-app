import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/log_in/presentation/screens/log_in_screen.dart';
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart';
import 'package:saayer/features/user_card/presentation/widgets/circle_painter.dart';
import 'dart:ui' as ui;

class UserCardHelper {
  static Decoration getCardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 10,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ],
      //color: SaayerTheme().getColorsPalette.backgroundColor,
      gradient: LinearGradient(
          colors: [
            SaayerTheme().getColorsPalette.backgroundColor.withOpacity(0.5),
            SaayerTheme().getColorsPalette.orangeColor.withOpacity(0.3),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp),
    );
  }

  static Widget buildGuestCardWidget(Decoration cardDecoration,
      double horizontalPadding, double verticalPadding, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (horizontalPadding).w, vertical: (verticalPadding).h),
      child: Container(
        decoration: cardDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "log_in_title".tr(),
                style: AppTextStyles.boldLiteLabel(
                    SaayerTheme().getColorsPalette.darkOrangeColor),
              ),
              SizedBox(height: 16.h,),
              Text(
                "log_in_message".tr(),
                style: AppTextStyles.label(),
              ),
              SizedBox(height: 16.h,),
              Center(
                child: SaayerDefaultTextButton(
                  text: "log_in",
                  isEnabled: true,
                  borderRadius: 16.r,
                  onPressed: () {
                    getIt<NavigationService>()
                        .navigateAndFinish(const LogInScreen());
                  },
                  btnWidth: width / 1,
                  btnHeight: 50.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildTrailingWidget(
      UserCardState state,
      bool isUncompletedProfile,
      List userCardInfoList,
      int numberOfDoneUserCardInfo) {
    if (!state.isGuest) {
      if (!isUncompletedProfile) {
        return SvgPicture.asset(
          Constants.getIconPath("ic_hi.svg"),
          width: 50.w,
          height: 50.h,
          fit: BoxFit.cover,
        );
      }
      return Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: ui.Size(50.w, 50.h),
            painter: CirclePainter(
                startFraction: 0,
                endFraction: 1,
                strokeColor:
                    SaayerTheme().getColorsPalette.greyColor.withOpacity(0.5)),
          ),
          CustomPaint(
            size: ui.Size(50.w, 50.h),
            painter: CirclePainter(
                startFraction: 0,
                endFraction: numberOfDoneUserCardInfo / userCardInfoList.length,
                strokeColor: SaayerTheme().getColorsPalette.primaryColor),
          ),
          Text(
            "${((numberOfDoneUserCardInfo * 100) / userCardInfoList.length).roundToDouble().toInt()}%",
            style: AppTextStyles.smallBoldLabel(),
          )
        ],
      );
    }
    return const SizedBox();
  }
}
