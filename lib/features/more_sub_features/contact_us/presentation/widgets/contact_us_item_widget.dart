import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/services/url_services/lunch_url_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/more_sub_features/contact_us/core/utils/enums/enums.dart';
import 'dart:ui' as ui;

class ContactUsItemWidget extends StatelessWidget {
  final String title, description, url;
  final IconData iconData;
  final bool clickable;

  const ContactUsItemWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.url,
      required this.clickable,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          if (title == ContactUsTypes.HOTLINE.title) {
            LunchUrlService.lunchMobileNumber(description);
          }
          if (title == ContactUsTypes.WHATSAPP.title) {
            if (Platform.isIOS) {
              LunchUrlService.lunchGenericUrl('https://wa.me/$description?text=${Uri.parse('')}');
            } else if (Platform.isAndroid) {
              LunchUrlService.lunchGenericUrl('whatsapp://send?phone=$description&text=');
            } else {
              LunchUrlService.lunchGenericUrl('https://api.whatsapp.com/send/?phone=$description&text=');
            }
          }
          LunchUrlService.lunchGenericUrl(url);
        },
        leading: Icon(
          iconData,
          size: 30,
          color: SaayerTheme().getColorsPalette.orangeColor,
        ),
        title: Text(
          title.tr(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.label(),
        ),
        subtitle: Align(
          alignment: Localization.isArabic() ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            description.tr(),
            textDirection: ui.TextDirection.ltr,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.paragraph(
                clickable ? SaayerTheme().getColorsPalette.blueColor : null, clickable ? true : false),
          ),
        ),
      ),
    );
  }
}
