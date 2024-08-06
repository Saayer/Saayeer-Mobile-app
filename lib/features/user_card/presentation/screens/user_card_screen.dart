import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart';
import 'package:saayer/features/user_card/presentation/pages/user_card_page.dart';

class UserCardScreen extends StatelessWidget {
  final bool isParentLoading;
  final double horizontalPadding, verticalPadding;

  const UserCardScreen(
      {super.key,
      required this.isParentLoading,
      this.horizontalPadding = 16,
      this.verticalPadding = 16});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCardBloc>(
      create: (context) => getIt<UserCardBloc>()..add(InitUserCard()),
      child: UserCardPage(
        isParentLoading: isParentLoading,
        horizontalPadding: horizontalPadding,
        verticalPadding: verticalPadding,
      ),
    );
  }
}
