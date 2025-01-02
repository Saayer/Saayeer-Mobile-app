part of 'saayer_gain_bloc.dart';

@immutable
class SaayerGainState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final bool isRefreshed, isLoggedOut;
  final int? saayerGainPercentage;

  const SaayerGainState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.autoValidateMode = AutovalidateMode.disabled,
    this.isRefreshed = false,
    this.isLoggedOut = false,
    this.saayerGainPercentage,
  });

  SaayerGainState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    bool? isRefreshed,
    bool? isLoggedOut,
    int? saayerGainPercentage,
  }) {
    return SaayerGainState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      isRefreshed: false,
      isLoggedOut: isLoggedOut ?? false,
      saayerGainPercentage: saayerGainPercentage,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        isRefreshed,
        isLoggedOut,
        saayerGainPercentage,
      ];
}
