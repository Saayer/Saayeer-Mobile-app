import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/bloc/shipment_summary_bloc.dart';

class ShipmentSummaryErrorHandler {
  final ShipmentSummaryState state;

  ShipmentSummaryErrorHandler({
    required this.state,
  });

  final BuildContext context = getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleShipmentSummaryErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleShipmentSummaryErrorStatus(ShipmentSummaryErrorStatus errorStatus) {
    // ERROR_ShipmentSummary
    switch (errorStatus) {
      case ShipmentSummaryErrorStatus.GET_STORES_ERROR:
        {
          SaayerDialogs().oneBtnDialog(title: "error_title", message: 'stores_error_msg');
          break;
        }
      case ShipmentSummaryErrorStatus.GET_CUSTOMERS_ERROR:
        {
          SaayerDialogs().oneBtnDialog(title: "error_title", message: 'addresses_error_msg');
          break;
        }
      case ShipmentSummaryErrorStatus.ADD_SHIPMENT_ERROR:
        {
          SaayerDialogs().oneBtnDialog(title: "error_title", message: 'error_msg');
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
