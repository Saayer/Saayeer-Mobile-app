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
    String? authToken = await getIt<SecureStorageService>().getAccessToken();
    options.queryParameters.addAll(
      ApiConfig.queryParameters,
    );
    options.headers["Content-Type"] = "application/json; charset=utf-8";
    options.headers["X-Api-Key"] = NetworkKeys.init().networkKeys.xApiKey;
    options.headers["Accept-Language"] = Localization.getLocale();
    if (authToken != null) {
      //log("$accessToken", name: "has accessToken");
      options.headers['Authorization'] = 'Bearer $authToken';
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (jsonDecode(response.data).toString().contains("token")) {
      final Map responseData = jsonDecode(response.data);
      final String? authToken = responseData["data"]["token"];
      if (authToken != null) {
        await getIt<SecureStorageService>().setAccessToken(authToken);
        responseData.remove(authToken);
        response.data = jsonEncode(responseData);
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('DIO ERROR[${err.response?.statusCode}] => PATH: ${err.response}');
    if (err.response?.statusCode == StatusCode.unauthorized) {
      await getIt<RefreshToken>().refreshToken();
      final retryRequest =
          await getIt<RefreshToken>().retryRequest(err.requestOptions);
      return handler.resolve(retryRequest);
    }
    super.onError(err, handler);
  }
}