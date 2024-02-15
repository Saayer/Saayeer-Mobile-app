part of 'help_bloc.dart';

@immutable
class HelpState extends Equatable {
  final StateHelper stateHelper;

  const HelpState(
      {this.stateHelper =
          const StateHelper(requestState: RequestState.LOADING)});

  HelpState copyWith({
    StateHelper? stateHelper,
  }) {
    return HelpState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object?> get props => [stateHelper];
}
