part of 'bills_bloc.dart';

@immutable
class BillsState extends Equatable {
  final StateHelper stateHelper;

  const BillsState(
      {this.stateHelper =
          const StateHelper(requestState: RequestState.LOADING)});

  BillsState copyWith({
    StateHelper? stateHelper,
  }) {
    return BillsState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object?> get props => [stateHelper];
}
