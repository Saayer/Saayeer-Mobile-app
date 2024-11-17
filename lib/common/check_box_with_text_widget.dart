import 'package:flutter/material.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

///[reserveState] is used to prevent checkbox component from update itself
class CheckBoxWithTextWidget extends StatefulWidget {
  final bool? isChecked;
  final bool reserveState;
  final Function(bool)? onTap;
  final String viewName;
  final String? text;
  final List<TextSpan>? widgets;
  final EdgeInsetsGeometry? margin;
  final bool reversColoring;
  final double size;
  final Color? fixedBgColor;
  final Color? fixedCheckerColor;
  final Color? borderColor;
  final VoidCallback? designPlanOnTap;

  const CheckBoxWithTextWidget({
    super.key,
    this.isChecked,
    this.reserveState = false,
    this.fixedBgColor,
    this.fixedCheckerColor,
    this.borderColor,
    this.widgets,
    this.size = 30.0,
    this.reversColoring = false,
    this.margin,
    this.text,
    this.onTap,
    this.viewName = "",
    this.designPlanOnTap,
  });

  @override
  State<CheckBoxWithTextWidget> createState() => _CheckBoxWithTextWidgetState();
}

class _CheckBoxWithTextWidgetState extends State<CheckBoxWithTextWidget> {
  late bool _isChecked;

  ///Toggling [_isChecked]
  void _check() {
    _isChecked = !_isChecked;

    if (widget.onTap != null) {
      widget.onTap!(_isChecked);
    }
    setState(() {});
  }

  @override
  void initState() {
    _isChecked = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.symmetric(horizontal: 35),
      child: Row(children: [
        widget.onTap != null
            ? InkWell(
                onTap: _check,
                child: _CheckBoxObject(
                  size: widget.size,
                  isChecked: _isChecked,
                  reversColoring: widget.reversColoring,
                  fixedBgColor: widget.fixedBgColor,
                  fixedCheckerColor: widget.fixedCheckerColor,
                  borderColor: widget.borderColor,
                ),
              )
            : widget.designPlanOnTap != null
                ? InkWell(
                    onTap: widget.designPlanOnTap,
                    child: _CheckBoxObject(
                        size: widget.size,
                        isChecked: _isChecked,
                        fixedBgColor: widget.fixedBgColor,
                        fixedCheckerColor: widget.fixedCheckerColor,
                        borderColor: widget.borderColor,
                        reversColoring: widget.reversColoring),
                  )
                : _CheckBoxObject(
                    size: widget.size,
                    isChecked: _isChecked,
                    fixedBgColor: widget.fixedBgColor,
                    fixedCheckerColor: widget.fixedCheckerColor,
                    borderColor: widget.borderColor,
                    reversColoring: widget.reversColoring),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: widget.text ?? "",
                style: AppTextStyles.mainFocusedLabel(null, 1.5),
              ),
              ...widget.widgets ?? const []
            ],
          )),
        ),
      ]),
    );
  }
}

class _CheckBoxObject extends StatelessWidget {
  const _CheckBoxObject({
    required bool isChecked,
    required this.reversColoring,
    required this.size,
    this.fixedBgColor,
    this.borderColor,
    this.fixedCheckerColor,
  }) : _isChecked = isChecked;

  ///
  final Color? fixedBgColor;
  final Color? fixedCheckerColor;
  final Color? borderColor;
  final bool _isChecked;
  final bool reversColoring;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 250),
      crossFadeState: _isChecked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: fixedBgColor ??
                  (reversColoring
                      ? SaayerTheme().getColorsPalette.blackColor
                      : SaayerTheme().getColorsPalette.whiteColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Icon(
            Icons.check,
            color: fixedCheckerColor ??
                (reversColoring
                    ? SaayerTheme().getColorsPalette.whiteColor
                    : SaayerTheme().getColorsPalette.blackColor),
            size: 18,
          )),
      secondChild: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: fixedBgColor,
              border: Border.all(color: borderColor ?? SaayerTheme().getColorsPalette.blackColor),
              borderRadius: const BorderRadius.all(Radius.circular(5)))),
    );
  }
}
