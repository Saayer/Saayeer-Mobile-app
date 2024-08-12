part of 'stores_list_bloc.dart';

@immutable
class StoresListState extends Equatable {
  final StateHelper stateHelper;
  final List<StoreGetDto>? storesList;

  const StoresListState({this.stateHelper = const StateHelper(requestState: RequestState.LOADED), this.storesList});

  StoresListState copyWith({
    StateHelper? stateHelper,
    List<StoreGetDto>? storesList}) {
    return StoresListState(
        stateHelper: stateHelper ?? this.stateHelper,
        storesList: storesList ?? this.storesList);
  }

  @override
  List<Object?> get props => [stateHelper, storesList];
}
