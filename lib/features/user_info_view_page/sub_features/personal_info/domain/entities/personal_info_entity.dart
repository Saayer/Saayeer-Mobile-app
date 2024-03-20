import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PersonalInfoEntity extends Equatable {
  final String name, email, nationalId, address, district, governorate;

  const PersonalInfoEntity({
    required this.name,
    required this.email,
    required this.nationalId,
    required this.address,
    required this.district,
    required this.governorate,
  });

  PersonalInfoEntity copyWith({
    String? name,
    String? email,
    String? nationalId,
    String? address,
    String? district,
    String? governorate,
  }) {
    return PersonalInfoEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      nationalId: nationalId ?? this.nationalId,
      address: address ?? this.address,
      district: district ?? this.district,
      governorate: governorate ?? this.governorate,
    );
  }

  @override
  List<Object> get props =>
      [name, email, nationalId, address, district, governorate];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'nationalId': nationalId,
      'address': address,
      'district': district,
      'governorate': governorate,
    };
  }

  factory PersonalInfoEntity.fromJson(Map<String, dynamic> map) {
    return PersonalInfoEntity(
      name: (map['name'] ?? "") as String,
      email: (map['email'] ?? "") as String,
      nationalId: (map['nationalId'] ?? "") as String,
      address: (map['address'] ?? "") as String,
      district: (map['district'] ?? "") as String,
      governorate: (map['governorate'] ?? "") as String,
    );
  }
}
