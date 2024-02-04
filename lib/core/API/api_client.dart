import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/interceptors/api_interceptors.dart';
import 'package:saayer/core/API/end_points/builder/end_points_base_url.dart';
import 'package:saayer/core/API/http_overrides.dart';
import 'package:saayer/core/API/status_code.dart';
import 'package:saayer/core/app_config/app_flavor.dart';
import 'package:saayer/core/error/exceptions.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/constants.dart';
import 'package:saayer/core/utils/enums.dart';

@LazySingleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    HttpOverrides.global = MyHttpOverrides();

    client.options
      ..baseUrl = EndPointsBaseUrl.init().baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return (status == StatusCode.ok) || (status == StatusCode.success);
      };
    addAppInterceptors();
  }

  void addAppInterceptors() {
    client.interceptors.add(getIt<AppInterceptors>());
    if (getIt<AppFlavor>().appFlavorEntity.flavorType != FlavorType.PROD) {
      client.interceptors.addAll([
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
        ),
      ]);
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioException(error);
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? body,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioException(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.put(path, queryParameters: queryParameters, data: body);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioException(error);
    }
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.delete(path,
          queryParameters: queryParameters, data: body);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioException(error);
    }
  }

  @override
  Future retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return client.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        final responseJson = jsonDecode(error.response!.data.toString());
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw BadRequestException(
              responseJson[Constants.apiErrorMessageKey].toString(),
            );
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw UnauthorizedException(
              responseJson[Constants.apiErrorMessageKey].toString(),
            );
          case StatusCode.notFound:
            throw NotFoundException(
              responseJson[Constants.apiErrorMessageKey].toString(),
            );
          case StatusCode.conflict:
            throw ConflictException(
              responseJson[Constants.apiErrorMessageKey].toString(),
            );

          case StatusCode.internalServerError:
            throw InternalServerErrorException(
              responseJson[Constants.apiErrorMessageKey].toString(),
            );
        }
        break;
      case DioExceptionType.cancel:
        break;
      default:
        final responseJson = jsonDecode(error.response!.data.toString());
        throw NoInternetConnectionException(
          responseJson[Constants.apiErrorMessageKey].toString(),
        );
    }
  }
}
