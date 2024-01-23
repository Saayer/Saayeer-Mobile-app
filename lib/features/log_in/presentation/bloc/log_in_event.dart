part of 'log_in_bloc.dart';

@immutable
abstract class LogInEvent extends Equatable {
  const LogInEvent();
}

class TogglePassword extends LogInEvent {
  @override
  List<Object?> get props => [];
}

class OnTextChange extends LogInEvent {
  final TextEditingController? textEditingController;
  final String? str;

  OnTextChange({this.textEditingController, this.str});

  @override
  List<Object?> get props => [textEditingController, str];
}

class LogIn extends LogInEvent{
  @override
  List<Object?> get props => [];
}
