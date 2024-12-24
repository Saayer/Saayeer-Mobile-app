import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/clients/core/utils/enums/enums.dart';
import 'package:saayer/features/clients/presentation/bloc/clients_bloc.dart';

class ClientsErrorHandler {
  final ClientsState state;

  ClientsErrorHandler({
    required this.state,
  });

  final BuildContext context = getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleClientsErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleClientsErrorStatus(ClientsErrorStatus errorStatus) {
    // ERROR_Clients
    switch (errorStatus) {
      case ClientsErrorStatus.ERROR_GET_CLIENTS:
        {
          SaayerDialogs().oneBtnDialog(title: "error_title", message: 'client_error_msg');
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
