import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AddEditStoreRepo {
  Future<Either<Failure, StoreGetDto?>> addStore(StoreAddDto storeInfoEntity);

  Future<Either<Failure, void>> editStore(StoreAddDto? storeAddDto);
}
