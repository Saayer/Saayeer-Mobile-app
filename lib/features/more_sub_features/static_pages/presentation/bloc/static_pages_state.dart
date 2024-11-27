part of 'static_pages_bloc.dart';

@immutable
class StaticPagesState extends Equatable{
  final StateHelper stateHelper;

  const StaticPagesState(
      {this.stateHelper =
      const StateHelper(requestState: RequestState.LOADING)});

  StaticPagesState copyWith({
    StateHelper? stateHelper,
  }) {
    return StaticPagesState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object> get props => [stateHelper];

}