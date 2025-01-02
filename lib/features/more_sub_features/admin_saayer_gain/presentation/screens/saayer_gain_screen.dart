import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/presentation/bloc/saayer_gain_bloc.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/presentation/pages/saayer_gain_page.dart';

class SaayerGainScreen extends StatelessWidget {
  const SaayerGainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocProvider(
        create: (context) {
          final SaayerGainBloc bloc = getIt<SaayerGainBloc>();
          bloc.add(const GetSaayerGain());
          return bloc;
        },
        child: const SaayerGainPage(),
      ),
    );
  }
}
