part of 'log_in_bloc.dart';

@immutable
class LogInState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final LogInEntity? logInEntity;

  const LogInState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.autoValidateMode = AutovalidateMode.disabled,
    this.logInEntity,
  });

  LogInState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    LogInEntity? logInEntity,
  }) {
    return LogInState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      logInEntity: logInEntity ?? this.logInEntity,
    );
  }

  @override
  List<Object?> get props => [stateHelper, autoValidateMode, logInEntity];
}
