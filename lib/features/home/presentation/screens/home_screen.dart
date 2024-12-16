import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/home/presentation/bloc/home_bloc.dart';
import 'package:saayer/features/home/presentation/pages/home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final HomeBloc bloc = getIt<HomeBloc>();
        if (UserUtils.isAdmin()) {
          bloc.add(GetAdminTotalStatusShipmentsCount(dataRangeDto: DateRangeDto()));
          bloc.add(GetAdminTotalShipmentsPerDays(dataRangeDto: bloc.dataRangeDto));
          bloc.add(GetAdminTotalPaidPerDays(dataRangeDto: bloc.dataRangeDto));
        } else {
          bloc.add(InitHome());
          bloc.add(GetTotalStatusShipmentsCount(dataRangeDto: DateRangeDto()));
          bloc.add(GetTotalShipmentsPerDays(dataRangeDto: bloc.dataRangeDto));
          bloc.add(GetTotalPaidPerDays(dataRangeDto: bloc.dataRangeDto));
        }

        return bloc;
      },
      child: const HomePage(),
    );
  }
}
