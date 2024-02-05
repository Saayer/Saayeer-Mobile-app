import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PersonalInfoEntity extends Equatable {
  final PhoneNumber phoneNumber;

  const PersonalInfoEntity({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];

  PersonalInfoEntity copyWith({
    PhoneNumber? phoneNumber,
  }) {
    return PersonalInfoEntity(
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
