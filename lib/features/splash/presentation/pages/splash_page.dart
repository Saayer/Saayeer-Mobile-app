import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_animation_enums.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocConsumer<SplashBloc, SplashState>(
        buildWhen: (previousState, nextState) =>
            (previousState.requestState != nextState.requestState),
        listener: (context, state) async {
          if (state.requestState == RequestState.LOADED) {
            Timer(const Duration(seconds: 3), () {
              final bool isLoggedIn =
                  getIt<LoggedInCheckerService>().isLoggedIn();
              log("$isLoggedIn", name: "isLoggedIn");
              //if (isLoggedIn) getIt<LoggedInCheckerService>().initLoggedUser();
              getIt<NavigationService>().navigateAndFinishNamed(
                  isLoggedIn ? Routes.viewPageNamedPage : Routes.introNamedPage,
                  navigationAnimationType: NavigationAnimationTypes.SCALE);
            });
          }
        },
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            body: Center(
              child: Container(
                width: 250,
                height: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        Constants.getIconPath("ic_logo_with_text.png")),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
