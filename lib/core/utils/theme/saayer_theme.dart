import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/theme/colors/base_colors.dart';
import 'package:saayer/core/utils/theme/colors/dark_colors.dart';
import 'package:saayer/core/utils/theme/colors/light_colors.dart';

class SaayerTheme {
  static const defaultThemeMode = AdaptiveThemeMode.light;

  final ThemeData _baseThemeData = ThemeData(
    useMaterial3: true,
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    canvasColor: Colors.transparent,
    fontFamily: GoogleFonts.roboto.toString(),
  );

  ThemeData get lightThemeData {
    return _baseThemeData.copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      //colorSchemeSeed: LightSaayerTheme().getColorsPalette.primaryColor,
      primaryColor: LightColorsPalette().primaryColor,
      shadowColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    );
  }

  ThemeData get darkThemeData {
    return _baseThemeData.copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.black,
      //colorSchemeSeed: LightSaayerTheme().getColorsPalette.primaryColor,
      primaryColor: DarkColorsPalette().primaryColor,
      shadowColor: Colors.black,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    );
  }

  AdaptiveThemeMode get getThemeMode {
    return AdaptiveTheme.of(
            getIt<NavigationService>().mainNavigatorKey.currentContext!)
        .mode;
  }

  void setThemeMode() {
    AdaptiveTheme.of(
            getIt<NavigationService>().mainNavigatorKey.currentContext!)
        .toggleThemeMode(useSystem: false);

    AdaptiveTheme.of(
            getIt<NavigationService>().mainNavigatorKey.currentContext!)
        .updateState();
  }

  bool get isDarkThemeMode {
    return AdaptiveTheme.of(
            getIt<NavigationService>().mainNavigatorKey.currentContext!)
        .mode
        .isDark;
  }

  BaseColorsPalette get getColorsPalette {
    try {
      switch (getThemeMode) {
        case AdaptiveThemeMode.light:
        case AdaptiveThemeMode.system:
          {
            return LightColorsPalette();
          }
        case AdaptiveThemeMode.dark:
          {
            return DarkColorsPalette();
          }
      }
    } catch (e) {
      return LightColorsPalette();
    }
  }
}
