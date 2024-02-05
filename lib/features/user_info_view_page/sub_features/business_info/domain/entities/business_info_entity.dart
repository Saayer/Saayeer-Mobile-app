import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class BusinessInfoEntity extends Equatable {
  final PhoneNumber phoneNumber;

  const BusinessInfoEntity({
    required this.phoneNumber,
  });

  BusinessInfoEntity copyWith({
    PhoneNumber? phoneNumber,
  }) {
    return BusinessInfoEntity(
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object> get props => [phoneNumber];
}
