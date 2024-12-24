import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';

class ShipmentsErrorHandler {
  final ShipmentsState state;

  ShipmentsErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleNewShipmentErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleNewShipmentErrorStatus(ShipmentsErrorStatus errorStatus) {
    // ERROR_Shipments
    switch (errorStatus) {
      case ShipmentsErrorStatus.ERROR_GET_STORES:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: 'stores_error_msg');
          break;
        }
      case ShipmentsErrorStatus.ERROR_GET_CLIENTS:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: 'client_error_msg');
          break;
        }
      case ShipmentsErrorStatus.ERROR_GET_SERVICE_PROVIDERS:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: 'service_provider_error_msg');
          break;
        }
      case ShipmentsErrorStatus.ERROR_GET_SHIPMENTS:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: 'shipments_error_msg');
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
