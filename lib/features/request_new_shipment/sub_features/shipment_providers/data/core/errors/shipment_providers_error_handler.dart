import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/blocs/shipment_providers_bloc.dart';

class ShipmentProvidersErrorHandler {
  final ShipmentProvidersState state;

  ShipmentProvidersErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleShipmentProvidersErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleShipmentProvidersErrorStatus(ShipmentProvidersErrorStatus errorStatus) {
    // ERROR_RequestNewShipment
    switch (errorStatus) {
      case ShipmentProvidersErrorStatus.ERROR_GET_SHIPMENT_PROVIDERS:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: 'providers_error_msg');
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
