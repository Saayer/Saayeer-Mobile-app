import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class PersonalInfoRepo {
  Future<Either<Failure, ClientGetDto?>> getPersonalInfo();

  Future<Either<Failure, void>> editPersonalInfo(ClientAddDto clientDto);
}
