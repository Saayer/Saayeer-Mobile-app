import 'package:saayer/features/home/data/models/get_user_profile_model.dart';

abstract class HomeRDS {
  Future<GetUserProfileModel> getUserProfile();
}
