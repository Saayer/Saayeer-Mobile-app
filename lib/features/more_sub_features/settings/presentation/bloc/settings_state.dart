part of 'settings_bloc.dart';

@immutable
class SettingsState extends Equatable {
  final StateHelper stateHelper;

  const SettingsState(
      {this.stateHelper =
          const StateHelper(requestState: RequestState.LOADING)});

  SettingsState copyWith({
    StateHelper? stateHelper,
  }) {
    return SettingsState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object?> get props => [stateHelper];
}
