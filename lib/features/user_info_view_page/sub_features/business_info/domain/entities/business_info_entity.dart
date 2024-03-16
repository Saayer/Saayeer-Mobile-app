import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class BusinessInfoEntity extends Equatable {
  final String companyName,
      email,
      mobileNumber,
      commercialRegistrationNo,
      shortAddress,
      district,
      governorate;


  const BusinessInfoEntity({
    required this.companyName,
    required this.email,
    required this.mobileNumber,
    required this.commercialRegistrationNo,
    required this.shortAddress,
    required this.district,
    required this.governorate,
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

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'email': email,
      'mobileNumber': mobileNumber,
      'commercialRegistrationNo': commercialRegistrationNo,
      'shortAddress': shortAddress,
      'district': district,
      'governorate': governorate,
    };
  }

  factory BusinessInfoEntity.fromJson(Map<String, dynamic> map) {
    return BusinessInfoEntity(
      companyName: map['companyName'] as String,
      email: map['email'] as String,
      mobileNumber: map['mobileNumber'] as String,
      commercialRegistrationNo: map['commercialRegistrationNo'] as String,
      shortAddress: map['shortAddress'] as String,
      district: map['district'] as String,
      governorate: map['governorate'] as String,
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
