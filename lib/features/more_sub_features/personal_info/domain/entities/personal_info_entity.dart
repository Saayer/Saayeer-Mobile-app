import 'package:equatable/equatable.dart';

class PersonalInfoEntity extends Equatable {
  final String name, phone, email, businessName;

  const PersonalInfoEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.businessName,
  });

  PersonalInfoEntity copyWith({
    String? name,
    String? phone,
    String? email,
    String? businessName,
  }) {
    return PersonalInfoEntity(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      businessName: businessName ?? this.businessName,
    );
  }

  @override
  List<Object> get props =>
      [name, email, businessName, phone];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'businessName': businessName,
    };
  }

  factory PersonalInfoEntity.fromJson(Map<String, dynamic> map) {
    return PersonalInfoEntity(
      name: (map['name'] ?? "") as String,
      phone: (map['phone'] ?? "") as String,
      email: (map['email'] ?? "") as String,
      businessName: (map['businessName'] ?? "") as String,
    );
  }
}
