part of 'home_bloc.dart';

class HomeState extends Equatable {
  final StateHelper stateHelper;

  const HomeState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
  });

  HomeState copyWith({
    StateHelper? stateHelper,
  }) {
    return HomeState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object> get props => [stateHelper];
}
