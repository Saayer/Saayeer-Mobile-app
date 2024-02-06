part of 'store_info_bloc.dart';

class StoreInfoState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final StoreInfoEntity? storeInfoEntity;
  final SubmitStoreInfoEntity? submitStoreInfoEntity;

  const StoreInfoState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.autoValidateMode = AutovalidateMode.disabled,
      this.storeInfoEntity,
      this.submitStoreInfoEntity});

  StoreInfoState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    StoreInfoEntity? storeInfoEntity,
    SubmitStoreInfoEntity? submitStoreInfoEntity,
  }) {
    return StoreInfoState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      storeInfoEntity: storeInfoEntity ?? this.storeInfoEntity,
      submitStoreInfoEntity:
          submitStoreInfoEntity ?? this.submitStoreInfoEntity,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        storeInfoEntity,
        submitStoreInfoEntity,
      ];
}
