import 'package:equatable/equatable.dart';

class AddressShipmenEntity extends Equatable {
  final String mobileNumber, fullName, address, district, cityName;

  const AddressShipmenEntity({
    required this.mobileNumber,
    required this.fullName,
    required this.address,
    required this.district,
    required this.cityName,
  });

  AddressShipmenEntity copyWith({
    String? mobileNumber,
    String? fullName,
    String? address,
    String? district,
    String? cityName,
  }) {
    return AddressShipmenEntity(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      fullName: fullName ?? this.fullName,
      cityName: cityName ?? this.cityName,
      address: address ?? this.address,
      district: district ?? this.district,
    );
  }

  @override
  List<Object> get props => [
        mobileNumber,
        fullName,
        cityName,
        address,
        district,
      ];
}
