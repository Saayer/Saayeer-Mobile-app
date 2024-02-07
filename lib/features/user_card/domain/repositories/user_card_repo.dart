import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';

abstract class UserCardRepo {
  Future<Either<Failure, UserCardEntity?>> getProfile();
}
