import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/presentation/bloc/store_info_bloc.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/presentation/pages/store_info_page.dart';

class StoreInfoScreen extends StatelessWidget {
  const StoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocProvider<StoreInfoBloc>(
        create: (context) => getIt<StoreInfoBloc>(),
        child: const StoreInfoPage());
  }
}
