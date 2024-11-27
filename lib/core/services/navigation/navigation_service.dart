import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/services/navigation/navigation_animation_enums.dart';

@Singleton()
class NavigationService {
  final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey(debugLabel: "Main Navigator");

  void navigateToNamed(String routeName,
          {void Function(dynamic)? onBack,
          NavigationAnimationTypes navigationAnimationType = NavigationAnimationTypes.NONE,
          Object? arguments}) =>
      Navigator.pushNamed(
        mainNavigatorKey.currentContext!,
        routeName,
        arguments: arguments,
      ).then((value) {
        if (onBack != null) {
          onBack(value);
        }
      });

  void navigateAndReplacementNamed(String routeName,
          {NavigationAnimationTypes navigationAnimationType = NavigationAnimationTypes.NONE, Object? arguments}) =>
      Navigator.pushReplacementNamed(
        mainNavigatorKey.currentContext!,
        routeName,
        arguments: arguments,
      );

  void navigateAndFinishNamed(String routeName,
          {NavigationAnimationTypes navigationAnimationType = NavigationAnimationTypes.NONE, Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(
          mainNavigatorKey.currentContext!, routeName, arguments: arguments, (Route<dynamic> route) => false);

  void pop([dynamic result]) => Navigator.pop(mainNavigatorKey.currentContext!, result);
}
