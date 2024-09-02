import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/request_new_shipment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';

class NewShipmentErrorHandler {
  final RequestNewShipmentState state;

  NewShipmentErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleNewShipmentErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleNewShipmentErrorStatus(RequestNewShipmentErrorStatus errorStatus) {
    // ERROR_RequestNewShipment
    switch (errorStatus) {
      case RequestNewShipmentErrorStatus.ERROR_GET_STORES:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: 'stores_error_msg');
          break;
        }
      case RequestNewShipmentErrorStatus.ERROR_GET_ADDRESSES:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: 'addresses_error_msg');
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
