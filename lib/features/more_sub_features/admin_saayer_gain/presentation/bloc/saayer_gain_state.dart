part of 'saayer_gain_bloc.dart';

@immutable
class SaayerGainState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final int? saayerGainPercentage;

  const SaayerGainState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.autoValidateMode = AutovalidateMode.disabled,
    this.saayerGainPercentage,
  });

  SaayerGainState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    int? saayerGainPercentage,
  }) {
    return SaayerGainState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      saayerGainPercentage: saayerGainPercentage,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        saayerGainPercentage,
      ];
}
