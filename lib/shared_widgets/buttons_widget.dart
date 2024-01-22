import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TxtButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color, textColor;
  final String text;
  final double btnWidth, btnHeight;
  final double borderRadius, textFontSize;
  final Color? borderColor;
  final MainAxisAlignment? mainAxisAlignment;

  TxtButton(
      {Key? key,
      this.onPressed,
      required this.color,
      required this.text,
      this.borderColor,
      this.textColor = Colors.white,
      this.btnWidth = 0,
      this.btnHeight = 0,
      this.mainAxisAlignment,
      this.borderRadius = 30,
      this.textFontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = TextButton.styleFrom(
      foregroundColor: color, fixedSize: Size(btnWidth, btnHeight),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor ?? color)),
      backgroundColor: color,
    );

    return TextButton(
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        children: [
          Text(
            text,
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: textFontSize,
                  fontStyle: FontStyle.normal,
                  color: textColor,
                  letterSpacing: .5),
            ),
          ),
        ],
      ),
      style: buttonStyle,
      onPressed: onPressed,
    );
  }
}
