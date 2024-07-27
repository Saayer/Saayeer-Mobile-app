import 'package:equatable/equatable.dart';

class AddressInfoEntity extends Equatable {
  final String name, email, mobile, alternativeMobile, address, district, city, country, zipCode;

  const AddressInfoEntity({
    required this.name,
    required this.email,
    required this.mobile,
    required this.alternativeMobile,
    required this.address,
    required this.district,
    required this.city,
    required this.country,
    required this.zipCode,
  });

  AddressInfoEntity copyWith({
    String? name,
    String? email,
    String? mobile,
    String? alternativeMobile,
    String? address,
    String? district,
    String? city,
    String? country,
    String? zipCode,
  }) {
    return AddressInfoEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      alternativeMobile: alternativeMobile ?? this.alternativeMobile,
      address: address ?? this.address,
      district: district ?? this.district,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  @override
  List<Object> get props => [name, email, mobile, alternativeMobile, address, district, city, country, zipCode];
}
