import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/presentation/bloc/stores_list_bloc.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/presentation/pages/stores_list_page.dart';

class StoresListScreen extends StatelessWidget {
  const StoresListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocProvider<StoresListBloc>(
          create: (context) {
            final StoresListBloc bloc = getIt<StoresListBloc>();
            bloc.add(const GetStores());
            return bloc;
          },
          child: const StoresListPage()),
    );
  }
}
