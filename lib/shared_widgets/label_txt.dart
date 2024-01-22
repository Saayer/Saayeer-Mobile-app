import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saayer/core/utils/colors.dart';

class LabelTxt extends StatelessWidget {
  final String txt;

  const LabelTxt({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          txt,
          style: GoogleFonts.roboto(
            fontSize: 16,
            color: ColorsPalette.blackTextColor,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
