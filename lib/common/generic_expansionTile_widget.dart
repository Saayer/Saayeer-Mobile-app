import 'package:flutter/material.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class GenericExpansionTileWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final List<Widget> children;
  final EdgeInsetsGeometry? childrenPadding;
  final double? iconSize;
  final Color? iconColor;

  const GenericExpansionTileWidget(
      {super.key,
      required this.title,
      required this.children,
      required this.iconPath,
      this.childrenPadding,
      this.iconColor,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title, style: AppTextStyles.mainLabel(SaayerTheme().getColorsPalette.blackColor)),
      leading: iconPath.isEmpty ? Container() : GenericSvgWidget(path: iconPath, size: iconSize,
          color: iconColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      collapsedBackgroundColor: SaayerTheme().getColorsPalette.lightGreyColor,
      backgroundColor: SaayerTheme().getColorsPalette.lightGreyColor,
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      collapsedTextColor: SaayerTheme().getColorsPalette.blackColor,
      collapsedIconColor: SaayerTheme().getColorsPalette.blackColor,
      iconColor: SaayerTheme().getColorsPalette.blackColor,
      textColor: SaayerTheme().getColorsPalette.blackColor,
      initiallyExpanded: false,
      childrenPadding: childrenPadding ?? const EdgeInsets.symmetric(horizontal: 10),
      children: children,
    );
  }
}
