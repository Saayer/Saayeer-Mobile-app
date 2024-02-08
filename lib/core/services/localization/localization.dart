import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';

class Localization {
  static Locale egArabic = const Locale('ar', 'EG');
  static Locale usEnglish = const Locale('en', 'US');

  static List<Locale> getLocaleList() => [egArabic, usEnglish];

  static Locale getLocale() =>
      EasyLocalization.of(
              getIt<NavigationService>().mainNavigatorKey.currentContext!)
          ?.locale ??
      egArabic;

  static bool isArabic() =>
      getIt<NavigationService>()
          .mainNavigatorKey
          .currentContext!
          .locale
          .languageCode ==
      "ar";

  static String localeKey() =>
      "${getIt<NavigationService>().mainNavigatorKey.currentContext?.locale.languageCode ?? "en"}-${getIt<NavigationService>().mainNavigatorKey.currentContext?.locale.countryCode ?? "US"}";

  static bool isEnglish() =>
      getIt<NavigationService>()
          .mainNavigatorKey
          .currentContext!
          .locale
          .languageCode ==
      "en";

  static String translate(String key) => tr(key);

  static Future<void> setLocale(Locale locale) async {
    if (getLocaleList().contains(locale)) {
      await getIt<NavigationService>()
          .mainNavigatorKey
          .currentContext!
          .setLocale(locale);
    } else {
      SaayerDialogs()
          .oneBtnDialog(title: "error", message: "something_went_wrong");
    }
  }
}
