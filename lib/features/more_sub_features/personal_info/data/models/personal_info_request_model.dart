import 'package:saayer/features/more_sub_features/personal_info/domain/entities/personal_info_entity.dart';

class PersonalInfoRequestModel {
  final PersonalInfoEntity personalInfoEntity;

  const PersonalInfoRequestModel({
    required this.personalInfoEntity,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["name"] = personalInfoEntity.name;
    map["phone"] = personalInfoEntity.phone;
    map["email"] = personalInfoEntity.email;
    map["businessName"] = personalInfoEntity.businessName;
    return map;
  }
}
