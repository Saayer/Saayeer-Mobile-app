import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/entities/logged_in_user_entity.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/log_in/domain/entities/log_in_entity.dart';
import 'package:saayer/features/log_in/domain/entities/submit_log_in_entity.dart';
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final LogInUseCase logInUseCase;

  LogInBloc({required this.logInUseCase}) : super(LogInState()) {
    on<LogIn>(_logIn);
    on<TogglePassword>(_togglePassword);
    on<OnTextChange>(_onTextChange);
  }

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final LogInEntity logInEntity = LogInEntity();

  FutureOr<void> _onTextChange(OnTextChange event, Emitter<LogInState> emit) {
    emit(state.copyWith(requestState: RequestState.LOADING));
    TextSelection previousSelection = event.textEditingController!.selection;
    event.textEditingController!.text = event.str!;
    event.textEditingController!.selection = previousSelection;
    log("onTextChange ${event.str}", name: "onTextChange");
    emit(state.copyWith(requestState: RequestState.LOADED));
  }

  FutureOr<void> _togglePassword(
      TogglePassword event, Emitter<LogInState> emit) {
    emit(state.copyWith(requestState: RequestState.LOADING));

    emit(state.copyWith(
      requestState: RequestState.LOADED,
      obscurePassword: !state.obscurePassword,
    ));
  }

  Future<FutureOr<void>> _logIn(LogIn event, Emitter<LogInState> emit) async {
    emit(state.copyWith(requestState: RequestState.LOADING));
    final FormState formState = formKey.currentState!;
    if (!formState.validate()) {
      emit(state.copyWith(
          requestState: RequestState.ERROR,
          errorMessage: "Please, fill out all the fields in the right way",
          autoValidateMode: AutovalidateMode.always));
    } else {
      formState.save();
      emit(state.copyWith(
          requestState: RequestState.LOADED,
          logInEntity: logInEntity.copyWith(
            email: emailController.text,
            password: passwordController.text,
          )));
      log("${state.logInEntity!.email}", name: "Log In");
      await _submit(emit);
    }
  }

  Future _submit(Emitter<LogInState> emit) async {
    emit(state.copyWith(
      requestState: RequestState.LOADING,
    ));

    final result = await logInUseCase(LogInParameters(state.logInEntity!));

    result.fold((l) {
      log("left logIn $l");
      return emit(state.copyWith(
          requestState: RequestState.ERROR, errorMessage: l.failureMessage));
    }, (r) async {
      if (r != null) {
        log("right logIn $r");
        if (r.isSuccess ?? false) {
          LoggedInUserEntity loggedInUserEntity = r.loggedInUserEntity!;
          loggedInUserEntity.encryptPassword =
              (state.logInEntity?.password ?? "");
          SubmitLogInEntity? submitLogInEntity = r.copyWith(
              loggedInUserEntity: loggedInUserEntity);
          return emit(state.copyWith(
              requestState: RequestState.LOADED,
              logInSuccessfully: true,
              submitLogInEntity: submitLogInEntity,
              errorMessage: ""));
        } else {
          return emit(state.copyWith(
              requestState: RequestState.ERROR, errorMessage: r.message));
        }
      } else {
        return emit(state.copyWith(
            requestState: RequestState.ERROR,
            errorMessage: "Something went wrong"));
      }
    });
  }
}
