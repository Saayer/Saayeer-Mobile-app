import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/features/get_started/presentation/bloc/get_started_bloc.dart';
import 'package:saayer/features/get_started/presentation/pages/get_started_page.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<GetStartedBloc>(
        create: (context) => GetStartedBloc(), child: const GetStartedPage());
  }
}
