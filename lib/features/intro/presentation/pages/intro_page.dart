import 'package:animated_introduction/animated_introduction.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/intro/presentation/bloc/intro_bloc.dart';
import 'package:saayer/features/log_in/presentation/screens/log_in_screen.dart';
import 'dart:ui' as ui;

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final List<SingleIntroScreen> pages = _getIntroScreenElementWidgetList();

    return BlocConsumer<IntroBloc, IntroState>(
      buildWhen: (previousState, nextState) =>
          (previousState.requestState != nextState.requestState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final bloc = BlocProvider.of<IntroBloc>(context);
        return Scaffold(
            backgroundColor: Colors.white,
            body: AnimatedIntroduction(
              slides: pages,
              footerBgColor: SaayerTheme().getColorsPalette.primaryColor,
              indicatorType: IndicatorType.circle,
              skipText: "skip".tr(),
              nextText: "next".tr(),
              doneText: "login_now".tr(),
              onSkip: () {
                getIt<NavigationService>()
                    .navigateAndFinish(const LogInScreen());
              },
              onDone: () {
                getIt<NavigationService>()
                    .navigateAndFinish(const LogInScreen());
              },
            ));
      },
    );
  }

  List<SingleIntroScreen> _getIntroScreenElementWidgetList() {
    final List<SingleIntroScreen> pages = List.generate(3, (index) {
      final int currentIndex = (index + 1);
      return SingleIntroScreen(
        headerBgColor: SaayerTheme().getColorsPalette.backgroundColor,
        sideDotsBgColor: SaayerTheme().getColorsPalette.backgroundColor,
        mainCircleBgColor: SaayerTheme().getColorsPalette.backgroundColor,
        title: 'introScreenTitle_$currentIndex'.tr(),
        description: 'introScreenDescription_$currentIndex'.tr(),
        textStyle: AppTextStyles.label(),
        // imageAsset:
        //     Constants.getImagePath("introScreenImage_$currentIndex.png"),
        imageAsset: Constants.getImagePath("logo_with_text.jpeg"),
      );
    });
    return pages;
  }
}
