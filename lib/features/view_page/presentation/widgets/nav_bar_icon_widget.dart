import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/core/utils/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';

class NavBarIconWidget extends StatelessWidget {
  final NavBarIconTypes navBarIconType;
  final bool isSelected;
  final void Function()? onPressed;

  const NavBarIconWidget(
      {super.key,
      required this.navBarIconType,
      this.isSelected = false,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      icon: SvgPicture.asset(
        Constants.getIconPath("ic_${navBarIconType.name.toLowerCase()}.svg"),
        width: 26.w,
        height: 26.h,
        color: isSelected
            ? SaayerTheme().getColorsPalette.orangeColor
            : SaayerTheme().getColorsPalette.blackTextColor,
      ),
    );
  }
}
