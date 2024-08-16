part of 'more_bloc.dart';

@immutable
class MoreState extends Equatable {
  final StateHelper stateHelper;
  final bool isRefreshed, isLoggedOut;

  const MoreState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.isRefreshed = false,
      this.isLoggedOut = false});

  MoreState copyWith(
      {StateHelper? stateHelper, bool? isRefreshed, bool? isLoggedOut}) {
    return MoreState(
        stateHelper: stateHelper ?? this.stateHelper,
        isRefreshed: false,
        isLoggedOut: isLoggedOut ?? false);
  }

  @override
  List<Object> get props => [stateHelper, isRefreshed, isLoggedOut];
}
