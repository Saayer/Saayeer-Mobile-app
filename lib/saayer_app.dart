import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:saayer/common/loading/loading_widget.dart';
import 'package:saayer/common/session_timeout_listener.dart';
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/app_routes.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/features/splash/presentation/screens/splash_screen.dart';

class SaayerApp extends StatelessWidget {
  final FlavorType flavorType;
  final AdaptiveThemeMode? savedThemeMode;

  const SaayerApp({super.key, required this.flavorType, this.savedThemeMode});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SessionTimeoutListener(
      duration: const Duration(minutes: 30),
      onTimeOut: () {
        ///this is used for the web to ensure if a user has not used the app for a certain time
        ///and force to log in again
        if (kIsWeb) {
          final bool isLoggedIn = getIt<LoggedInCheckerService>().isLoggedIn();
          if (isLoggedIn) {
            print('SessionTimeout');
            getIt<LoggedInCheckerService>().logOut();
            getIt<NavigationService>().navigateAndFinishNamed(Routes.loginNamedPage);
          }
        }
      },
      child: AdaptiveTheme(
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
              overlayColor: SaayerTheme().getColorsPalette.blackColor.withOpacity(0.8),
              child: MaterialApp(
                shortcuts: (kIsWeb)
                    ? null
                    : {
                        /// to work space bar in text field for IOS web browser
                        LogicalKeySet(LogicalKeyboardKey.space): const ActivateIntent(),
                      },
                builder: (context, child) => ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: [
                    const Breakpoint(start: 0, end: 480, name: MOBILE),
                    const Breakpoint(start: 481, end: 900, name: TABLET),
                    const Breakpoint(start: 901, end: 1920, name: DESKTOP),
                    const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                  ],
                ),
                navigatorKey: getIt<NavigationService>().mainNavigatorKey,
                debugShowCheckedModeBanner: false,
                title: Constants.appName,
                onGenerateRoute: AppRoutes().generateRoute,
                theme: theme,
                darkTheme: darkTheme,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                initialRoute: Routes.splashNamedPage,
                home: Builder(builder: (context) {
                  return const SplashScreen();
                }),
              ),
            );
          }),
    );
  }
}
