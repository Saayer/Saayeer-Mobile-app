part of 'personal_info_bloc.dart';

@immutable
class PersonalInfoState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final PersonalInfoEntity? personalInfoEntity;
  final SubmitPersonalInfoEntity? submitPersonalInfoEntity;

  const PersonalInfoState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.autoValidateMode = AutovalidateMode.disabled,
      this.personalInfoEntity,
      this.submitPersonalInfoEntity});

  PersonalInfoState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    PersonalInfoEntity? personalInfoEntity,
    SubmitPersonalInfoEntity? submitPersonalInfoEntity,
  }) {
    return PersonalInfoState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      personalInfoEntity: personalInfoEntity ?? this.personalInfoEntity,
      submitPersonalInfoEntity:
          submitPersonalInfoEntity ?? this.submitPersonalInfoEntity,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        personalInfoEntity,
        submitPersonalInfoEntity,
      ];
}
