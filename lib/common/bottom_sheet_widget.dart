import 'package:flutter/material.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

///showBottomSheetWidget
showBottomSheetWidget(
    BuildContext buildContext, Widget widget, double widgetHeight) {
  double width = MediaQuery.of(buildContext).size.width;
  double height = MediaQuery.of(buildContext).size.height;
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      backgroundColor: Colors.transparent,
      context: buildContext,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          height: widgetHeight + (height / 50),
          child: Column(
            children: [
              Container(
                width: width / 3,
                height: 5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: Colors.transparent)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: (widgetHeight + (height / 50)) - 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    border: Border.all(color: Colors.white)),
                child: Container(
                    width: width / 1,
                    height: widgetHeight,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white)),
                    child: widget),
              ),
            ],
          ),
        );
      });
}

///modalBottomSheetMenu
modalBottomSheetMenu(context, width, height, widget,
    {double heightPercentage = 1.5,
    bool hasDash = false,
    void Function()? onBack}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return new Container(
          height: height / heightPercentage,
          color: Colors.transparent,
          child: Container(
            color: Colors.transparent,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: (!hasDash ? 19 : 20)),
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(20.0),
                              topRight: const Radius.circular(20.0))),
                      child: Padding(
                        padding: EdgeInsets.only(top: height / 25),
                        child: Center(
                          child: widget,
                        ),
                      )),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(getIt<NavigationService>()
                                .mainNavigatorKey
                                .currentContext!)
                            .pop();
                      },
                      child: !hasDash
                          ? CircleAvatar(
                              backgroundColor: SaayerTheme().getColorsPalette().blackTextColor,
                              radius: 20,
                              child: Icon(
                                Icons.close,
                                color: SaayerTheme().getColorsPalette().whiteColor,
                                size: 25,
                              ))
                          : Container(
                              height: 8,
                              width: width / 4,
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.all(
                                    Radius.circular(20.0),
                                  )),
                            ),
                    ))
              ],
            ),
          ),
        );
      }).whenComplete(() {
    if (onBack != null) {
      onBack();
    }
  });
}
