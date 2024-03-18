import 'package:flutter/material.dart';
import 'package:saayer/common/address_widgets/core/utils/enums/enums.dart';
import 'package:saayer/common/address_widgets/presentation/bloc/address_widgets_bloc.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';

class AddressWidgetsErrorHandler {
  final AddressWidgetsState state;

  AddressWidgetsErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleAddressWidgetsErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleAddressWidgetsErrorStatus(
      AddressWidgetsErrorStatus addressWidgetsErrorStatus) {
    switch (addressWidgetsErrorStatus) {
      case AddressWidgetsErrorStatus.ERROR_GET_CITIES:
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
