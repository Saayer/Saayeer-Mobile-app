import 'package:saayer/features/add_address/domain/entities/address_info_entity.dart';

class AddressInfoRequestModel {
  final AddressInfoEntity addressInfoEntity;

  const AddressInfoRequestModel({
    required this.addressInfoEntity,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["districtId"] = addressInfoEntity.district;
    map["cityId"] = addressInfoEntity.city;
    map["countryId"] = addressInfoEntity.country;
    map["fullName"] = addressInfoEntity.name;
    map["address"] = addressInfoEntity.address;
    map["mobile"] = addressInfoEntity.mobile;
    map["email"] = addressInfoEntity.email;
    return map;
  }
}
