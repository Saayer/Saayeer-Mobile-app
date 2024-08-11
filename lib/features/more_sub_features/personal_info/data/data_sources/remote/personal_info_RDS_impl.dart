import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/end_points/account/user_info_end_points.dart';
import 'package:saayer/features/more_sub_features/personal_info/data/data_sources/remote/personal_info_RDS.dart';
import 'package:saayer/features/more_sub_features/personal_info/data/models/personal_info_request_model.dart';
import 'package:saayer/features/more_sub_features/personal_info/data/models/personal_info_response_model.dart';
import 'package:saayer/features/more_sub_features/personal_info/domain/entities/personal_info_entity.dart';

@Injectable(as: PersonalInfoRDS)
class PersonalInfoRDSImpl implements PersonalInfoRDS {
  final ApiConsumer apiConsumer;

  PersonalInfoRDSImpl({required this.apiConsumer});

  @override
  Future<PersonalInfoResponseModel> submitPersonalInfo(
      PersonalInfoEntity personalInfoEntity) async {
    final PersonalInfoRequestModel personalInfoRequestModel =
        PersonalInfoRequestModel(personalInfoEntity: personalInfoEntity);
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.post(UserInfoEndPoints.updatePersonalInfo,
          body: personalInfoRequestModel.toJson()),
    );
    final PersonalInfoResponseModel personalInfoResponseModel =
        PersonalInfoResponseModel.fromJson(result);
    return personalInfoResponseModel;
  }
}
