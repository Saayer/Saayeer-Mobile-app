import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/log_in/presentation/screens/log_in_screen.dart';

void getLogInBottomSheetWidget() {
  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;

  final Widget child = Container(
    //height: 350.h,
    width: width,
    decoration: BoxDecoration(
      color: SaayerTheme().getColorsPalette.backgroundColor,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "log_in_title".tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.sectionTitle(),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "log_in_message".tr(),
              softWrap: true,
              textAlign: TextAlign.center,
              style: AppTextStyles.smallParagraph(),
            ),
            SizedBox(
              height: 50.h,
            ),
            SaayerDefaultTextButton(
              text: "log_in",
              isEnabled: true,
              borderRadius: 16.r,
              onPressed: () {
                getIt<NavigationService>()
                    .navigateAndFinish(const LogInScreen());
              },
              btnWidth: width / 1.2,
              btnHeight: 50.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            SaayerDefaultTextButton(
              text: "cancel",
              isEnabled: true,
              enabledColor: SaayerTheme().getColorsPalette.greyColor,
              borderRadius: 16.r,
              onPressed: () {
                getIt<NavigationService>().pop();
              },
              btnWidth: width / 1.2,
              btnHeight: 50.h,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    ),
  );

  showModalBottomSheet(
    context: getIt<NavigationService>().mainNavigatorKey.currentContext!,
    barrierColor: SaayerTheme().getColorsPalette.barrierColor,
    backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
    builder: (context) {
      return child;
    },
  );
}
