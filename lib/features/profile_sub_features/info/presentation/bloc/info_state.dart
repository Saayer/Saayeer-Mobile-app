part of 'info_bloc.dart';

@immutable
class InfoState extends Equatable {
  final StateHelper stateHelper;

  const InfoState(
      {this.stateHelper =
          const StateHelper(requestState: RequestState.LOADING)});

  InfoState copyWith({
    StateHelper? stateHelper,
  }) {
    return InfoState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object?> get props => [stateHelper];
}
