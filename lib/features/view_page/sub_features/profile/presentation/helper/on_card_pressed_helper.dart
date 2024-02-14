import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/profile_sub_features/bills/presentation/screens/bills_screen.dart';
import 'package:saayer/features/profile_sub_features/info/core/utils/enums/enums.dart';
import 'package:saayer/features/profile_sub_features/info/presentation/screens/info_screen.dart';
import 'package:saayer/features/profile_sub_features/reports/presentation/screens/reports_screen.dart';
import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';
import 'package:saayer/features/user_info_view_page/presentation/screens/user_info_view_page_screen.dart';

class OnCardPressedHelper {
  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  onCardPressed(String label) async {
    final bool hasData = false;
    if (!hasData) {
      showModalBottomSheet(
        context: context,
        barrierColor: SaayerTheme().getColorsPalette.barrierColor,
        backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
        builder: (context) {
          return _getBottomSheetWidget(label);
        },
      );
    } else {
      final Widget? screen = _getScreen(label);
      if (screen != null) {
        getIt<NavigationService>().navigateTo(screen);
      }
    }
  }

  Widget? _getScreen(String label) {
    if (label.compareTo("reports") == 0) {
      return const ReportsScreen();
    } else if (label.compareTo("bills") == 0) {
      return const BillsScreen();
    }
    return null;
  }

  Widget _getBottomSheetWidget(String label) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
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
                "no_${label}_title".tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.sectionTitle(),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "no_${label}_desc".tr(),
                softWrap: true,
                textAlign: TextAlign.center,
                style: AppTextStyles.smallParagraph(),
              ),
              SizedBox(
                height: 50.h,
              ),
              SaayerDefaultTextButton(
                text: "ok",
                isEnabled: true,
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
  }
}
