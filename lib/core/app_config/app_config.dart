import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/app_config/app_flavor_entity.dart';
import 'package:saayer/core/services/encryption/encryption.dart';
import 'package:saayer/core/services/deep_link/firebase_deep_link.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/colors.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/saayer_app.dart';
import 'package:flutter/services.dart';

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorsPalette.navBarColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    await ScreenUtil.ensureScreenSize();
    //await getIt<FirebaseDeepLink>().onDynamicLink();
    runApp(SaayerApp(
      flavorType: flavorType,
    ));
  }

  void initAppFlavorEntity() {
    AppFlavorEntity.initInstance(appName, flavorType, "");
  }
}
