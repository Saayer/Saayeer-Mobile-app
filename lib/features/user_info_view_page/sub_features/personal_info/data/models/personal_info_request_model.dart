import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/entities/personal_info_entity.dart';

class PersonalInfoRequestModel {
  final PersonalInfoEntity personalInfoEntity;

  const PersonalInfoRequestModel({
    required this.personalInfoEntity,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["name"] = personalInfoEntity.name;
    map["email"] = personalInfoEntity.email;
    map["nationalId"] = personalInfoEntity.nationalId;
    map["address"] = personalInfoEntity.address;
    map["district"] = personalInfoEntity.district;
    map["city"] = personalInfoEntity.governorate;
    return map;
  }
}
