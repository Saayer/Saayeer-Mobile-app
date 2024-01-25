import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LogInEntity extends Equatable {
  final PhoneNumber phoneNumber;

  const LogInEntity({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];

  LogInEntity copyWith({
    PhoneNumber? phoneNumber,
  }) {
    return LogInEntity(
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
