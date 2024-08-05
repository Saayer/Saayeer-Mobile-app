part of 'log_in_bloc.dart';

@immutable
class LogInState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final LoginRequestDto? loginRequestDto;
  final LoginResponseDto? responseLogInEntity;

  const LogInState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.autoValidateMode = AutovalidateMode.disabled,
      this.loginRequestDto,
      this.responseLogInEntity});

  LogInState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    LoginRequestDto? loginRequestDto,
    LoginResponseDto? submitLogInEntity,
  }) {
    return LogInState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      loginRequestDto: loginRequestDto ?? this.loginRequestDto,
      responseLogInEntity: submitLogInEntity ?? this.responseLogInEntity,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        loginRequestDto,
        responseLogInEntity,
      ];
}
