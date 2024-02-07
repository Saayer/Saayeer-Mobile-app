import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/dialogs.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/user_card/core/utils/enums/enums.dart';
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart';

class UserCardErrorHandler {
  final UserCardState state;

  UserCardErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleUserCardErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleUserCardErrorStatus(UserCardErrorStatus userCardErrorStatus) {
    // ERROR_USER_CARD
    switch (userCardErrorStatus) {
      case UserCardErrorStatus.ERROR_USER_CARD:
        {
          SaayerDialogs()
              .oneBtnDialog(title: "error_title", message: 'error_msg');
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
