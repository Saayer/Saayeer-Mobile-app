import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class SharedPrefService {
  late SharedPreferences _preferences;

  initPref() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// saving data to sharedpreference

  /// fetching data from sharedpreference

  /// clear data from sharedpreference
  clearSharedPref() async {
    final AdaptiveThemeMode? savedThemeMode =
        await AdaptiveTheme.getThemeMode();
    await _preferences.clear();
    AdaptiveTheme.of(
            getIt<NavigationService>().mainNavigatorKey.currentContext!)
        .setThemeMode(savedThemeMode ?? SaayerTheme.defaultThemeMode);
  }
}
