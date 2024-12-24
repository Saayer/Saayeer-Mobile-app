import 'package:dartz/dartz.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';

abstract class ClientsListRepo {
  Future<Either<Failure, List<ClientGetDto>>> getClientsListByFilter(ClientsQuery? clientsQuery);
}
