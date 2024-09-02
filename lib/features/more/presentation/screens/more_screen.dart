import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more/presentation/bloc/more_bloc.dart';
import 'package:saayer/features/more/presentation/pages/more_page.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoreBloc>(),
      child: const MorePage(),
    );
  }
}
