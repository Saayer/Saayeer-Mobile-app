part of 'personal_info_bloc.dart';

@immutable
class PersonalInfoState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final ClientAddDto? clientEditRequest;
  final ClientGetDto? clientGetDto;

  const PersonalInfoState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.autoValidateMode = AutovalidateMode.disabled,
      this.clientEditRequest,
      this.clientGetDto});

  PersonalInfoState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    ClientAddDto? clientEditRequest,
    ClientGetDto? clientGetDto,
  }) {
    return PersonalInfoState(
        stateHelper: stateHelper ?? this.stateHelper,
        autoValidateMode: autoValidateMode ?? this.autoValidateMode,
        clientEditRequest: clientEditRequest ?? this.clientEditRequest,
        clientGetDto: clientGetDto ?? this.clientGetDto);
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        clientEditRequest,
        clientGetDto,
      ];
}
