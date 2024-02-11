part of 'business_info_bloc.dart';

@immutable
class BusinessInfoState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final BusinessInfoEntity? businessInfoEntity;
  final SubmitBusinessInfoEntity? submitBusinessInfoEntity;

  const BusinessInfoState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.autoValidateMode = AutovalidateMode.disabled,
      this.businessInfoEntity,
      this.submitBusinessInfoEntity});

  BusinessInfoState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    BusinessInfoEntity? businessInfoEntity,
    SubmitBusinessInfoEntity? submitBusinessInfoEntity,
  }) {
    return BusinessInfoState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      businessInfoEntity: businessInfoEntity ?? this.businessInfoEntity,
      submitBusinessInfoEntity:
          submitBusinessInfoEntity ?? this.submitBusinessInfoEntity,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        businessInfoEntity,
        submitBusinessInfoEntity,
      ];
}
