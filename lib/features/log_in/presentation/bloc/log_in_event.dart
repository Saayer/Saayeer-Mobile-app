part of 'log_in_bloc.dart';

@immutable
abstract class LogInEvent extends Equatable {
  const LogInEvent();
}

class OnTextChange extends LogInEvent {
  final TextEditingController? textEditingController;
  final String? str;
  final PhoneNumber? phoneNumber;
  final LogInFieldsTypes logInFieldsType;

  const OnTextChange(
      {this.textEditingController,
      this.str,
      required this.logInFieldsType,
      this.phoneNumber})
      : assert(logInFieldsType == LogInFieldsTypes.PHONE_NUMBER
            ? phoneNumber != null
            : phoneNumber == null);

  @override
  List<Object?> get props => [textEditingController, str, logInFieldsType];
}
