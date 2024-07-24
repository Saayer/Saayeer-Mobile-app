import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/log_in/core/utils/enums/enums.dart';
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

@injectable
class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final LogInUseCase logInUseCase;

  LogInBloc({required this.logInUseCase}) : super(const LogInState()) {
    on<OnTextChange>(_onTextChange);
    on<SubmitLogInData>(_submitLogInData);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  Map<LogInFieldsTypes, bool> logInFieldsValidMap = {};

  FutureOr<void> _onTextChange(OnTextChange event, Emitter<LogInState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final bool isPhone =
        (event.logInFieldsType == LogInFieldsTypes.PHONE_NUMBER);
    if (!isPhone) {
      event.textEditingController!.text = event.str ?? "";
      TextSelection previousSelection = event.textEditingController!.selection;
      event.textEditingController!.selection = previousSelection;
    }
    log("onTextChange ${event.str}", name: "onTextChange");
    logInFieldsValidMap[event.logInFieldsType] = !isPhone
        ? (event.str?.isNotEmpty ?? false)
        : (event.phoneNumber?.phoneNumber?.isNotEmpty ?? false);
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        logInEntity:
        AuthenticateRequest((b) => b..mobileNumber= event.phoneNumber?.phoneNumber ??  '')));
  }

  Future<FutureOr<void>> _submitLogInData(
      SubmitLogInData event, Emitter<LogInState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, AuthenticateResponseVerify?> result =
        await logInUseCase(LogInParameters(logInEntity: state.logInEntity!));

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitLogInData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: LogInErrorStatus.ERROR_LOG_IN)));
    } else {
      final AuthenticateResponseVerify? rightResult = (result as Right).value;
      log("right submitLogInData $rightResult");
      if (rightResult != null) {
        if (rightResult.data != null) {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.SUCCESS, loadingMessage: ""),
            submitLogInEntity: rightResult,
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR,
                errorStatus: LogInErrorStatus.ERROR_LOG_IN),
            submitLogInEntity: rightResult,
          ));
        }
      } else {
        log("", name: "SubmitLogInEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: LogInErrorStatus.ERROR_LOG_IN),
        ));
      }
    }
  }
}
