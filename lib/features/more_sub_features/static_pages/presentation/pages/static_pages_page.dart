import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/static_pages/core/enums/enums.dart';
import 'package:saayer/features/more_sub_features/static_pages/presentation/bloc/static_pages_bloc.dart';
import 'package:saayer/features/more_sub_features/static_pages/presentation/widgets/static_pages_text_helper.dart';

class StaticPagesPage extends StatelessWidget {
  final StaticPagesTypes staticPagesTypes;

  const StaticPagesPage({super.key, required this.staticPagesTypes});

  @override
  Widget build(BuildContext context) {
    final StaticPagesBloc staticPagesBloc = BlocProvider.of<StaticPagesBloc>(context);
    return BlocConsumer<StaticPagesBloc, StaticPagesState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
          if (state.stateHelper.requestState == RequestState.LOADED) {}
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          appBar: BaseAppBar(title: staticPagesTypes.name, showBackLeading: true),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: StaticPagesTextHelper(staticPagesType: staticPagesTypes, staticPagesBloc: staticPagesBloc)
                  .getTextBody(),
            ),
          ),
        );
      },
    );
  }
}
