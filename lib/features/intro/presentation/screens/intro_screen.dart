import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/colors.dart';
import 'package:saayer/features/get_started/presentation/screens/get_started_screen.dart';
import 'package:saayer/features/intro/presentation/bloc/intro_bloc.dart';
import 'package:saayer/features/intro/presentation/pages/intro_page.dart';
import 'package:saayer/features/intro/presentation/widgets/bullet_points_widget.dart';
import 'package:saayer/features/intro/presentation/widgets/intro_screen_element_widget.dart';
import 'package:saayer/shared_widgets/buttons_widget.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => IntroBloc()..add(InitIntro()),
      child: IntroPage(),
    );
  }
}
