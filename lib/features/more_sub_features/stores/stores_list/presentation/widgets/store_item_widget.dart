import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class StoreItemWidget extends StatelessWidget {
  final StoreGetDto storeDto;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const StoreItemWidget({super.key, required this.onDelete, required this.onEdit, required this.storeDto});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          isThreeLine: true,
          leading: Icon(
            Icons.storefront,
            size: 30,
            color: SaayerTheme().getColorsPalette.orangeColor,
          ),
          title: Text(
            storeDto.name ?? '',
            style: AppTextStyles.boldLabel(),
          ),
          subtitle:
              //largerThanMobile(context)
              //?
              _buildFullAddress(),
          //:
          // Text(
          //   'Short Address Details',
          //   style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor),
          // ),
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
        ));
  }

  _buildFullAddress() {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: StringsUtil.getLanguageName(arName: storeDto.countryNameAr ?? '', enName: storeDto.countryNameEn ?? ''),
          style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
      TextSpan(
          text:
              ' - ${StringsUtil.getLanguageName(arName: storeDto.governorateNameAr ?? '', enName: storeDto.governorateNameEn ?? '')}',
          style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
      TextSpan(
          text:
              ' - ${StringsUtil.getLanguageName(arName: storeDto.cityNameAr ?? '', enName: storeDto.countryNameEn ?? '')}',
          style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
      TextSpan(
          text: ' - ${storeDto.addressDetails}',
          style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor))
    ]));
  }
}
