import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class NavigationService {
  final GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey(debugLabel: "Main Navigator");

  _buildPageRoute(Widget page) => PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      );

  _buildMaterialPageRoute(Widget page) => MaterialPageRoute(
        builder: (context) => page,
      );

  void navigateTo(widget,
          {void Function(dynamic)? onBack, bool isAnimated = false}) =>
      Navigator.push(
        mainNavigatorKey.currentContext!,
        isAnimated ? _buildPageRoute(widget) : _buildMaterialPageRoute(widget),
      ).then((value) {
        if (onBack != null) {
          onBack(value);
        }
      });

  void navigateAndReplacement(widget, {bool isAnimated = false}) =>
      Navigator.pushReplacement(
        mainNavigatorKey.currentContext!,
        isAnimated ? _buildPageRoute(widget) : _buildMaterialPageRoute(widget),
      );

  void navigateAndFinish(widget, {bool isAnimated = false}) =>
      Navigator.pushAndRemoveUntil(
          mainNavigatorKey.currentContext!,
          isAnimated
              ? _buildPageRoute(widget)
              : _buildMaterialPageRoute(widget),
          (Route<dynamic> route) => false);

  void pop([dynamic result]) =>
      Navigator.pop(mainNavigatorKey.currentContext!, result);
}
