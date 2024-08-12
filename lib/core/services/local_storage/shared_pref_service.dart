import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/services/encryption/encryption.dart';
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

  final String _keyAccessToken = 'AccessToken';
  final String _keyIsLoggedIn = 'IsLoggedIn';

  /// saving data to sharedpreference
  Future setAccessToken(String accessToken) async {
    await _preferences.setString(_keyAccessToken, Encryption().encrypt(accessToken));
  }

  Future setIsLoggedIn(bool isLoggedIn) async {
    await _preferences.setBool(_keyIsLoggedIn, isLoggedIn);
  }

  /// fetching data from sharedpreference
  String? getAccessToken() {
    if (_preferences.containsKey(_keyAccessToken)) {
      final String? accessToken = _preferences.get(_keyAccessToken) as String?;
      final String? accessTokenStr = ((accessToken != null) ? Encryption().decrypt(accessToken.toString()) : null);
      return accessTokenStr;
    } else {
      return null;
    }
  }

  bool? getIsLoggedIn() {
    if (_preferences.containsKey(_keyIsLoggedIn)) {
      final bool? loggedInUserStr = _preferences.get(_keyIsLoggedIn) as bool?;
      final bool isLoggedIn = (loggedInUserStr != null) ? loggedInUserStr : false;
      return isLoggedIn;
    } else {
      return null;
    }
  }

  /// clear data from sharedpreference
  clearSharedPref() async {
    final AdaptiveThemeMode? savedThemeMode = await AdaptiveTheme.getThemeMode();
    await _preferences.clear();
    AdaptiveTheme.of(getIt<NavigationService>().mainNavigatorKey.currentContext!)
        .setThemeMode(savedThemeMode ?? SaayerTheme.defaultThemeMode);
  }
}
