import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/more_sub_features/personal_info/presentation/bloc/personal_info_bloc.dart';
import 'package:saayer/features/more_sub_features/personal_info/core/utils/enums/enums.dart';

class PersonalInfoErrorHandler {
  final PersonalInfoState state;

  PersonalInfoErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handlePersonalInfoErrorStatus(state.stateHelper.errorStatus);
  }

  void _handlePersonalInfoErrorStatus(PersonalInfoErrorStatus personalInfoErrorStatus) {
    // ERROR_LOG_IN
    switch (personalInfoErrorStatus) {
      case PersonalInfoErrorStatus.ERROR_PERSONAL_INFO:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: state.submitPersonalInfoEntity?.message ?? 'error_msg');
          break;
        }
      default:
        //ERR_00
        {
          SaayerDialogs().oneBtnDialog(
            title: "error_title",
            message: state.submitPersonalInfoEntity?.message ?? 'error_msg',
          );
          break;
        }
    }
  }
}
