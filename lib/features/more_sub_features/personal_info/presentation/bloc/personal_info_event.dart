part of 'personal_info_bloc.dart';

abstract class PersonalInfoEvent extends Equatable {
  const PersonalInfoEvent();
}

class OnTextChange extends PersonalInfoEvent {
  final TextEditingController? textEditingController;
  final String? str;
  final PhoneNumber? phoneNumber;
  final PersonalInfoFieldsTypes personalInfoFieldsType;

  const OnTextChange({
    this.textEditingController,
    this.str,
    this.phoneNumber,
    required this.personalInfoFieldsType,
  });

  @override
  List<Object?> get props => [textEditingController, str,phoneNumber, personalInfoFieldsType];
}

class GetClientInfo extends PersonalInfoEvent {
  const GetClientInfo();

  @override
  List<Object?> get props => [];
}

class EditClientData extends PersonalInfoEvent {

  const EditClientData();

  @override
  List<Object?> get props => [];
}

class ToggleAutoValidate extends PersonalInfoEvent {
  @override
  List<Object?> get props => [];
}

class SubmitPersonalInfo extends PersonalInfoEvent {
  @override
  List<Object?> get props => [];
}
