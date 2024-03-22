import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';

class SubmitAddressInfoRequestModel {
  final AddressInfoEntity addressInfoEntity;

  const SubmitAddressInfoRequestModel({
    required this.addressInfoEntity,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map["districtId"] = addressInfoEntity.district;
    map["cityId"] = int.tryParse(addressInfoEntity.city) ?? 1;
    map["countryId"] = 1;
    map["fullName"] = addressInfoEntity.name;
    map["address"] = addressInfoEntity.address;
    map["mobile"] = addressInfoEntity.mobile;
    map["email"] = addressInfoEntity.email;
    return map;
  }
}
