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
import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';


class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  final String _keyLoggedInUser = 'loggedInUser';
  final String _keyIsLoggedIn = 'IsLoggedIn';
  final String _keyUserCardInfo = 'UserCardInfo';
  final String _keyAccessToken = 'AccessToken';
  final String _keyReqSecureKey = 'ReqSecureKey';

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

  Future setReqSecureKey(String reqSecureKey) async {
    await _storage.write(
        key: _keyReqSecureKey, value: Encryption().encrypt(reqSecureKey));
  }

  Future<String?> getReqSecureKey() async {
    final String? reqSecureKey = await _storage.read(key: _keyReqSecureKey);
    final String? reqSecureKeyStr =
        ((reqSecureKey != null) ? Encryption().decrypt(reqSecureKey) : null);
    return reqSecureKeyStr;
  }

  Future<UserCardEntity?> getUserCardInfo() async {
    final String? userCardInfoStr = await _storage.read(key: _keyUserCardInfo);
    final UserCardEntity? userCardEntity = userCardInfoStr != null
        ? UserCardEntity.fromJson(jsonDecode(userCardInfoStr))
        : null;
    return userCardEntity;
  }

  Future setUserCardInfo(UserCardEntity userCardEntity) async {
    await _storage.write(
        key: _keyUserCardInfo, value: jsonEncode(userCardEntity.toJson()));
  }

  Future clearUserCardInfo() async {
    await _storage.delete(key: _keyUserCardInfo);
  }

  Future clearStorage() async {
    await _storage.deleteAll();
  }
}
