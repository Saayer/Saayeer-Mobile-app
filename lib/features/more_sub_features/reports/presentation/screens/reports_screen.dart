import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/reports/presentation/bloc/reports_bloc.dart';
import 'package:saayer/features/more_sub_features/reports/presentation/pages/reports_page.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocProvider(
        create: (context) => getIt<ReportsBloc>(),
        child: const ReportsPage(),
      ),
    );
  }
}
