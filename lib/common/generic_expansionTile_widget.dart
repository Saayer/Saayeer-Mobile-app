import 'package:flutter/material.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class GenericExpansionTileWidget extends StatefulWidget {
  final String title;
  final String iconPath;
  final List<Widget> children;
  final EdgeInsetsGeometry? childrenPadding;
  final double? iconSize;
  final Color iconColor;
  final String? selectedFilterCount;

  const GenericExpansionTileWidget({
    super.key,
    required this.title,
    required this.children,
    required this.iconPath,
    this.childrenPadding,
    required this.iconColor,
    this.selectedFilterCount,
    this.iconSize,
  });

  @override
  State<GenericExpansionTileWidget> createState() => _GenericExpansionTileWidgetState();
}

class _GenericExpansionTileWidgetState extends State<GenericExpansionTileWidget> {
  bool initiallyExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          Text(widget.title, style: AppTextStyles.mainLabel(SaayerTheme().getColorsPalette.blackColor)),
          const SizedBox(
            width: 5,
          ),
          initiallyExpanded
              ? const SizedBox()
              : widget.selectedFilterCount!.isEmpty
                  ? const SizedBox()
                  : Container(
                      padding: const EdgeInsets.all(8),
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: SaayerTheme().getColorsPalette.primaryColor),
                      child: Text(widget.selectedFilterCount ?? '',
                          style: AppTextStyles.smallBoldLabel(SaayerTheme().getColorsPalette.whiteColor)),
                    )
        ],
      ),
      leading: widget.iconPath.isEmpty
          ? Container()
          : GenericSvgWidget(path: widget.iconPath, size: widget.iconSize, color: widget.iconColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      collapsedBackgroundColor: SaayerTheme().getColorsPalette.lightGreyColor,
      backgroundColor: SaayerTheme().getColorsPalette.lightGreyColor,
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      collapsedTextColor: SaayerTheme().getColorsPalette.blackColor,
      collapsedIconColor: SaayerTheme().getColorsPalette.blackColor,
      iconColor: SaayerTheme().getColorsPalette.blackColor,
      textColor: SaayerTheme().getColorsPalette.blackColor,
      initiallyExpanded: initiallyExpanded,
      onExpansionChanged: (value) {
        setState(() {
          initiallyExpanded = value;
        });
      },
      childrenPadding: widget.childrenPadding ?? const EdgeInsets.symmetric(horizontal: 10),
      children: widget.children,
    );
  }
}
