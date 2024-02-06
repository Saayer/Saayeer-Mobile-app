import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:saayer/features/splash/presentation/pages/splash_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => SplashBloc()..add(const GetUserStatus()),
      child: const SplashPage(),
    );
  }
}
