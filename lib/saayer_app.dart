import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:saayer/common/loading/loading_container.dart';
import 'package:saayer/common/loading/loading_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/splash/presentation/screens/splash_screen.dart';
import 'package:saayer/features/user_info_view_page/presentation/screens/user_info_view_page_screen.dart';
import 'package:saayer/features/view_page/presentation/screens/view_page_screen.dart';

class SaayerApp extends StatelessWidget {
  final FlavorType flavorType;
  final AdaptiveThemeMode? savedThemeMode;

  const SaayerApp({super.key, required this.flavorType, this.savedThemeMode});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          final double width = MediaQuery.of(context).size.width;
          final double height = MediaQuery.of(context).size.height;
          return AdaptiveTheme(
              light: SaayerTheme().lightThemeData,
              dark: SaayerTheme().darkThemeData,
              initial: savedThemeMode ?? SaayerTheme.defaultThemeMode,
              builder: (theme, darkTheme) {
                return GlobalLoaderOverlay(
                  useDefaultLoading: false,
                  overlayHeight: height,
                  overlayWidth: width,
                  overlayWidgetBuilder: (_) {
                    return const SaayerLoader();
                  },
                  overlayColor: SaayerTheme()
                      .getColorsPalette
                      .blackColor
                      .withOpacity(0.8),
                  child: MaterialApp(
                    navigatorKey: getIt<NavigationService>().mainNavigatorKey,
                    debugShowCheckedModeBanner: false,
                    title: Constants.appName,
                    routes: const {},
                    theme: theme,
                    darkTheme: darkTheme,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    home: Builder(builder: (context) {
                      return const SplashScreen();
                      //return const ViewPageScreen();
                      //return const UserInfoViewPageScreen();
                    }),
                  ),
                );
              });
        });
  }
}
