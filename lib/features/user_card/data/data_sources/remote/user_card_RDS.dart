import 'package:saayer/features/user_card/data/models/user_card_response_model.dart';

abstract class UserCardRDS {
  Future<UserCardResponseModel> getProfile();
}
