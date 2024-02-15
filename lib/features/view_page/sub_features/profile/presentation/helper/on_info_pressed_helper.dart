import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/profile_sub_features/info/core/utils/enums/enums.dart';
import 'package:saayer/features/profile_sub_features/info/presentation/screens/info_screen.dart';
import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';
import 'package:saayer/features/user_info_view_page/presentation/screens/user_info_view_page_screen.dart';

class OnInfoPressedHelper {
  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  onInfoPressed(String infoTypeStr) async {
    final UserCardEntity? userCardEntity =
        await SecureStorageService().getUserCardInfo();
    final List<bool> userCardInfoList = [
      (userCardEntity?.hasPersonalInformation ?? false),
      (userCardEntity?.hasBusinessInformation ?? false),
      (userCardEntity?.hasStoresInformation ?? false)
    ];
    int numberOfDoneUserCardInfo = 0;
    bool isProfileCompleted = false;
    for (bool userCardInfo in userCardInfoList) {
      if (userCardInfo) {
        numberOfDoneUserCardInfo++;
        isProfileCompleted = true;
      } else {
        isProfileCompleted = false;
      }
    }
    if (!isProfileCompleted) {
      showModalBottomSheet(
        context: context,
        barrierColor: SaayerTheme().getColorsPalette.barrierColor,
        backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
        builder: (context) {
          return _getBottomSheetWidget(numberOfDoneUserCardInfo);
        },
      );
    } else {
      getIt<NavigationService>().navigateTo(InfoScreen(
        infoType: _getInfoTypes(infoTypeStr),
      ));
    }
  }

  InfoTypes _getInfoTypes(String infoTypeStr) {
    return InfoTypes.values
        .firstWhere((element) => (element.name.compareTo(infoTypeStr) == 0));
  }

  Widget _getBottomSheetWidget(int numberOfDoneUserCardInfo) {
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
                "complete_profile_title".tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.sectionTitle(),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "complete_profile_desc".tr(),
                softWrap: true,
                textAlign: TextAlign.center,
                style: AppTextStyles.smallParagraph(),
              ),
              SizedBox(
                height: 50.h,
              ),
              SaayerDefaultTextButton(
                text: "complete_profile",
                isEnabled: true,
                borderRadius: 16.r,
                onPressed: () {
                  getIt<NavigationService>().pop();
                  getIt<NavigationService>().navigateTo(UserInfoViewPageScreen(
                    initialPage: numberOfDoneUserCardInfo,
                  ));
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
