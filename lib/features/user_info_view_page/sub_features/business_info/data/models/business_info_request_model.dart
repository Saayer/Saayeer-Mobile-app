import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/business_info_entity.dart';

class BusinessInfoRequestModel {
  final BusinessInfoEntity businessInfoEntity;

  const BusinessInfoRequestModel({
    required this.businessInfoEntity,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["companyName"] = businessInfoEntity.companyName;
    map["email"] = businessInfoEntity.email;
    map["mobileNumber"] = businessInfoEntity.mobileNumber;
    map["commercialRegistrationNo"] =
        businessInfoEntity.commercialRegistrationNo;
    map["shortAddress"] = businessInfoEntity.shortAddress;
    map["district"] = businessInfoEntity.district;
    map["governorate"] = businessInfoEntity.governorate;
    return map;
  }
}
