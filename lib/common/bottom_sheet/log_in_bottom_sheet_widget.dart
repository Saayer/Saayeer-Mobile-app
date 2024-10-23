import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

void getLogInBottomSheetWidget() {
  final BuildContext context = getIt<NavigationService>().mainNavigatorKey.currentContext!;
  final double width = MediaQuery.of(context).size.width;

  final Widget child = Container(
    //height: 350.h,
    width: width,
    decoration: BoxDecoration(
      color: SaayerTheme().getColorsPalette.backgroundColor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "log_in_title".tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.sectionTitle(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "log_in_message".tr(),
              softWrap: true,
              textAlign: TextAlign.center,
              style: AppTextStyles.smallParagraph(),
            ),
            const SizedBox(
              height: 50,
            ),
            SaayerDefaultTextButton(
              text: "log_in",
              isEnabled: true,
              borderRadius: 16,
              onPressed: () {
                getIt<NavigationService>().navigateAndFinishNamed(Routes.loginNamedPage);
              },
              btnWidth: width / 1.2,
              btnHeight: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            SaayerDefaultTextButton(
              text: "cancel",
              isEnabled: true,
              enabledColor: SaayerTheme().getColorsPalette.greyColor,
              borderRadius: 16,
              onPressed: () {
                getIt<NavigationService>().pop();
              },
              btnWidth: width / 1.2,
              btnHeight: 50,
            ),
            const SizedBox(
              height: 20,
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
