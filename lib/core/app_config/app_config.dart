import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/app_config/app_flavor_entity.dart';
import 'package:saayer/core/services/encryption/encryption.dart';
import 'package:saayer/core/services/deep_link/firebase_deep_link.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/utils/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/saayer_app.dart';
import 'package:flutter/services.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class AppConfig {
  final String appName;
  final FlavorType flavorType;

  AppConfig({required this.appName, required this.flavorType});

  void initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureInjection();
    await Firebase.initializeApp();
    initAppFlavorEntity();
    getIt<Encryption>().init();
    log("${flavorType}", name: "flavorType");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: SaayerTheme().getColorsPalette().navBarColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    await ScreenUtil.ensureScreenSize();
    final AdaptiveThemeMode? savedThemeMode =
        await AdaptiveTheme.getThemeMode();
    //await getIt<FirebaseDeepLink>().onDynamicLink();
    runApp(EasyLocalization(
      supportedLocales: Localization.getLocaleList(),
      path: Constants.stringsPath,
      fallbackLocale: Localization.usEnglish,
      startLocale: Localization.usEnglish,
      assetLoader: const JsonAssetLoader(),
      saveLocale: true,
      child: SaayerApp(
        flavorType: flavorType,
        savedThemeMode: savedThemeMode,
      ),
    ));
  }

  void initAppFlavorEntity() {
    AppFlavorEntity.initInstance(appName, flavorType, "");
  }
}
