import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class SharedPrefService {
  late SharedPreferences _preferences;

  static const String _userLoggedInKey = "ISLOGGEDIN";
  static const String _userNameKey = "USERNAMEKEY";
  static const String _userEmailKey = "USEREMAILKEY";
  static const String _imageKey = "Image";
  static const String _userIdKey = "id";
  static const String _currentUserKey = "currentUser";
  static const String _isSeenIntroKey = "isSeenIntro";

  initPref() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// saving data to sharedpreference
  Future<bool> saveUserLoggedIn(bool isUserLoggedIn) async {
    return await _preferences.setBool(_userLoggedInKey, isUserLoggedIn);
  }

  Future<bool> saveCurrentUser(String currentUserDoc) async {
    return await _preferences.setString(_currentUserKey, currentUserDoc);
  }

  Future<bool> saveIsSeenIntro() async {
    return await _preferences.setBool(_isSeenIntroKey, true);
  }

  /// fetching data from sharedpreference

  bool getUserLoggedIn() => _preferences.getBool(_userLoggedInKey) ?? false;

  bool getIsSeenIntro() => _preferences.getBool(_isSeenIntroKey) ?? false;

  String getCurrentUser() => _preferences.getString(_currentUserKey).toString();

  /// clear data from sharedpreference
  clearSharedPref() => _preferences.clear();
}
