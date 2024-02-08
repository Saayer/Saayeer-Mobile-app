part of 'more_bloc.dart';

class MoreState extends Equatable {
  final StateHelper stateHelper;
  final bool isRefreshed;

  const MoreState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.isRefreshed = false});

  MoreState copyWith({StateHelper? stateHelper, bool? isRefreshed}) {
    return MoreState(
        stateHelper: stateHelper ?? this.stateHelper, isRefreshed: false);
  }

  @override
  List<Object> get props => [stateHelper, isRefreshed];
}
