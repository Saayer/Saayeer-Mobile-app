import 'package:flutter/material.dart';
import 'package:saayer/core/services/navigation/navigation_animation_enums.dart';

class NavigationAnimationService {
  Route call(
      Widget enterPage, NavigationAnimationTypes navigationAnimationType) {
    switch (navigationAnimationType) {
      case NavigationAnimationTypes.NONE:
        {
          return buildNoneNavigationAnimation(enterPage);
        }
      case NavigationAnimationTypes.FADE:
        {
          return buildFadeNavigationAnimation(enterPage);
        }
      case NavigationAnimationTypes.SLIDE:
        {
          return buildSlideNavigationAnimation(enterPage);
        }
      case NavigationAnimationTypes.SCALE:
        {
          return buildScaleNavigationAnimation(enterPage);
        }
    }
  }

  buildNoneNavigationAnimation(Widget enterPage) => MaterialPageRoute(
        builder: (context) => enterPage,
      );

  buildFadeNavigationAnimation(Widget enterPage) => PageRouteBuilder(
        pageBuilder: (_, __, ___) => enterPage,
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      );

  buildSlideNavigationAnimation(Widget enterPage) => PageRouteBuilder(
      pageBuilder: (_, __, ___) => enterPage,
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const Offset begin = Offset(1.0, 0.0);
        const Offset end = Offset.zero;
        const Cubic curve = Curves.ease;

        final Animatable<Offset> tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });

  buildScaleNavigationAnimation(Widget enterPage) => PageRouteBuilder(
      pageBuilder: (_, __, ___) => enterPage,
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          ScaleTransition(
            scale:
                CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
            child: child,
          ));
}
