part of 'personal_info_bloc.dart';

abstract class PersonalInfoEvent extends Equatable {
  const PersonalInfoEvent();
}

class OnTextChange extends PersonalInfoEvent {
  final TextEditingController? textEditingController;
  final String? str;
  final PersonalInfoFieldsTypes personalInfoFieldsType;

  const OnTextChange({
    this.textEditingController,
    this.str,
    required this.personalInfoFieldsType,
  });

  @override
  List<Object?> get props =>
      [textEditingController, str, personalInfoFieldsType];
}

class SubmitPersonalInfoData extends PersonalInfoEvent {
  @override
  List<Object?> get props => [];
}
