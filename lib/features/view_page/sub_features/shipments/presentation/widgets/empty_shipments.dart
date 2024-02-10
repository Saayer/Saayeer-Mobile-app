import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/utils/enums/enums.dart';

class EmptyShipments extends StatelessWidget {
  final ShipmentsTypes shipmentsType;

  const EmptyShipments({super.key, required this.shipmentsType});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final double size = 65;
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: (size + 5).r,
                    backgroundColor:
                        SaayerTheme().getColorsPalette.blackTextColor,
                    child: CircleAvatar(
                      radius: size.r,
                      backgroundColor:
                          SaayerTheme().getColorsPalette.backgroundColor,
                      child: SvgPicture.asset(
                        Constants.getIconPath(
                            "ic_${NavBarIconTypes.SHIPMENTS.name}.svg"),
                        width: size.w,
                        height: size.h,
                        color: SaayerTheme().getColorsPalette.blackTextColor,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 180,
                    child: SizedBox(
                      width: width / 2,
                      child: Divider(
                        thickness: 5.w,
                        color: SaayerTheme().getColorsPalette.blackTextColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "empty_shipments_title"
                    .tr()
                    .replaceFirst("{}", shipmentsType.pluralName.tr()),
                style: AppTextStyles.boldLiteLabel(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "empty_shipments_desc"
                    .tr()
                    .replaceFirst("{}", shipmentsType.pluralName.tr()),
                style: AppTextStyles.liteLabel(),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
