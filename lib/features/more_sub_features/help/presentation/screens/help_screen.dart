import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/help/presentation/bloc/help_bloc.dart';
import 'package:saayer/features/more_sub_features/help/presentation/pages/help_page.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HelpBloc>(),
      child: const HelpPage(),
    );
  }
}
