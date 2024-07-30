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

  const GenericExpansionTileWidget(
      {super.key,
      required this.title,
      required this.children,
      required this.iconPath,
      this.childrenPadding,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          iconPath.isEmpty ? Container() : GenericSvgWidget(path: iconPath, size: iconSize),
          const SizedBox(width: 10.0),
          Text(title, style: AppTextStyles.liteLabel(SaayerTheme().getColorsPalette.blackColor)),
        ],
      ),
      shape: InputBorder.none,
      collapsedShape: InputBorder.none,
      collapsedTextColor: SaayerTheme().getColorsPalette.blackColor,
      collapsedIconColor: SaayerTheme().getColorsPalette.blackColor,
      iconColor: SaayerTheme().getColorsPalette.blackColor,
      textColor: SaayerTheme().getColorsPalette.blackColor,
      initiallyExpanded: false,
      childrenPadding: childrenPadding ?? const EdgeInsets.symmetric(horizontal: 14),
      children: children,
    );
  }
}
