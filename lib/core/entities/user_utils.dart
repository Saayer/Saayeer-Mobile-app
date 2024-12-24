import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';

class UserUtils {
  ///
  static bool isAdmin() => getIt<SharedPrefService>().getUserRole() == Constants.superAdmin;
}
