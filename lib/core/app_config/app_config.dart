import 'dart:developer';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:saayer/core/API/http_overrides.dart';
import 'package:saayer/core/app_config/app_flavor.dart';
import 'package:saayer/core/app_config/app_flavor_entity.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/colors/dark_colors.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/saayer_app.dart';
import 'package:flutter/services.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class AppConfig {
  final String appName;
  final FlavorType flavorType;

  AppConfig({required this.appName, required this.flavorType});

  void initializeApp() async {
    // to support web strategy in web platform
    usePathUrlStrategy();

    ///
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    //disable logger
    EasyLocalization.logger.enableBuildModes = [];
    configureInjection();
    initAppFlavorEntity();

    /// init sharedPreferences
    getIt<SharedPrefService>().initPref();
    log("$flavorType", name: "flavorType");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: DarkColorsPalette().navBarColor,
      statusBarIconBrightness: Brightness.dark,
    ));

    HttpOverrides.global = MyHttpOverrides();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    final AdaptiveThemeMode? savedThemeMode = await AdaptiveTheme.getThemeMode();
    runApp(EasyLocalization(
      supportedLocales: Localization.getLocaleList(),
      path: Constants.stringsPath,
      fallbackLocale: Localization.egArabic,
      startLocale: Localization.egArabic,
      assetLoader: const JsonAssetLoader(),
      saveLocale: true,
      child: SaayerApp(
        flavorType: flavorType,
        savedThemeMode: savedThemeMode,
      ),
    ));
  }

  void initAppFlavorEntity() {
    final AppFlavorEntity appFlavorEntity = AppFlavorEntity(appName: appName, flavorType: flavorType, versionNum: "");
    getIt<AppFlavor>().setAppFlavorEntity(appFlavorEntity);
  }
}
