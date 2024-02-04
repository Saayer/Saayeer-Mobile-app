import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/log_in/domain/entities/log_in_entity.dart';
import 'package:saayer/features/log_in/domain/entities/submit_log_in_entity.dart';
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart';
import 'package:saayer/features/verify_otp/core/utils/enums/enums.dart';
import 'package:saayer/features/verify_otp/domain/entities/submit_verify_otp_entity.dart';
import 'package:saayer/features/verify_otp/domain/entities/verify_otp_entity.dart';
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart';

part 'verify_otp_event.dart';

part 'verify_otp_state.dart';

@injectable
class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final LogInUseCase logInUseCase;
  final ConfirmLogInUseCase confirmLogInUseCase;

  VerifyOtpBloc({required this.logInUseCase, required this.confirmLogInUseCase})
      : super(const VerifyOtpState()) {
    on<InitVerifyOtpEvent>(_initVerifyOtpEvent);
    on<ResendOtpEvent>(_resendOtpEvent);
    on<CheckOtpEvent>(_checkOtpEvent);
  }

  FutureOr<void> _initVerifyOtpEvent(
      InitVerifyOtpEvent event, Emitter<VerifyOtpState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        verifyOtpEntity: event.verifyOtpEntity));
  }

  Future<FutureOr<void>> _resendOtpEvent(
      ResendOtpEvent event, Emitter<VerifyOtpState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final result = await logInUseCase(LogInParameters(
        logInEntity: LogInEntity(
            phoneNumber: PhoneNumber(
                phoneNumber: state.verifyOtpEntity?.phoneNumber ?? ""))));

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitLogInData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: VerifyOtpErrorStatus.ERROR_RESEND_CODE)));
    } else {
      final SubmitLogInEntity? rightResult = (result as Right).value;
      log("right submitLogInData $rightResult");
      if (rightResult != null) {
        if (rightResult.isSuccess) {
          emit(state.copyWith(
              stateHelper: const StateHelper(
                  requestState: RequestState.SUCCESS, loadingMessage: ""),
              verifyOtpEntity:
                  state.verifyOtpEntity!.copyWith(otp: rightResult.otp),
              isOtpResent: true,
              resetExpiryDate: true));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR,
                errorStatus: VerifyOtpErrorStatus.ERROR_RESEND_CODE),
          ));
        }
      } else {
        log("", name: "SubmitLogInEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: VerifyOtpErrorStatus.ERROR_RESEND_CODE),
        ));
      }
    }
  }

  Future<FutureOr<void>> _checkOtpEvent(
      CheckOtpEvent event, Emitter<VerifyOtpState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final bool isVerifiedOtp =
        (event.otp.compareTo(state.verifyOtpEntity!.otp) == 0);
    log("$isVerifiedOtp", name: "isVerifiedOtp");
    if (isVerifiedOtp) {
      await _confirmLogin(emit);
    } else {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: VerifyOtpErrorStatus.ERROR_VERIFY_OTP)));
    }
  }

  _confirmLogin(Emitter<VerifyOtpState> emit) async {
    final result = await confirmLogInUseCase(
        ConfirmLogInParameters(verifyOtpEntity: state.verifyOtpEntity!));

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitLogInData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: VerifyOtpErrorStatus.ERROR_CONFIRM_LOGIN)));
    } else {
      final SubmitVerifyOtpEntity? rightResult = (result as Right).value;
      log("right submitLogInData $rightResult");
      if (rightResult != null) {
        if (rightResult.isSuccess) {
          emit(state.copyWith(
              stateHelper: const StateHelper(
                  requestState: RequestState.SUCCESS, loadingMessage: ""),
              isVerified: true));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR,
                errorStatus: VerifyOtpErrorStatus.ERROR_CONFIRM_LOGIN),
          ));
        }
      } else {
        log("", name: "SubmitLogInEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: VerifyOtpErrorStatus.ERROR_CONFIRM_LOGIN),
        ));
      }
    }
  }
}
