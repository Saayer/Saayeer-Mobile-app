import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/home/core/utils/enums/enums.dart';
import 'package:saayer/features/home/presentation/bloc/home_bloc.dart';

class HomeErrorHandler {
  final HomeState state;

  HomeErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleHomeErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleHomeErrorStatus(HomeErrorStatus homeErrorStatus) {
    switch (homeErrorStatus) {
      case HomeErrorStatus.ERROR_HOME:
        {
          SaayerDialogs()
              .oneBtnDialog(title: "error_title", message: 'error_msg');
          break;
        }
      case HomeErrorStatus.ERROR_GET_USER_PROFILE:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: state.stateHelper.errorMessage);
          break;
        }
      default:
        //ERR_00
        {
          SaayerDialogs().oneBtnDialog(
            title: "error_title",
            message: 'error_msg',
          );
          break;
        }
    }
  }
}
