part of 'info_bloc.dart';

@immutable
class InfoState extends Equatable {
  final StateHelper stateHelper;
  final InfoEntity? infoEntity;

  const InfoState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
      this.infoEntity});

  InfoState copyWith({
    StateHelper? stateHelper,
    InfoEntity? infoEntity
  }) {
    return InfoState(
      stateHelper: stateHelper ?? this.stateHelper,
      infoEntity: infoEntity ?? this.infoEntity,
    );
  }

  @override
  List<Object?> get props => [stateHelper, infoEntity];
}
