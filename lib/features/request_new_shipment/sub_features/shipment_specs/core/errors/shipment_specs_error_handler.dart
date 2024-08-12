import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/presentation/bloc/shipment_specs_bloc.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/presentation/bloc/add_edit_store_bloc.dart';

class ShipmentSpecsErrorHandler {
  final ShipmentSpecsState state;

  ShipmentSpecsErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleStoreInfoErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleStoreInfoErrorStatus(StoreInfoErrorStatus storeInfoErrorStatus) {
    // ERROR_LOG_IN
    switch (storeInfoErrorStatus) {
      case StoreInfoErrorStatus.ERROR_STORE_INFO:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: state.shipmentSpecsInfoEntity?.message ?? 'error_msg');
          break;
        }
      default:
        //ERR_00
        {
          SaayerDialogs().oneBtnDialog(
            title: "error_title",
            message: state.shipmentSpecsInfoEntity?.message ?? 'error_msg',
          );
          break;
        }
    }
  }
}
