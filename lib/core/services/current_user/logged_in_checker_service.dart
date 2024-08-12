import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/services/current_user/current_user_enums.dart';
import 'package:saayer/core/services/current_user/logged_in_service.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/core/entities/logged_in_user_entity.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';

@Injectable()
class LoggedInCheckerService {
  bool isLoggedIn() {
    final bool? isLoggedIn = getIt<SharedPrefService>().getIsLoggedIn();
    return isLoggedIn ?? false;
  }

  void initLoggedUser() async {
    final LoggedInUserEntity? loggedInUserEntity =
        await SecureStorageService().getLoggedInUser();
    getIt<LoggedInService>().setLoggedInUserEntity(loggedInUserEntity!);
  }

  CurrentUserTypes getCurrentUserType() {
    final bool isLoggedUser = isLoggedIn();
    log("$isLoggedUser",name:"getCurrentUserType");
    if (isLoggedUser) {
      return CurrentUserTypes.LOGGED_IN;
    }
    return CurrentUserTypes.GUEST;
  }

  void logOut()  {
    getIt<SharedPrefService>().clearSharedPref();
    //await SecureStorageService().clearStorage();
    getIt<LoggedInService>().setLoggedInUserEntity(null);
  }
}
