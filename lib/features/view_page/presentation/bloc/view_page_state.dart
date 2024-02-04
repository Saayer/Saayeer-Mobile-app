part of 'view_page_bloc.dart';

@immutable
class ViewPageState extends Equatable {
  final StateHelper stateHelper;

  const ViewPageState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
  });

  ViewPageState copyWith({
    StateHelper? stateHelper,
  }) {
    return ViewPageState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object> get props => [stateHelper];
}
