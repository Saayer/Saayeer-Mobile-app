import 'package:dartz/dartz.dart';
import 'package:saayer/core/error/failure.dart';

abstract class MoreRepo {
  Future<Either<Failure, void>> deleteAccount();
}