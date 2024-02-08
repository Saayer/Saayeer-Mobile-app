import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/log_in/core/utils/enums/enums.dart';
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart';

class LogInErrorHandler {
  final LogInState state;

  LogInErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleLogInErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleLogInErrorStatus(LogInErrorStatus logInErrorStatus) {
    // ERROR_LOG_IN
    switch (logInErrorStatus) {
      case LogInErrorStatus.ERROR_LOG_IN:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: state.submitLogInEntity?.message ?? 'error_msg');
          break;
        }
      default:
        //ERR_00
        {
          SaayerDialogs().oneBtnDialog(
            title: "error_title",
            message: state.submitLogInEntity?.message ?? 'error_msg',
          );
          break;
        }
    }
  }
}
