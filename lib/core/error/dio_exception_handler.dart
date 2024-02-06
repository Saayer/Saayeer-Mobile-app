import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dio_exception;
import 'package:saayer/core/API/status_code.dart';
import 'package:saayer/core/error/exceptions.dart';
import 'package:saayer/core/utils/constants/error_constants.dart';

class DioExceptionHandler {
  final dio_exception.DioException error;

  const DioExceptionHandler({
    required this.error,
  });

  dynamic call() {
    log("${error.response?.data}",
        name: "handleDioException error.response.data");
    try {
      final Map errorResponseMap = jsonDecode(error.response?.data);
      switch (error.type) {
        case dio_exception.DioExceptionType.connectionTimeout:
        case dio_exception.DioExceptionType.sendTimeout:
        case dio_exception.DioExceptionType.receiveTimeout:
          {
            throw const FetchDataException();
          }
        case dio_exception.DioExceptionType.badResponse:
          {
            switch (error.response?.statusCode) {
              case StatusCode.badRequest:
                {
                  throw BadRequestException(
                    errorResponseMap[ErrorConstants.apiErrorMessageKey]
                        .toString(),
                  );
                }
              case StatusCode.unauthorized:
              case StatusCode.forbidden:
                {
                  throw UnauthorizedException(
                    errorResponseMap[ErrorConstants.apiErrorMessageKey]
                        .toString(),
                  );
                }
              case StatusCode.notFound:
                {
                  throw NotFoundException(
                    errorResponseMap[ErrorConstants.apiErrorMessageKey]
                        .toString(),
                  );
                }
              case StatusCode.conflict:
                {
                  throw ConflictException(
                    errorResponseMap[ErrorConstants.apiErrorMessageKey]
                        .toString(),
                  );
                }

              case StatusCode.internalServerError:
                {
                  throw InternalServerErrorException(
                    errorResponseMap[ErrorConstants.apiErrorMessageKey]
                        .toString(),
                  );
                }
            }
            break;
          }
        case dio_exception.DioExceptionType.cancel:
          {
            break;
          }
        default:
          {
            throw NoInternetConnectionException(
              errorResponseMap[ErrorConstants.apiErrorMessageKey].toString(),
            );
          }
      }
    } catch (e) {
      throw const QuotaExceededException();
    }
  }
}
