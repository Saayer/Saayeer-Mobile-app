import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/intro/presentation/screens/intro_screen.dart';
import 'package:saayer/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/presentation/screens/view_page_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      buildWhen: (previousState, nextState) =>
          (previousState.requestState != nextState.requestState),
      listener: (context, state) async {
        if (state.requestState == RequestState.LOADED) {
          Timer(const Duration(seconds: 3), () async {
            bool isLoggedIn =
                await getIt<LoggedInCheckerService>().isLoggedIn();
            if (isLoggedIn) getIt<LoggedInCheckerService>().initLoggedUser();
            getIt<NavigationService>().navigateAndFinish(
                isLoggedIn ? const ViewPageScreen() : const IntroScreen());
          });
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          body: Center(
            child: Container(
              width: 300.w,
              height: 300.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      Constants.getImagePath("logo_with_text.jpeg")),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}