import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/address/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart';

class AddAddressErrorHandler {
  final AddAddressState state;

  AddAddressErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleAddAddressErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleAddAddressErrorStatus(
      AddAddressErrorStatus addAddressErrorStatus) {
    switch (addAddressErrorStatus) {
      case AddAddressErrorStatus.ERROR_ADD_ADDRESS_INFO:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: 'error_msg');
          break;
        }
      case AddAddressErrorStatus.ERROR_GET_CITIES:
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
