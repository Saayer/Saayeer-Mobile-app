import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';

class LoadingDialog {
  static void setIsLoading(BuildContext context, bool val,
      {String? message, Color? bgColor}) {
    try {
      final bool isVisible = getIt<NavigationService>()
          .mainNavigatorKey
          .currentContext!
          .loaderOverlay
          .visible;
      log("show/hide: $val isVisible: $isVisible", name: "setIsLoading");
      if (val && !isVisible) {
        log("show", name: "setIsLoading");
        context.loaderOverlay.show();
      }
      if (!val) {
        log("hide", name: "setIsLoading");
        context.loaderOverlay.hide();
      }
    } catch (e) {
      log(e.toString(), name: "setIsLoading");
    }
  }

  static bool checkIfLoadingVisible() {
    try {
      final bool isVisible = getIt<NavigationService>()
          .mainNavigatorKey
          .currentContext!
          .loaderOverlay
          .visible;
      return isVisible;
    } catch (_) {
      return false;
    }
  }

  static void showLoading(BuildContext context) {
    try {
      context.loaderOverlay.show();
    } catch (e) {
      log(e.toString(), name: "showLoading");
    }
  }
}
