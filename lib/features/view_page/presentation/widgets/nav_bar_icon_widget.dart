import 'package:flutter/material.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';

class NavBarIconWidget extends StatelessWidget {
  final NavBarIconTypes navBarIconType;
  final bool isSelected;
  final void Function()? onPressed;

  const NavBarIconWidget({
    super.key,
    required this.navBarIconType,
    this.isSelected = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double size = _getIconSize;
    return IconButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      icon: GenericSvgWidget(
        path: Constants.getIconPath("ic_${navBarIconType.name.toLowerCase()}.svg"),
        size: size,
        color: isSelected ? SaayerTheme().getColorsPalette.primaryColor : SaayerTheme().getColorsPalette.blackTextColor,
      ),
    );
  }

  double get _getIconSize {
    switch (navBarIconType) {
      case NavBarIconTypes.ADDRESESS:
      case NavBarIconTypes.CLIENTS:
      case NavBarIconTypes.MORE:
        {
          return 20;
        }
      default:
        {
          return 24;
        }
    }
  }
}
