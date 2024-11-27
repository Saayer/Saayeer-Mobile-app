import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_config.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/API/refresh_token.dart';
import 'package:saayer/core/API/status_code.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/services/localization/localization.dart';

@lazySingleton
class AppInterceptors extends Interceptor {
  final Dio client;

  AppInterceptors({required this.client});

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? authToken =
    getIt<SharedPrefService>().getAccessToken();
    final bool isLogin = options.path.contains("login");
    final bool isEntry = options.path.contains("entry");
    options.queryParameters.addAll(
      ApiConfig.queryParameters,
    );
    options.headers["Content-Type"] = "application/json; charset=utf-8";
    options.headers["X-Api-Key"] = NetworkKeys.init().networkKeys.apiKey;
    options.headers["Accept-Language"] = Localization.getLocale();

    if (authToken != null && !isLogin) {
      //log("$accessToken", name: "has accessToken");
      options.headers['Authorization'] = 'Bearer $authToken';
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final bool hasToken =
        jsonDecode(response.data).toString().contains("token");
    final bool hasReqSecure =
        jsonDecode(response.data).toString().contains("reqSecureKey");
    final Map responseData = jsonDecode(response.data);

    if (hasToken) {
      final String? authToken = responseData["data"]["token"];
      if (authToken != null) {
        await SecureStorageService().setAccessToken(authToken);
        responseData["data"].remove(authToken);
        response.data = jsonEncode(responseData);
      }
    }
    if (hasReqSecure) {
      final String? reqSecureKey = responseData["reqSecureKey"];
      log("$reqSecureKey", name: "reqSecureKey --->");
      if (reqSecureKey != null) {
        await SecureStorageService().setReqSecureKey(reqSecureKey);
        responseData.remove(reqSecureKey);
        response.data = jsonEncode(responseData);
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('DIO ERROR[${err.response?.statusCode}] => PATH: ${err.response}',
        name: "onError");
    final bool unauthorized =
        (err.response?.statusCode == StatusCode.unauthorized);
    final bool expiredRequestKey =
        ((err.response?.statusCode == StatusCode.badRequest) &&
            err.response?.data == "Request Key expired");
    final bool quotaExceeded =
        (err.response?.statusCode == StatusCode.quotaExceeded);
    if ((unauthorized || expiredRequestKey) && !quotaExceeded) {
      try {
        await getIt<RefreshToken>().refreshToken();
        final retryRequest =
            await getIt<RefreshToken>().retryRequest(err.requestOptions);
        return handler.resolve(retryRequest);
      } catch (e) {
        return handler.reject(err);
      }
    }
    super.onError(err, handler);
  }
}
