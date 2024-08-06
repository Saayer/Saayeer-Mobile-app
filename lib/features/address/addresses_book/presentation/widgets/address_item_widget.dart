import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class AddressItemWidget extends StatelessWidget {
  final CustomerGetDto addressInfoEntity;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onTap;

  const AddressItemWidget({super.key, required this.addressInfoEntity, required this.onDelete, required this.onEdit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: SaayerTheme().getColorsPalette.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Icon(
              Icons.pin_drop,
              size: 30,
              color: SaayerTheme().getColorsPalette.orangeColor,
            ),
            title: Text(
              addressInfoEntity.fullName ?? '',
              style: AppTextStyles.boldLabel(),
            ),
            subtitle: largerThanMobile(context)
                ? _buildFullAddress()
                : Text(
                    addressInfoEntity.addressDetails ?? '',
                    style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor),
                  ),
            trailing: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: onEdit,
                      icon: Icon(
                        Icons.edit,
                        size: 25,
                        color: SaayerTheme().getColorsPalette.greenColor,
                      )),
                  if ((addressInfoEntity.totalShipments ?? 0) == 0)
                    IconButton(
                        onPressed: onDelete,
                        icon: Icon(
                          Icons.delete_rounded,
                          size: 25,
                          color: SaayerTheme().getColorsPalette.error0,
                        )),
                ],
              ),
            ),
          )),
    );
  }

  _buildFullAddress() {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: StringsUtil.getLanguageName(
              arName: addressInfoEntity.countryNameAr ?? '', enName: addressInfoEntity.countryNameAr ?? ''),
          style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
      TextSpan(
          text:
              ' - ${StringsUtil.getLanguageName(arName: addressInfoEntity.governorateNameAr ?? '', enName: addressInfoEntity.governorateNameEn ?? '')}',
          style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
      TextSpan(
          text:
              ' - ${StringsUtil.getLanguageName(arName: addressInfoEntity.cityNameAr ?? '', enName: addressInfoEntity.cityNameEn ?? '')}',
          style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor))
    ]));
  }
}
