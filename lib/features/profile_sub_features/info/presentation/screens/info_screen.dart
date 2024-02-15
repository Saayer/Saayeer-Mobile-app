import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/profile_sub_features/info/core/utils/enums/enums.dart';
import 'package:saayer/features/profile_sub_features/info/presentation/bloc/info_bloc.dart';
import 'package:saayer/features/profile_sub_features/info/presentation/pages/info_page.dart';

class InfoScreen extends StatelessWidget {
  final InfoTypes infoType;

  const InfoScreen({super.key, required this.infoType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<InfoBloc>(),
      child: const InfoPage(),
    );
  }
}
