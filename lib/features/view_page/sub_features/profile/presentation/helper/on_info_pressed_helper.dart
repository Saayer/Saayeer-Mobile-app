import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/profile_sub_features/info/core/utils/enums/enums.dart';
import 'package:saayer/features/profile_sub_features/info/domain/entities/info_entity.dart';
import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/personal_info/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/core/utils/enums/enums.dart';

class OnInfoPressedHelper {
  final BuildContext context = getIt<NavigationService>().mainNavigatorKey.currentContext!;

  onInfoPressed(String infoTypeStr) async {
    final InfoTypes infoType = _getInfoTypes(infoTypeStr);
    final UserCardEntity? userCardEntity = await SecureStorageService().getUserCardInfo();
    final bool isInfoCompleted = _getIsInfoCompleted(userCardEntity, infoType);
    final int numberOfDoneUserCardInfo = _getNumberOfDoneUserCardInfo(userCardEntity, infoType);
    if (!isInfoCompleted) {
      showModalBottomSheet(
        context: getIt<NavigationService>().mainNavigatorKey.currentContext!,
        barrierColor: SaayerTheme().getColorsPalette.barrierColor,
        backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
        builder: (context) {
          return _getBottomSheetWidget(numberOfDoneUserCardInfo);
        },
      );
    } else {
      final Map<String, dynamic> fields = _getInfoFields(userCardEntity!, infoType);
      getIt<NavigationService>().navigateToNamed(
        Routes.infoNamedPage,
        arguments: InfoEntity(
          infoType: infoType,
          fields: fields,
        ),
      );
    }
  }

  InfoTypes _getInfoTypes(String infoTypeStr) {
    return InfoTypes.values.firstWhere((element) => (element.name.compareTo(infoTypeStr) == 0));
  }

  bool _getIsInfoCompleted(UserCardEntity? userCardEntity, InfoTypes infoType) {
    switch (infoType) {
      case InfoTypes.PERSONAL_INFO:
        {
          return (userCardEntity?.hasPersonalInformation ?? false);
        }
      case InfoTypes.BUSINESS_INFO:
        {
          return (userCardEntity?.hasBusinessInformation ?? false);
        }
      case InfoTypes.STORE_INFO:
        {
          return (userCardEntity?.hasStoresInformation ?? false);
        }
    }
  }

  int _getNumberOfDoneUserCardInfo(UserCardEntity? userCardEntity, InfoTypes infoType) {
    int numberOfDoneUserCardInfo = 0;
    final List<bool> userCardInfoList = [
      (userCardEntity?.hasPersonalInformation ?? false),
      (userCardEntity?.hasBusinessInformation ?? false),
      (userCardEntity?.hasStoresInformation ?? false)
    ];
    for (bool userCardInfo in userCardInfoList) {
      if (userCardInfo) {
        numberOfDoneUserCardInfo++;
      }
    }
    return numberOfDoneUserCardInfo;
  }

  Map<String, dynamic> _getInfoFields(UserCardEntity userCardEntity, InfoTypes infoType) {
    switch (infoType) {
      case InfoTypes.PERSONAL_INFO:
        {
          return _getPersonalInfoMap(userCardEntity);
        }
      case InfoTypes.BUSINESS_INFO:
        {
          return _getBusinessInfoMap(userCardEntity);
        }
      case InfoTypes.STORE_INFO:
        {
          return _getStoreInfoMap(userCardEntity);
        }
    }
  }

  Map<String, String> _getPersonalInfoMap(UserCardEntity userCardEntity) {
    final Map<String, String> map = {};
    for (PersonalInfoFieldsTypes personalInfoFieldsType in PersonalInfoFieldsTypes.values) {
      switch (personalInfoFieldsType) {
        case PersonalInfoFieldsTypes.NAME:
          {
            map[personalInfoFieldsType.name] = userCardEntity.personalInfoEntity?.fullName ?? "";
            break;
          }
        case PersonalInfoFieldsTypes.PHONE:
          {
            map[personalInfoFieldsType.name] = userCardEntity.personalInfoEntity?.phoneNo ?? "";
            break;
          }
        case PersonalInfoFieldsTypes.EMAIL:
          {
            map[personalInfoFieldsType.name] = userCardEntity.personalInfoEntity?.email ?? "";
            break;
          }
        case PersonalInfoFieldsTypes.BUSINESSNAME:
          {
            map[personalInfoFieldsType.name] = userCardEntity.personalInfoEntity?.businessName ?? "";
            break;
          }
      }
    }
    return map;
  }

  Map<String, String> _getBusinessInfoMap(UserCardEntity userCardEntity) {
    final Map<String, String> map = {};
    for (BusinessInfoFieldsTypes businessInfoFieldsType in BusinessInfoFieldsTypes.values) {
      switch (businessInfoFieldsType) {
        case BusinessInfoFieldsTypes.COMPANY_NAME:
          {
            map[businessInfoFieldsType.name] = userCardEntity.businessInfoEntity?.companyName ?? "";
            break;
          }
        case BusinessInfoFieldsTypes.EMAIL:
          {
            map[businessInfoFieldsType.name] = userCardEntity.businessInfoEntity?.email ?? "";
            break;
          }
        case BusinessInfoFieldsTypes.MOBILE_NUMBER:
          {
            map[businessInfoFieldsType.name] = userCardEntity.businessInfoEntity?.mobileNumber ?? "";
            break;
          }
        case BusinessInfoFieldsTypes.COMMERCIAL_REGISTERATION_NO:
          {
            map[businessInfoFieldsType.name] = userCardEntity.businessInfoEntity?.commercialRegistrationNo ?? "";
            break;
          }
        case BusinessInfoFieldsTypes.SHORT_ADDRESS:
          {
            map[businessInfoFieldsType.name] = userCardEntity.businessInfoEntity?.shortAddress ?? "";
            break;
          }
        case BusinessInfoFieldsTypes.DISTRICT:
          {
            map[businessInfoFieldsType.name] = userCardEntity.businessInfoEntity?.district ?? "";
            break;
          }
        case BusinessInfoFieldsTypes.GOVERNORATE:
          {
            map[businessInfoFieldsType.name] = userCardEntity.businessInfoEntity?.governorate ?? "";
            break;
          }
      }
    }
    return map;
  }

  Map<String, String> _getStoreInfoMap(UserCardEntity userCardEntity) {
    final Map<String, String> map = {};
    for (StoreInfoFieldsTypes storeInfoFieldsType in StoreInfoFieldsTypes.values) {
      switch (storeInfoFieldsType) {
        case StoreInfoFieldsTypes.NAME:
          {
            map[storeInfoFieldsType.name] = userCardEntity.storeInfoEntity?.name ?? "";
            break;
          }
        case StoreInfoFieldsTypes.PHONE:
          {
            map[storeInfoFieldsType.name] = userCardEntity.storeInfoEntity?.phoneNo ?? "";
            break;
          }
        case StoreInfoFieldsTypes.COUNTRY:
          {
            map[storeInfoFieldsType.name] = userCardEntity.storeInfoEntity?.countryNameEn ?? "";
            break;
          }
        case StoreInfoFieldsTypes.GOVERNORATE:
          {
            map[storeInfoFieldsType.name] = userCardEntity.storeInfoEntity?.governorateNameEn ?? "";
            break;
          }
        case StoreInfoFieldsTypes.CITY:
          {
            map[storeInfoFieldsType.name] = userCardEntity.storeInfoEntity?.cityNameEn ?? "";
            break;
          }
        case StoreInfoFieldsTypes.ADDRESS:
          {
            map[storeInfoFieldsType.name] = userCardEntity.storeInfoEntity?.addressDetails ?? "";
            break;
          }
        case StoreInfoFieldsTypes.ZIPCODE:
          {
            map[storeInfoFieldsType.name] = userCardEntity.storeInfoEntity?.zipcode ?? "";
            break;
          }
      }
    }
    return map;
  }

  Widget _getBottomSheetWidget(int numberOfDoneUserCardInfo) {
    final double width = MediaQuery.of(context).size.width;

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
                  getIt<NavigationService>().navigateToNamed(
                    Routes.userInfoViewNamedPage,
                    arguments: numberOfDoneUserCardInfo,
                  );
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
  }
}
