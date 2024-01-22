import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/app_strings.dart';
import 'package:saayer/core/utils/colors.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/splash/presentation/screens/splash_screen.dart';
import 'package:saayer/shared_widgets/loading_widget.dart';

class SaayerApp extends StatelessWidget {
  final FlavorType flavorType;

  const SaayerApp({super.key, required this.flavorType});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().mainNavigatorKey,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      routes: const {},
      theme: ThemeData(
        primaryColor: ColorsPalette.primaryColor,
        brightness: Brightness.light,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        shadowColor: Colors.white,
        canvasColor: Colors.transparent,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xfff3f4f4)),
      ),
      home: Builder(builder: (context) {
        return const LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: ShowLoading(),
          child: SplashScreen(),
        );
      }),
      //home: !isLoggedIn? ,
    );
  }
}
