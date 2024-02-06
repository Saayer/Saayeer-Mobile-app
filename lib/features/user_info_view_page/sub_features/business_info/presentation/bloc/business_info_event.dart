part of 'business_info_bloc.dart';

abstract class BusinessInfoEvent extends Equatable {
  const BusinessInfoEvent();
}

class OnTextChange extends BusinessInfoEvent {
  final TextEditingController? textEditingController;
  final String? str;
  final PhoneNumber? phoneNumber;
  final BusinessInfoFieldsTypes businessInfoFieldsType;

  const OnTextChange(
      {this.textEditingController,
      this.str,
      required this.businessInfoFieldsType,
      this.phoneNumber})
      : assert(businessInfoFieldsType == BusinessInfoFieldsTypes.MOBILE_NUMBER
            ? phoneNumber != null
            : phoneNumber == null);

  @override
  List<Object?> get props =>
      [textEditingController, str, businessInfoFieldsType];
}

class SubmitBusinessInfoData extends BusinessInfoEvent {
  @override
  List<Object?> get props => [];
}

class ToggleAutoValidate extends BusinessInfoEvent {
  @override
  List<Object?> get props => [];
}

class SubmitBusinessInfo extends BusinessInfoEvent {
  @override
  List<Object?> get props => [];
}
