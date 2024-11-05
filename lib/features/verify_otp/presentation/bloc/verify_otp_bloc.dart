import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart';
import 'package:saayer/features/verify_otp/core/utils/enums/enums.dart';
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart';

part 'verify_otp_event.dart';

part 'verify_otp_state.dart';

@injectable
class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final LogInUseCase logInUseCase;
  final ConfirmLogInUseCase confirmLogInUseCase;

  VerifyOtpBloc({required this.logInUseCase, required this.confirmLogInUseCase}) : super(VerifyOtpState()) {
    on<InitVerifyOtpEvent>(_initVerifyOtpEvent);
    on<ResendOtpEvent>(_resendOtpEvent);
    on<CheckOtpEvent>(_checkOtpEvent);
  }

  ///
  String? phoneNumber;
  String? otpCode;

  FutureOr<void> _initVerifyOtpEvent(InitVerifyOtpEvent event, Emitter<VerifyOtpState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    ///
    phoneNumber = event.tokenRequestDto.phoneNumber;

    ///
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), tokenRequestDto: event.tokenRequestDto));
  }

  Future<FutureOr<void>> _resendOtpEvent(ResendOtpEvent event, Emitter<VerifyOtpState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, LoginResponseDto?> result = await logInUseCase(LogInParameters(
        loginRequestDto: LoginRequestDto((b) => b..phoneNo = state.tokenRequestDto?.phoneNumber ?? "")));

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitLogInData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: VerifyOtpErrorStatus.ERROR_RESEND_CODE)));
    } else {
      final LoginResponseDto? rightResult = (result as Right).value;
      log("right submitLogInData $rightResult");
      if (rightResult != null) {
        if (rightResult.hasError ?? false) {
          emit(state.copyWith(
              stateHelper: StateHelper(
                  requestState: RequestState.ERROR,
                  errorStatus: VerifyOtpErrorStatus.ERROR_RESEND_CODE,
                  errorMessage: rightResult.errorMessage ?? 'error_msg')));
        } else {
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: ""),
              isOtpResent: true,
              resetExpiryDate: true));
        }
      } else {
        log("", name: "SubmitLogInEvent error");
        emit(state.copyWith(
          stateHelper:
              const StateHelper(requestState: RequestState.ERROR, errorStatus: VerifyOtpErrorStatus.ERROR_RESEND_CODE),
        ));
      }
    }
  }

  Future<FutureOr<void>> _checkOtpEvent(CheckOtpEvent event, Emitter<VerifyOtpState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        tokenRequestDto: TokenRequestDto((b) => b
          ..phoneNumber = phoneNumber
          ..verificationCode = event.otp)));

    ///
    await _confirmLogin(emit);
  }

  _confirmLogin(Emitter<VerifyOtpState> emit) async {
    final result = await confirmLogInUseCase(state.tokenRequestDto!);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitLogInData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: VerifyOtpErrorStatus.ERROR_VERIFY_OTP)));
    } else {
      final TokenResponseDto? rightResult = (result as Right).value;
      log("right submitLogInData $rightResult");
      if (rightResult != null) {
        if (rightResult.reponseStatus == TokenReponseStatus.invalidOTPCode) {
          emit(state.copyWith(
            stateHelper: StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: VerifyOtpErrorStatus.ERROR_VERIFY_OTP,
              errorMessage: rightResult.errorMessage ?? 'invalid_otp_error_description',
            ),
          ));
        } else if (rightResult.reponseStatus == TokenReponseStatus.phoneNumberNotRegistered) {
          emit(state.copyWith(
            stateHelper: StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: VerifyOtpErrorStatus.ERROR_VERIFY_OTP,
              errorMessage: rightResult.errorMessage ?? 'invalid_otp_error_description',
            ),
          ));
        } else if (rightResult.reponseStatus == TokenReponseStatus.success) {
          if (rightResult.token != null) {
            emit(state.copyWith(
                stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: ""),
                isVerified: true));
          } else {
            emit(state.copyWith(
              stateHelper: const StateHelper(
                  requestState: RequestState.ERROR, errorStatus: VerifyOtpErrorStatus.ERROR_VERIFY_OTP),
            ));
          }
        } else {}
      } else {
        log("", name: "SubmitLogInEvent error");
        emit(state.copyWith(
          stateHelper:
              const StateHelper(requestState: RequestState.ERROR, errorStatus: VerifyOtpErrorStatus.ERROR_VERIFY_OTP),
        ));
      }
    }
  }
}
