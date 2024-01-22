import 'package:equatable/equatable.dart';
import 'package:saayer/core/utils/app_strings.dart';

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
      : super(message ?? AppStrings.fetchDataExceptionMessage);
}

class BadRequestException extends ServerException {
  const BadRequestException([message])
      : super(message ?? AppStrings.badRequestExceptionMessage);
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message])
      : super(message ?? AppStrings.unauthorizedExceptionMessage);
}

class NotFoundException extends ServerException {
  const NotFoundException([message])
      : super(message ?? AppStrings.notFoundExceptionMessage);
}

class ConflictException extends ServerException {
  const ConflictException([message])
      : super(message ?? AppStrings.conflictExceptionMessage);
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message])
      : super(message ?? AppStrings.internalExceptionMessage);
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([message])
      : super(message ?? AppStrings.noInternetExceptionMessage);
}