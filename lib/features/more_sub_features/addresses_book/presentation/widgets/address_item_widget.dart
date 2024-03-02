import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/address/address_details/presentation/screens/address_details_screen.dart';

class AddressItemWidget extends StatelessWidget {
  final AddressInfoEntity addressInfoEntity;

  const AddressItemWidget({super.key, required this.addressInfoEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getIt<NavigationService>().navigateTo(
            AddressDetailsScreen(addressInfoEntity: addressInfoEntity));
      },
      child: Container(
          decoration: BoxDecoration(
            color: SaayerTheme().getColorsPalette.backgroundColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color:
                    SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            leading: Icon(
              Icons.pin_drop,
              size: 30.r,
              color: SaayerTheme().getColorsPalette.orangeColor,
            ),
            title: Text(
              addressInfoEntity.name,
              style: AppTextStyles.boldLabel(),
            ),
            subtitle: Text(
              addressInfoEntity.address,
              style: AppTextStyles.smallParagraph(
                  SaayerTheme().getColorsPalette.greyColor),
            ),
          )),
    );
  }
}
