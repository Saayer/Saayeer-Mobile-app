import 'package:saayer/features/more_sub_features/personal_info/data/models/personal_info_response_model.dart';
import 'package:saayer/features/more_sub_features/personal_info/domain/entities/personal_info_entity.dart';

abstract class PersonalInfoRDS {
  Future<PersonalInfoResponseModel> submitPersonalInfo(PersonalInfoEntity personalInfoEntity);
}
