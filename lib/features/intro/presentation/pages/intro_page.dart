import 'package:animated_introduction/animated_introduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants.dart';
import 'package:saayer/features/intro/presentation/bloc/intro_bloc.dart';
import 'package:saayer/features/log_in/presentation/screens/log_in_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
              indicatorType: IndicatorType.circle,
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
        title: 'introScreenTitle_$currentIndex',
        description: 'introScreenDescription_$currentIndex',
        imageAsset:
            Constants.getImagePath("introScreenImage_$currentIndex.png"),
      );
    });
    return pages;
  }
}
