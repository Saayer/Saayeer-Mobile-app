import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/static_pages/core/enums/enums.dart';
import 'package:saayer/features/more_sub_features/static_pages/presentation/bloc/static_pages_bloc.dart';
import 'package:saayer/features/more_sub_features/static_pages/presentation/pages/static_pages_page.dart';

class StaticPagesScreen extends StatelessWidget {
  final StaticPagesTypes staticPagesTypes;

  const StaticPagesScreen({super.key, required this.staticPagesTypes});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
        child: BlocProvider(
      create: (context) {
        final StaticPagesBloc bloc = getIt<StaticPagesBloc>();
        return bloc;
      },
      child: StaticPagesPage(staticPagesTypes: staticPagesTypes),
    ));
  }
}
