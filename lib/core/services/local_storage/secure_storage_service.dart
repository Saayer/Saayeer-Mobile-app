import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/entities/logged_in_user_entity.dart';
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart';
import 'package:saayer/core/services/encryption/encryption.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/intro/presentation/screens/intro_screen.dart';

@Singleton()
class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  final String _keyLoggedInUser = 'loggedInUser';
  final String _keyIsLoggedIn = 'IsLoggedIn';
  final String _keyAccessToken = 'AccessToken';

  Future setIsLoggedIn(bool isLoggedIn) async {
    await _storage.write(key: _keyIsLoggedIn, value: jsonEncode(isLoggedIn));
  }

  Future<bool?> getIsLoggedIn() async {
    final String? loggedInUserStr = await _storage.read(key: _keyIsLoggedIn);
    final bool? isLoggedIn =
        loggedInUserStr != null ? jsonDecode(loggedInUserStr) : false;
    return isLoggedIn;
  }

  Future setLoggedInUser(LoggedInUserEntity loggedInUserEntity) async {
    log("${loggedInUserEntity.toJson()}", name: "setLoggedInUser");
    await _storage.write(
        key: _keyLoggedInUser, value: jsonEncode(loggedInUserEntity.toJson()));
  }

  Future<LoggedInUserEntity?> getLoggedInUser() async {
    try {
      final String? loggedInUserStr =
          await _storage.read(key: _keyLoggedInUser);
      final Map<String, dynamic> loggedInUserMap = jsonDecode(loggedInUserStr!);
      final LoggedInUserEntity loggedInUserEntity =
          LoggedInUserEntity.fromJson(loggedInUserMap);
      return loggedInUserEntity;
    } catch (e) {
      log("$e", name: "getLoggedInUser error");
      await getIt<LoggedInCheckerService>().logOut();
      getIt<NavigationService>().navigateAndFinish(const IntroScreen());
    }
    return null;
  }

  Future setAccessToken(String accessToken) async {
    await _storage.write(
        key: _keyAccessToken, value: Encryption().encrypt(accessToken));
  }

  Future<String?> getAccessToken() async {
    final String? accessToken = await _storage.read(key: _keyAccessToken);
    final String? accessTokenStr =
        ((accessToken != null) ? Encryption().decrypt(accessToken) : null);
    return accessTokenStr;
  }

  Future clearStorage() async {
    await _storage.deleteAll();
  }
}
