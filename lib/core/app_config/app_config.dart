import 'dart:developer';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/API/http_overrides.dart';
import 'package:saayer/core/app_config/app_flavor.dart';
import 'package:saayer/core/app_config/app_flavor_entity.dart';
import 'package:saayer/core/services/encryption/encryption.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/colors/dark_colors.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/saayer_app.dart';
import 'package:flutter/services.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:saayer/core/app_config/firebase_options.dart';

class AppConfig {
  final String appName;
  final FlavorType flavorType;

  AppConfig({required this.appName, required this.flavorType});

  void initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    //disable logger
    EasyLocalization.logger.enableBuildModes = [];
    configureInjection();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    initAppFlavorEntity();
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


    await ScreenUtil.ensureScreenSize();
    final AdaptiveThemeMode? savedThemeMode =
        await AdaptiveTheme.getThemeMode();
    //await getIt<FirebaseDeepLink>().onDynamicLink();
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
    final AppFlavorEntity appFlavorEntity = AppFlavorEntity(
        appName: appName, flavorType: flavorType, versionNum: "");
    getIt<AppFlavor>().setAppFlavorEntity(appFlavorEntity);
  }
}