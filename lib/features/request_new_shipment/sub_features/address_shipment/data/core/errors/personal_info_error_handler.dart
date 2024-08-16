import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/request_new_shipment/sub_features/address_shipment/data/core/utils/enums/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/address_shipment/presentation/bloc/address_shipment_bloc.dart';

class AddressShipmentsErrorHandler {
  final AddressShipmentState state;

  AddressShipmentsErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleAddressShipmentsErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleAddressShipmentsErrorStatus(AddressShipmentsErrorStatus personalInfoErrorStatus) {
    // ERROR_LOG_IN
    switch (personalInfoErrorStatus) {
      case AddressShipmentsErrorStatus.ERROR_Address_Shipments:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              //todo change
              message: state.submitAddressShipmentsEntity?.message ?? 'error_msg');
          break;
        }
      default:
        //ERR_00
        {
          SaayerDialogs().oneBtnDialog(
            title: "error_title",
            //todo change
            message: state.submitAddressShipmentsEntity?.message ?? 'error_msg',
          );
          break;
        }
    }
  }
}
