import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/why_saayer/presentation/bloc/why_saayer_bloc.dart';
import 'package:saayer/features/more_sub_features/why_saayer/presentation/pages/why_saayer_page.dart';

class WhySaayerScreen extends StatelessWidget {
  const WhySaayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WhySaayerBloc>(),
      child: const WhySaayerPage(),
    );
  }
}
