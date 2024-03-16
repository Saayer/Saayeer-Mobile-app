import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/view_page/sub_features/home/presentation/bloc/home_bloc.dart';
import 'package:saayer/features/view_page/sub_features/home/presentation/pages/home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final HomeBloc bloc = getIt<HomeBloc>();
        bloc.add(InitHome());
        return bloc;
      },
      child: const HomePage(),
    );
  }
}
