part of 'reports_bloc.dart';

@immutable
class ReportsState extends Equatable {
  final StateHelper stateHelper;

  const ReportsState(
      {this.stateHelper =
          const StateHelper(requestState: RequestState.LOADING)});

  ReportsState copyWith({
    StateHelper? stateHelper,
  }) {
    return ReportsState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object?> get props => [stateHelper];
}
