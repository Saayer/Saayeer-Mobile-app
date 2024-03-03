import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/end_points/profile/profile_end_points.dart';
import 'package:saayer/features/view_page/sub_features/home/data/data_sources/remote/home_RDS.dart';
import 'package:saayer/features/view_page/sub_features/home/data/models/get_user_profile_model.dart';

@Injectable(as: HomeRDS)
class HomeRDSImpl implements HomeRDS {
  final ApiConsumer apiConsumer;

  HomeRDSImpl({required this.apiConsumer});

  @override
  Future<GetUserProfileModel> getUserProfile() async {
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.get(ProfileEndPoints.getUserProfile),
    );
    final GetUserProfileModel getUserProfileModel =
        GetUserProfileModel.fromJson(result);
    return getUserProfileModel;
  }
}
