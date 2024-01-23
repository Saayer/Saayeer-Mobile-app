import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/features/intro/presentation/bloc/intro_bloc.dart';
import 'package:saayer/features/intro/presentation/pages/intro_page.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => IntroBloc(),
      child: const IntroPage(),
    );
  }
}
