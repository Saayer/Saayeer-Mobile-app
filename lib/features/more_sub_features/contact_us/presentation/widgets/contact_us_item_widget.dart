import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class ContactUsItemWidget extends StatelessWidget {
  final String title, description;
  final IconData iconData;

  const ContactUsItemWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        leading: Icon(
          iconData,
          size: 30.r,
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
          style: AppTextStyles.paragraph(),
        ),
      ),
    );
  }
}
