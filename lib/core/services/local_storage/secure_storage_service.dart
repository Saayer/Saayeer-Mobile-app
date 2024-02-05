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

  final String _keyAccessToken = 'AccessToken';
  final String _keyReqSecureKey = 'ReqSecureKey';

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

  Future clearStorage() async {
    await _storage.deleteAll();
  }
}
