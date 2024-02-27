import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        borderRadius: BorderRadius.circular(40.r),
      ),
      backgroundColor: Colors.transparent,
      context: buildContext,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: width / 3,
                  height: 5.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: SaayerTheme().getColorsPalette.backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      border: Border.all(color: Colors.transparent)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: SaayerTheme().getColorsPalette.backgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r)),
                      border: Border.all(
                          color:
                              SaayerTheme().getColorsPalette.backgroundColor)),
                  child: Container(
                      width: width / 1,
                      height: widgetHeight,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                          color: SaayerTheme().getColorsPalette.backgroundColor,
                          border: Border.all(
                              color: SaayerTheme()
                                  .getColorsPalette
                                  .backgroundColor)),
                      child: widget),
                ),
              ],
            ),
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
        return Container(
          height: height / heightPercentage,
          color: Colors.transparent,
          child: Container(
            color: Colors.transparent,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: (!hasDash ? 19.h : 20.h)),
                  child: Container(
                      decoration: BoxDecoration(
                          color: SaayerTheme().getColorsPalette.backgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r))),
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
                              backgroundColor:
                                  SaayerTheme().getColorsPalette.blackTextColor,
                              radius: 20.r,
                              child: Icon(
                                Icons.close,
                                color:
                                    SaayerTheme().getColorsPalette.whiteColor,
                                size: 25.r,
                              ))
                          : Container(
                              height: 8.h,
                              width: width / 4,
                              decoration: BoxDecoration(
                                  color: SaayerTheme()
                                      .getColorsPalette
                                      .backgroundColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.r),
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
