import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/view_page/sub_features/home/data/data_sources/remote/home_RDS.dart';
import 'package:saayer/features/view_page/sub_features/home/data/data_sources/remote/home_RDS_impl.dart';
import 'package:saayer/features/view_page/sub_features/home/data/models/get_user_profile_model.dart';
import 'package:saayer/features/view_page/sub_features/home/domain/entities/user_profile_entity.dart';
import 'package:saayer/features/view_page/sub_features/home/domain/repositories/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRDS homeRDSImpl;

  const HomeRepoImpl({
    required this.homeRDSImpl,
  });

  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile() async {
    log("HomeRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final GetUserProfileModel result = await homeRDSImpl.getUserProfile();
        log("HomeRepoImpl Right $result");
        if (result != null) {
          return Right(result.toDomain());
        } else {
          return Left(Failure(failureMessage: "Request failed"));
        }
      } catch (e) {
        log("HomeRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Request failed"));
      }
    }
    log("HomeRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
