import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/colors.dart';
import 'package:saayer/features/get_started/presentation/screens/get_started_screen.dart';
import 'package:saayer/features/intro/presentation/bloc/intro_bloc.dart';
import 'package:saayer/features/intro/presentation/widgets/bullet_points_widget.dart';
import 'package:saayer/features/intro/presentation/widgets/intro_screen_element_widget.dart';
import 'package:saayer/shared_widgets/buttons_widget.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final List<IntroScreenElementWidget> introScreenElementWidgetList =
        _getIntroScreenElementWidgetList();

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
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: height / 50),
            child: Column(
              children: [
                SizedBox(
                  height: height / 1.4,
                  child: Center(
                    child: PageView(
                      physics: const BouncingScrollPhysics(),
                      controller: bloc.pageController,
                      children: introScreenElementWidgetList,
                      onPageChanged: (int page) {
                        bloc.add(ChangeCurrentPage(currentPage: page));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                BulletPointsWidget(),
                Spacer(),
                TxtButton(
                  text: "Get Started",
                  color: ColorsPalette.orangeColor,
                  borderRadius: 50,
                  onPressed: () {
                    getIt<NavigationService>()
                        .navigateAndReplacement(GetStartedScreen());
                  },
                  btnWidth: width / 1.2,
                  btnHeight: 40,
                ),
                SizedBox(
                  height: height / 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<IntroScreenElementWidget> _getIntroScreenElementWidgetList() {
    List<IntroScreenElementWidget> introScreenElementWidgetList = [];
    introScreenElementWidgetList
      ..add(IntroScreenElementWidget(
        title: "All-in one place for\n your activities",
        body:
            "One place for all sports and\n activities that you are interested in.",
        imageName: "01.png",
      ))
      ..add(IntroScreenElementWidget(
        title: "Connect with like-minded\n people",
        body:
            "Create or join activities with people\n having the same interests.",
        imageName: "02.png",
      ))
      ..add(IntroScreenElementWidget(
        title: "Build communities \n around you",
        body: "Connect, share and grow your\n activities network.",
        imageName: "03.png",
      ));
    return introScreenElementWidgetList;
  }
}
