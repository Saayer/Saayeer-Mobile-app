import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/profile_sub_features/info/core/utils/enums/enums.dart';
import 'package:saayer/features/profile_sub_features/info/domain/entities/info_entity.dart';
import 'package:saayer/features/profile_sub_features/info/presentation/bloc/info_bloc.dart';
import 'package:saayer/features/profile_sub_features/info/presentation/pages/info_page.dart';

class InfoScreen extends StatelessWidget {
  final InfoEntity infoEntity;

  const InfoScreen({super.key, required this.infoEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final InfoBloc bloc = getIt<InfoBloc>();
        bloc.add(InitInfo(infoEntity: infoEntity));
        return bloc;
      },
      child: const InfoPage(),
    );
  }
}
