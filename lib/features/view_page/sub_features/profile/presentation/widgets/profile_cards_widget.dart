import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/sub_features/profile/presentation/widgets/profile_card_item_widget.dart';

class ProfileCardsWidget extends StatelessWidget {
  const ProfileCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> profileCardsStrList = [
      "personal_info",
      "business_info",
      "store_info",
      "reports",
      "bills"
    ];
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 0.h),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100).w / (84).h,
        mainAxisSpacing: (8 * 2).h,
        crossAxisSpacing: (8 * 2).w,
      ),
      itemCount: profileCardsStrList.length,
      itemBuilder: (context, index) {
        final String profileCardStr = profileCardsStrList[index];
        return ProfileCardItemWidget(
          title: profileCardStr,
          iconName: profileCardStr,
        );
      },
    );
  }
}
