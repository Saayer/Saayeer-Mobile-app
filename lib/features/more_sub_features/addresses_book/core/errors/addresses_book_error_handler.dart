import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/address/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart';
import 'package:saayer/features/more_sub_features/addresses_book/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart';

class AddressesBookErrorHandler {
  final AddressesBookState state;

  AddressesBookErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleAddressesBookErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleAddressesBookErrorStatus(
      AddressesBookErrorStatus addressesBookErrorStatus) {
    switch (addressesBookErrorStatus) {
      case AddressesBookErrorStatus.ERROR_GET_ADDRESSES:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: 'error_msg',
              onTapDismiss: () {
                getIt<NavigationService>().pop();
              });
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
