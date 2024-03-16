import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:saayer/features/view_page/sub_features/home/domain/entities/user_profile_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserProfileEntity>> getUserProfile();
}
