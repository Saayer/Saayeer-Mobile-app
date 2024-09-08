import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/shipment_details_tracking_info/data/core/utils/enums.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/bloc/shipment_details_bloc.dart';

class ShipmentTrackingDetailsErrorHandler {
  final ShipmentDetailsState state;

  ShipmentTrackingDetailsErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleShipmentTrackingDetailsErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleShipmentTrackingDetailsErrorStatus(ShipmentTrackingDetailsErrorStatus errorStatus) {
    // ERROR_ShipmentTrackingDetails
    switch (errorStatus) {
      case ShipmentTrackingDetailsErrorStatus.ERROR_GET_TRACKING:
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
