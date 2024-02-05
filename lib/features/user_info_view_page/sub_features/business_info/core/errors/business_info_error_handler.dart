import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/core/utils/enums/enums.dart';

class BusinessInfoErrorHandler {
  final BusinessInfoState state;

  BusinessInfoErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleBusinessInfoErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleBusinessInfoErrorStatus(BusinessInfoErrorStatus businessInfoErrorStatus) {
    // ERROR_LOG_IN
    switch (businessInfoErrorStatus) {
      case BusinessInfoErrorStatus.ERROR_BUSINESS_INFO:
        {
          SaayerDialogs().oneBtnDialog(
              title: "error_title",
              message: state.submitBusinessInfoEntity?.message ?? 'error_msg');
          break;
        }
      default:
        //ERR_00
        {
          SaayerDialogs().oneBtnDialog(
            title: "error_title",
            message: state.submitBusinessInfoEntity?.message ?? 'error_msg',
          );
          break;
        }
    }
  }
}
