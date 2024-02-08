import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart';
import 'package:saayer/features/user_card/presentation/pages/user_card_page.dart';

class UserCardScreen extends StatelessWidget {
  const UserCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCardBloc>(
      create: (context) => getIt<UserCardBloc>()..add(InitUserCard()),
      child: const UserCardPage(),
    );
  }
}
