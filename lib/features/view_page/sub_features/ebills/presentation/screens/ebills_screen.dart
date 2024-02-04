import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/view_page/sub_features/ebills/presentation/bloc/ebills_bloc.dart';
import 'package:saayer/features/view_page/sub_features/ebills/presentation/pages/ebills_page.dart';

class EbillsScreen extends StatelessWidget {
  const EbillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EbillsBloc>(),
      child: const EbillsPage(),
    );
  }
}
