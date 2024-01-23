part of 'log_in_bloc.dart';

@immutable
class LogInState extends Equatable {
  final RequestState requestState;
  final bool logInSuccessfully;
  final String? errorMessage, successMessage;
  final bool obscurePassword;
  final AutovalidateMode autoValidateMode;
  final LogInEntity? logInEntity;
  final SubmitLogInEntity? submitLogInEntity;

  LogInState(
      {this.requestState = RequestState.LOADED,
      this.logInSuccessfully = false,
      this.errorMessage,
      this.successMessage,
      this.obscurePassword = true,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.logInEntity,
      this.submitLogInEntity});

  LogInState copyWith(
      {RequestState? requestState,
      bool? logInSuccessfully,
      String? errorMessage,
      String? successMessage,
      bool? obscurePassword,
      AutovalidateMode? autoValidateMode,
      LogInEntity? logInEntity,
      SubmitLogInEntity? submitLogInEntity}) {
    return LogInState(
        requestState: requestState ?? this.requestState,
        logInSuccessfully: logInSuccessfully ?? this.logInSuccessfully,
        errorMessage: errorMessage ?? this.errorMessage,
        successMessage: successMessage ?? this.successMessage,
        obscurePassword: obscurePassword ?? this.obscurePassword,
        autoValidateMode: autoValidateMode ?? this.autoValidateMode,
        logInEntity: logInEntity ?? this.logInEntity,
        submitLogInEntity: submitLogInEntity ?? this.submitLogInEntity);
  }

  @override
  List<Object?> get props => [
        requestState,
        logInSuccessfully,
        errorMessage,
        successMessage,
        obscurePassword,
        autoValidateMode,
        logInEntity,
        submitLogInEntity
      ];
}
