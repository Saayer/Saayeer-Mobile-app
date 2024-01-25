import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart';
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart';
import 'package:saayer/features/log_in/presentation/pages/log_in_page.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocProvider<LogInBloc>(
        create: (context) => LogInBloc(logInUseCase: getIt<LogInUseCase>()),
        child: const LogInPage());
  }
}
