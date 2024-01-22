import 'package:flutter/material.dart';
import 'package:saayer/core/utils/app_strings.dart';
import 'package:saayer/core/utils/colors.dart';

class IntroScreenElementWidget extends StatelessWidget {
  final String? title, body, imageName;

  const IntroScreenElementWidget({Key? key, this.title, this.body, this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width / 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: height / 10,
          ),
          SizedBox(
              height: height / 2.8,
              width: width,
              child: Image.asset(
                AppStrings.getIllustrationsImagePath(imageName!),
                width: width,
              )),
          SizedBox(
            height: height / 50,
          ),
          SizedBox(
            width: width,
            height: height / 10,
            child: Text(
              title!,
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: ColorsPalette.blackTextColor,
                  letterSpacing: .5),
            ),
          ),
          SizedBox(
            height: height / 40,
          ),
          SizedBox(
            width: width,
            height: height / 10,
            child: Text(
              body!,
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: 18,
                color: ColorsPalette.blackTextColor,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}