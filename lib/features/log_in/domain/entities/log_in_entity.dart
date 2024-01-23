import 'package:equatable/equatable.dart';

class LogInEntity extends Equatable {
  final String? email, password;

  LogInEntity({this.email, this.password});

  @override
  List<Object?> get props => [email, password];

  LogInEntity copyWith({
    String? email,
    String? password,
  }) {
    return LogInEntity(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
