import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/business_info_entity.dart';

class BusinessInfoRequestModel {
  final BusinessInfoEntity businessInfoEntity;

  const BusinessInfoRequestModel({
    required this.businessInfoEntity,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map["name"] = businessInfoEntity.name;
    // map["email"] = businessInfoEntity.email;
    // map["nationalId"] = businessInfoEntity.nationalId;
    // map["address"] = businessInfoEntity.address;
    // map["district"] = businessInfoEntity.district;
    // map["governorate"] = businessInfoEntity.governorate;
    return map;
  }
}
