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
import 'package:saayer/core/services/localization/localization.dart';

@lazySingleton
class AppInterceptors extends Interceptor {
  final Dio client;

  AppInterceptors({required this.client});

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? authToken =
        await getIt<SecureStorageService>().getAccessToken();
    final String? reqSecureKey =
        await getIt<SecureStorageService>().getReqSecureKey();
    final bool isLogin = options.path.contains("login");
    final bool isEntry = options.path.contains("entry");
    options.queryParameters.addAll(
      ApiConfig.queryParameters,
    );
    options.headers["Content-Type"] = "application/json; charset=utf-8";
    options.headers["X-Api-Key"] = NetworkKeys.init().networkKeys.xApiKey;
    options.headers["Accept-Language"] = Localization.getLocale();

    if (authToken != null && !isLogin) {
      //log("$accessToken", name: "has accessToken");
      options.headers['Authorization'] = 'Bearer $authToken';
    }
    if (reqSecureKey != null && !isLogin && !isEntry) {
      //log("$reqSecureKey", name: "has reqSecureKey");
      options.headers['X-Request-Key'] = reqSecureKey;
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final bool hasToken =
        jsonDecode(response.data).toString().contains("token");
    if (hasToken) {
      final Map responseData = jsonDecode(response.data);
      final String? authToken = responseData["data"]["token"];
      final String? reqSecureKey = responseData["reqSecureKey"];
      if (authToken != null) {
        await getIt<SecureStorageService>().setAccessToken(authToken);
        responseData["data"].remove(authToken);
        response.data = jsonEncode(responseData);
      }
      if (reqSecureKey != null) {
        await getIt<SecureStorageService>().setReqSecureKey(reqSecureKey);
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
