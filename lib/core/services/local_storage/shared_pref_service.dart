import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:injectable/injectable.dart';
import 'package:moyasar/moyasar.dart';
import 'package:moyasar/src/models/payment_type.dart';
import 'package:openapi/openapi.dart';
import 'package:built_value/serializer.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
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

  ///
  final String _keyAccessToken = 'AccessToken';
  final String _keyIsLoggedIn = 'IsLoggedIn';
  final String _keyLastStoreAdded = 'LastStoreAdded';
  final String _keyClientPhone = 'ClientPhone';
  final String _keyShipmentId = 'ShipmentId';
  final String _keyPaymentResponse = 'PaymentResponse';
  final String _keyUserData = 'UserData';
  final String _keyUserRole = 'UserRole';

  /// saving data to sharedpreference
  Future setAccessToken(String accessToken) async {
    await _preferences.setString(_keyAccessToken, Encryption().encrypt(accessToken));
  }

  Future setIsLoggedIn(bool isLoggedIn) async {
    await _preferences.setBool(_keyIsLoggedIn, isLoggedIn);
  }

  Future setLastStoreAddedId(int storeId) async {
    await _preferences.setInt(_keyLastStoreAdded, storeId);
  }

  Future setClientPhone(String phoneNo) async {
    await _preferences.setString(_keyClientPhone, phoneNo);
  }

  Future setShipmentId(int shipmentId) async {
    await _preferences.setInt(_keyShipmentId, shipmentId);
  }

  Future setPaymentResponse(PaymentResponse paymentResponse) async {
    var jsondata = paymentResponse.toJson();
    await _preferences.setString(_keyPaymentResponse, jsonEncode(jsondata));
  }

  Future setUserData(ClientGetDto userData) async {
    var jsondata =
    getIt<OpenAPIConfig>().openapi.serializers.serialize(userData, specifiedType: const FullType(ClientGetDto));
    await _preferences.setString(_keyUserData, jsonEncode(jsondata));
  }

  Future setUserRole(String userRole) async {
    await _preferences.setString(_keyUserRole, userRole);
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

  int? getLastStoreAddedId() {
    if (_preferences.containsKey(_keyLastStoreAdded)) {
      final int? lastStoreAddedId = _preferences.get(_keyLastStoreAdded) as int?;
      return lastStoreAddedId;
    } else {
      return null;
    }
  }

  String? getClientPhone() {
    if (_preferences.containsKey(_keyClientPhone)) {
      final String? phoneNumber = _preferences.get(_keyClientPhone) as String?;
      return phoneNumber;
    } else {
      return null;
    }
  }

  int? getShipmentId() {
    if (_preferences.containsKey(_keyShipmentId)) {
      final int? shipmentId = _preferences.get(_keyShipmentId) as int?;
      return shipmentId;
    } else {
      return null;
    }
  }

  PaymentResponse? getPaymentResponse() {
    if (_preferences.containsKey(_keyPaymentResponse)) {
      final String? jsondata = _preferences.get(_keyPaymentResponse) as String?;
      if (jsondata != null) {
        Map<String, dynamic> map = json.decode(jsondata);
        final payment = PaymentResponse.fromJson(map, PaymentType.creditcard);
        return payment;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  ClientGetDto? getUserData() {
    if (_preferences.containsKey(_keyUserData)) {
      final String? jsondata = _preferences.get(_keyUserData) as String?;
      if (jsondata != null) {
        Map<String, dynamic> map = json.decode(jsondata);
        final userData = getIt<OpenAPIConfig>().openapi.serializers.deserialize(map, specifiedType: const FullType(ClientGetDto)) as ClientGetDto;
        return userData;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  String? getUserRole() {
    if (_preferences.containsKey(_keyUserRole)) {
      final String? userRole = _preferences.get(_keyUserRole) as String?;
      return userRole;
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
