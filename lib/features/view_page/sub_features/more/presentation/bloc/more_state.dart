part of 'more_bloc.dart';

class MoreState extends Equatable {
  final StateHelper stateHelper;

  const MoreState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
  });

  MoreState copyWith({
    StateHelper? stateHelper,
  }) {
    return MoreState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object> get props => [stateHelper];
}