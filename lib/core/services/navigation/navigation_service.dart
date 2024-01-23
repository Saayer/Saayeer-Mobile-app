import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class NavigationService {
  final GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey(debugLabel: "Main Navigator");

  void navigateTo(widget, [void Function(dynamic)? onBack]) => Navigator.push(
        mainNavigatorKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      ).then((value) {
        if (onBack != null) {
          onBack(value);
        }
      });

  void navigateAndReplacement(widget) => Navigator.pushReplacement(
        mainNavigatorKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );

  void navigateAndFinish(widget) => Navigator.pushAndRemoveUntil(
      mainNavigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false);

  void pop([dynamic result]) =>
      Navigator.pop(mainNavigatorKey.currentContext!, result);
}
