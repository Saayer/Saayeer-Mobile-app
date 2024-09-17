import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/services/url_services/lunch_url_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

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
        subtitle: Text(
          description.tr(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.paragraph(
              clickable ? SaayerTheme().getColorsPalette.blueColor : null, clickable ? true : false),
        ),
      ),
    );
  }
}
