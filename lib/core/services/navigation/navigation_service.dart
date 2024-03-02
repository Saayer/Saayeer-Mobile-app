import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/services/navigation/navigation_animation_enums.dart';
import 'package:saayer/core/services/navigation/navigation_animation_service.dart';

@Singleton()
class NavigationService {
  final GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey(debugLabel: "Main Navigator");

  void navigateTo(Widget enterPage,
          {void Function(dynamic)? onBack,
          NavigationAnimationTypes navigationAnimationType =
              NavigationAnimationTypes.NONE}) =>
      Navigator.push(
        mainNavigatorKey.currentContext!,
        NavigationAnimationService()(enterPage, navigationAnimationType),
      ).then((value) {
        if (onBack != null) {
          onBack(value);
        }
      });

  void navigateAndReplacement(Widget enterPage,
          {NavigationAnimationTypes navigationAnimationType =
              NavigationAnimationTypes.NONE}) =>
      Navigator.pushReplacement(
        mainNavigatorKey.currentContext!,
        NavigationAnimationService()(enterPage, navigationAnimationType),
      );

  void navigateAndFinish(Widget enterPage,
          {NavigationAnimationTypes navigationAnimationType =
              NavigationAnimationTypes.NONE}) =>
      Navigator.pushAndRemoveUntil(
          mainNavigatorKey.currentContext!,
          NavigationAnimationService()(enterPage, navigationAnimationType),
          (Route<dynamic> route) => false);


  void pop([dynamic result]) =>
      Navigator.pop(mainNavigatorKey.currentContext!, result);
}
