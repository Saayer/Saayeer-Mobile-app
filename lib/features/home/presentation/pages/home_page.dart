import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/home/presentation/bloc/home_bloc.dart';
import 'package:saayer/features/home/presentation/widgets/paid_amounts_chart_section.dart';
import 'package:saayer/features/home/presentation/widgets/shipments_chart_section.dart';
import 'package:saayer/features/home/presentation/widgets/shipments_counts_statistic_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previousState, nextState) =>
          (previousState.shipmentsCountStateHelper.requestState != nextState.shipmentsCountStateHelper.requestState),
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          body: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),

              ///
              const ShipmentsCountsStatisticSection(),
              const SizedBox(
                height: 20,
              ),

              ///
              ShipmentsChartSection(homeBloc: homeBloc),
              const SizedBox(
                height: 20,
              ),

              ///
              PaidAmountsChartSection(homeBloc: homeBloc),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        );
      },
    );
  }
}
