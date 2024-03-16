import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AddressInfoEntity extends Equatable {
  final String name, email, mobile, address, district, city, country;

  const AddressInfoEntity({
    required this.name,
    required this.email,
    required this.mobile,
    required this.address,
    required this.district,
    required this.city,
    required this.country,
  });

  AddressInfoEntity copyWith({
    String? name,
    String? email,
    String? mobile,
    String? address,
    String? district,
    String? city,
    String? country,
  }) {
    return AddressInfoEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      address: address ?? this.address,
      district: district ?? this.district,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  @override
  List<Object> get props =>
      [name, email, mobile, address, district, city, country];
}
