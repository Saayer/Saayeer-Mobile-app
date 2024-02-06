import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class BusinessInfoEntity extends Equatable {
  final String? companyName,
      email,
      mobileNumber,
      commercialRegistrationNo,
      shortAddress,
      district,
      governorate;

  const BusinessInfoEntity({
    this.companyName,
    this.email,
    this.mobileNumber,
    this.commercialRegistrationNo,
    this.shortAddress,
    this.district,
    this.governorate,
  });

  BusinessInfoEntity copyWith({
    String? companyName,
    String? email,
    String? mobileNumber,
    String? commercialRegistrationNo,
    String? shortAddress,
    String? district,
    String? governorate,
  }) {
    return BusinessInfoEntity(
      companyName: companyName ?? this.companyName,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      commercialRegistrationNo:
          commercialRegistrationNo ?? this.commercialRegistrationNo,
      shortAddress: shortAddress ?? this.shortAddress,
      district: district ?? this.district,
      governorate: governorate ?? this.governorate,
    );
  }

  @override
  List<Object?> get props => [
        companyName,
        email,
        mobileNumber,
        commercialRegistrationNo,
        shortAddress,
        district,
        governorate
      ];
}
