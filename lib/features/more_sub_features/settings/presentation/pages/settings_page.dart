import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/settings/presentation/bloc/settings_bloc.dart';
import 'package:saayer/features/more_sub_features/settings/presentation/widgets/dark_mode_widget.dart';
import 'package:saayer/features/more_sub_features/settings/presentation/widgets/language_widget.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/screens/view_page_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return BlocConsumer<SettingsBloc, SettingsState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (settingsBloc.state.stateHelper.requestState == RequestState.LOADING);
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
        return PopScope(
          onPopInvoked: (bool popInvoked) {
            log("$popInvoked", name: "popInvoked");
            if (popInvoked) {
              _onBack();
            }
          },
          child: Scaffold(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            appBar: BaseAppBar(
              title: "settings".tr(),
              showBackLeading: true,
              onTapLeading: () {
                _onBack();
              },
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // const ChangePasswordWidget(),
                    // dividerWidget,
                    const DarkModeWidget(),
                    dividerWidget,
                    const LanguageWidget(),
                    // dividerWidget,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onBack() {
    getIt<NavigationService>().navigateAndFinish(const ViewPageScreen(
      navBarIconType: NavBarIconTypes.MORE,
    ));
  }
}
