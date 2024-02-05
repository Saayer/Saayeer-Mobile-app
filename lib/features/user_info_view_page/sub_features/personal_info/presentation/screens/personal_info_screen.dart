import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/bloc/personal_info_bloc.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/pages/personal_info_page.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocProvider<PersonalInfoBloc>(
        create: (context) => getIt<PersonalInfoBloc>(),
        child: const PersonalInfoPage());
  }
}
