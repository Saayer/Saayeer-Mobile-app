import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/log_in/core/utils/enums/enums.dart';
import 'package:saayer/features/log_in/domain/entities/log_in_entity.dart';
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

@injectable
class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final LogInUseCase logInUseCase;

  LogInBloc({required this.logInUseCase}) : super(LogInState()) {
    on<OnTextChange>(_onTextChange);
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
            LogInEntity(phoneNumber: event.phoneNumber ?? PhoneNumber())));
  }

// Future _submit(Emitter<LogInState> emit) async {
//   emit(state.copyWith(
//     requestState: RequestState.LOADING,
//   ));
//
//   final result = await logInUseCase(LogInParameters(state.logInEntity!));
//
//   result.fold((l) {
//     log("left logIn $l");
//     return emit(state.copyWith(
//         requestState: RequestState.ERROR, errorMessage: l.failureMessage));
//   }, (r) async {
//     if (r != null) {
//       log("right logIn $r");
//       if (r.isSuccess ?? false) {
//         LoggedInUserEntity loggedInUserEntity = r.loggedInUserEntity!;
//         loggedInUserEntity.encryptPassword =
//             (state.logInEntity?.password ?? "");
//         SubmitLogInEntity? submitLogInEntity = r.copyWith(
//             loggedInUserEntity: loggedInUserEntity);
//         return emit(state.copyWith(
//             requestState: RequestState.LOADED,
//             logInSuccessfully: true,
//             submitLogInEntity: submitLogInEntity,
//             errorMessage: ""));
//       } else {
//         return emit(state.copyWith(
//             requestState: RequestState.ERROR, errorMessage: r.message));
//       }
//     } else {
//       return emit(state.copyWith(
//           requestState: RequestState.ERROR,
//           errorMessage: "Something went wrong"));
//     }
//   });
// }
}
