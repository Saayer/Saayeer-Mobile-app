import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/features/get_started/presentation/bloc/get_started_bloc.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocConsumer<GetStartedBloc, GetStartedState>(
      buildWhen: (previousState, nextState) =>
          (previousState.requestState != nextState.requestState),
      listener: (context, state) async {},
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [],
        ),
      ),
    );
  }
}
