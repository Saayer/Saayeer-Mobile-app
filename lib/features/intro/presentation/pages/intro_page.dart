import 'package:animated_introduction/animated_introduction.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/intro/presentation/bloc/intro_bloc.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SingleIntroScreen> pages = _getIntroScreenElementWidgetList();

    return BlocConsumer<IntroBloc, IntroState>(
      buildWhen: (previousState, nextState) => (previousState.requestState != nextState.requestState),
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: AnimatedIntroduction(
              slides: pages,
              footerBgColor: SaayerTheme().getColorsPalette.primaryColor,
              indicatorType: IndicatorType.circle,
              skipWidget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "skip".tr(),
                  style: AppTextStyles.mainLabel(SaayerTheme().getColorsPalette.backgroundColor),
                ),
              ),
              nextWidget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "next".tr(),
                  style: AppTextStyles.mainLabel(SaayerTheme().getColorsPalette.backgroundColor),
                ),
              ),
              doneWidget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "login_now".tr(),
                  style: AppTextStyles.mainLabel(SaayerTheme().getColorsPalette.backgroundColor),
                ),
              ),
              onSkip: () {
                getIt<NavigationService>().navigateAndFinishNamed(Routes.loginNamedPage);
              },
              onDone: () {
                getIt<NavigationService>().navigateAndFinishNamed(Routes.loginNamedPage);
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
          imageAsset: Constants.getIconPath("ic_logo_with_text.png"));
    });
    return pages;
  }
}
