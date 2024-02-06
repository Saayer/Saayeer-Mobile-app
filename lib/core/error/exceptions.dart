import 'package:equatable/equatable.dart';
import 'package:saayer/core/utils/constants/error_constants.dart';

class ServerException extends Equatable implements Exception{
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];
}

class LocalDatabaseException extends Equatable implements Exception{
  final String errorMessage;

  LocalDatabaseException(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class FetchDataException extends ServerException {
  const FetchDataException([message])
      : super(message ?? ErrorConstants.fetchDataExceptionMessage);
}

class BadRequestException extends ServerException {
  const BadRequestException([message])
      : super(message ?? ErrorConstants.badRequestExceptionMessage);
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message])
      : super(message ?? ErrorConstants.unauthorizedExceptionMessage);
}

class NotFoundException extends ServerException {
  const NotFoundException([message])
      : super(message ?? ErrorConstants.notFoundExceptionMessage);
}

class ConflictException extends ServerException {
  const ConflictException([message])
      : super(message ?? ErrorConstants.conflictExceptionMessage);
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message])
      : super(message ?? ErrorConstants.internalExceptionMessage);
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([message])
      : super(message ?? ErrorConstants.noInternetExceptionMessage);
}

class QuotaExceededException extends ServerException {
  const QuotaExceededException([message])
      : super(message ?? ErrorConstants.quotaExceededExceptionMessage);
}