import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saayer/common/buttons_widget.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class BaseAlertDialog extends StatelessWidget {
  final Color _color = Colors.white;

  final String? titleStr;
  final String? contentStr;
  final String? yes;
  final String? no;
  final bool? isOrange;
  final Function()? yesOnPressed;
  final Function()? noOnPressed;
  final BuildContext context;
  final Widget? titleWidget, contentWidget;
  final bool? isNoVisible;

  BaseAlertDialog({
    Key? key,
    this.titleStr,
    this.contentStr,
    required this.yesOnPressed,
    required this.noOnPressed,
    required this.context,
    this.isNoVisible = true,
    this.isOrange = false,
    this.titleWidget,
    this.contentWidget,
    this.yes = "Yes",
    this.no = "Cancel",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final isOrangeColor = isOrange!
        ? SaayerTheme().getColorsPalette().orangeColor
        : SaayerTheme().getColorsPalette().lightBlackTextColor;

    return AlertDialog(
      //title: new Text(this.title),
      // Icon(
      //   Icons.info,
      //   color: isSaayerTheme().getColorsPalette().orangeColor,
      // ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          titleWidget ?? const SizedBox(),
          contentWidget ??
              Text(
                this.contentStr ?? "",
                softWrap: true,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: SaayerTheme().getColorsPalette().blackTextColor,
                  textStyle: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isNoVisible!,
                child: TxtButton(
                  text: this.no!,
                  color: SaayerTheme().getColorsPalette().greyColor.withOpacity(.3),
                  borderRadius: 50,
                  textColor: SaayerTheme().getColorsPalette().blackTextColor,
                  onPressed: noOnPressed,
                  btnWidth: width / 5,
                  btnHeight: height / 25,
                ),
              ),
              SizedBox(
                width: isNoVisible! ? width / 10 : 0,
              ),
              Visibility(
                visible: true,
                child: TxtButton(
                  text: this.yes!,
                  color: SaayerTheme().getColorsPalette().orangeColor.withOpacity(.3),
                  borderRadius: 50,
                  borderColor: SaayerTheme().getColorsPalette().orangeColor,
                  textColor: SaayerTheme().getColorsPalette().blackTextColor,
                  onPressed: yesOnPressed,
                  btnWidth: width / 5,
                  btnHeight: height / 25,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),
        ],
      ),
      backgroundColor: this._color,
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
    );
  }
}
