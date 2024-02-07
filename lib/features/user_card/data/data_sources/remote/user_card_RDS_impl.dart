import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/end_points/account/user_profile_end_points.dart';
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS.dart';
import 'package:saayer/features/user_card/data/models/user_card_response_model.dart';

@Injectable(as: UserCardRDS)
class UserCardRDSImpl implements UserCardRDS {
  final ApiConsumer apiConsumer;

  UserCardRDSImpl({required this.apiConsumer});

  @override
  Future<UserCardResponseModel> getProfile() async {
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.get(UserProfileEndPoints.getProfile),
    );
    final UserCardResponseModel userCardResponseModel =
        UserCardResponseModel.fromJson(result);
    return userCardResponseModel;
  }
}
