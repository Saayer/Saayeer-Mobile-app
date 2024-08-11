import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/reports/presentation/bloc/reports_bloc.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final ReportsBloc reportsBloc = BlocProvider.of<ReportsBloc>(context);
    return BlocConsumer<ReportsBloc, ReportsState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (reportsBloc.state.stateHelper.requestState ==
            RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        final Widget dividerWidget = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Divider(
            thickness: 0.5,
            color: SaayerTheme().getColorsPalette.greyColor,
          ),
        );
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          appBar: BaseAppBar(
            title: "reports".tr(),
            showBackLeading: true,
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ),
          ),
        );
      },
    );
  }
}
