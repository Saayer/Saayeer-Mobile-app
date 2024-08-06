import 'package:flutter/material.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/verify_otp/core/utils/enums/enums.dart';
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart';

class VerifyOtpErrorHandler {
  final VerifyOtpState state;

  VerifyOtpErrorHandler({
    required this.state,
  });

  final BuildContext context =
      getIt<NavigationService>().mainNavigatorKey.currentContext!;

  void call() {
    _handleVerifyOtpErrorStatus(state.stateHelper.errorStatus);
  }

  void _handleVerifyOtpErrorStatus(VerifyOtpErrorStatus verifyOtpErrorStatus) {
    // ERROR_VERIFY_OTP
    // ERROR_RESEND_CODE
    // ERROR_CONFIRM_LOGIN
    switch (verifyOtpErrorStatus) {
      case VerifyOtpErrorStatus.ERROR_VERIFY_OTP:
        {
          SaayerDialogs().oneBtnDialog(
              title: "invalid_otp_error_title",
              message: 'invalid_otp_error_description');
          break;
        }
      case VerifyOtpErrorStatus.ERROR_RESEND_CODE:
      case VerifyOtpErrorStatus.ERROR_CONFIRM_LOGIN:
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
