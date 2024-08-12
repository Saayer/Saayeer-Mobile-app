import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/personal_info/presentation/bloc/personal_info_bloc.dart';
import 'package:saayer/features/more_sub_features/personal_info/presentation/pages/personal_info_page.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocProvider<PersonalInfoBloc>(
          create: (context) {
            final PersonalInfoBloc bloc = getIt<PersonalInfoBloc>();
            bloc.add(const GetClientInfo());
            return bloc;
          },
          child: const PersonalInfoPage()),
    );
  }
}
