import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/presentation/bloc/saayer_gain_bloc.dart';

class SaayerGainErrorHandler {
  final SaayerGainState state;

  SaayerGainErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleSaayerGainErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleSaayerGainErrorStatus(
      SaayerGainErrorStatus saayerGainErrorStatus) {
    switch (saayerGainErrorStatus) {
      case SaayerGainErrorStatus.ERROR_GET_SAAYER_GAIN:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: 'error_msg');
          break;
        }
      case SaayerGainErrorStatus.ERROR_UPDATE_SAAYER_GAIN:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: 'error_msg');
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
