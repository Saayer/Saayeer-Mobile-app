import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/presentation/bloc/service_providers_management_bloc.dart';

class ServiceProvidersManagementErrorHandler {
  final ServiceProvidersManagementState state;

  ServiceProvidersManagementErrorHandler({
    required this.state,
  });

  final BuildContext context = getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleServiceProvidersManagementErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleServiceProvidersManagementErrorStatus(
      ServiceProvidersManagementErrorStatus serviceProvidersManagementErrorStatus) {
    switch (serviceProvidersManagementErrorStatus) {
      case ServiceProvidersManagementErrorStatus.ERROR_GET_SERVICE_PROVIDERS:
        {
          SaayerDialogs().oneBtnDialog(title: "error_title", message: 'error_msg');
          break;
        }
      case ServiceProvidersManagementErrorStatus.ERROR_UPDATE_SERVICE_PROVIDER:
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
