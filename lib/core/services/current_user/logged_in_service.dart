import 'package:injectable/injectable.dart';
import 'package:saayer/core/entities/logged_in_user_entity.dart';
import 'package:saayer/core/services/current_user/current_user_enums.dart';

@Singleton()
class LoggedInService {
  LoggedInUserEntity? _loggedInUserEntity;

  void setLoggedInUserEntity(LoggedInUserEntity? loggedInUserEntity) {
    _loggedInUserEntity = loggedInUserEntity;
  }

  LoggedInUserEntity? getLoggedInUserEntity() {
    return _loggedInUserEntity;
  }
}
