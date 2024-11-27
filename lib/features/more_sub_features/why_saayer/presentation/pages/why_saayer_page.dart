import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/more_sub_features/why_saayer/presentation/bloc/why_saayer_bloc.dart';

class WhySaayerPage extends StatelessWidget {
  const WhySaayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WhySaayerBloc whySaayerBloc = BlocProvider.of<WhySaayerBloc>(context);
    return BlocConsumer<WhySaayerBloc, WhySaayerState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (whySaayerBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          appBar: BaseAppBar(
            title: "why_saayer".tr(),
            showBackLeading: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _getItemsWidgetList(),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _getItemsWidgetList() {
    final Widget dividerWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Divider(
        thickness: 0.5,
        color: SaayerTheme().getColorsPalette.greyColor,
      ),
    );
    final List<Widget> items = List.generate(3, (index) {
      final int currentIndex = (index + 1);
      final bool isLast = (index == 2);
      return Column(
        children: [
          ListTile(
              horizontalTitleGap: 0,
              title: Row(
                children: [
                  Image.asset(
                    Constants.getIconPath("ic_logo.png"),
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'introScreenTitle_$currentIndex'.tr(),
                    style: AppTextStyles.boldLiteLabel(),
                  ),
                ],
              ),
              subtitle: Text(
                'introScreenDescription_$currentIndex'.tr(),
                style: AppTextStyles.label(SaayerTheme().getColorsPalette.darkGreyColor),
              )),
          if (!isLast) dividerWidget
        ],
      );
    });
    return items;
  }
}
