import 'package:dartz/dartz.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';

abstract class StoresListRepo {
  Future<Either<Failure, List<StoreGetDto>>> getStores();

  Future<Either<Failure, void>> deleteStore(int storeId);
}
