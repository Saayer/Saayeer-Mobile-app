import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/profile_sub_features/bills/presentation/bloc/bills_bloc.dart';
import 'package:saayer/features/profile_sub_features/bills/presentation/pages/bills_page.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BillsBloc>(),
      child: const BillsPage(),
    );
  }
}
