part of 'why_saayer_bloc.dart';

@immutable
class WhySaayerState extends Equatable {
  final StateHelper stateHelper;

  const WhySaayerState(
      {this.stateHelper =
          const StateHelper(requestState: RequestState.LOADING)});

  WhySaayerState copyWith({
    StateHelper? stateHelper,
  }) {
    return WhySaayerState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object?> get props => [stateHelper];
}
