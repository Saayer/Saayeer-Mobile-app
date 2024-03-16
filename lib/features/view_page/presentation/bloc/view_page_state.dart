part of 'view_page_bloc.dart';

@immutable
class ViewPageState extends Equatable {
  final StateHelper stateHelper;
  final bool? isGuest;

  const ViewPageState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
      this.isGuest});

  ViewPageState copyWith({
    StateHelper? stateHelper,
    bool? isGuest,
  }) {
    return ViewPageState(
      stateHelper: stateHelper ?? this.stateHelper,
      isGuest: isGuest ?? this.isGuest,
    );
  }

  @override
  List<Object?> get props => [stateHelper, isGuest];
}
