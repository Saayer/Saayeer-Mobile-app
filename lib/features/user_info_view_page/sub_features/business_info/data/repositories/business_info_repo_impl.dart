import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/business_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/submit_business_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/models/business_info_response_model.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/repositories/business_info_repo.dart';

@Injectable(as: BusinessInfoRepo)
class BusinessInfoRepoImpl implements BusinessInfoRepo {
  final BusinessInfoRDS businessInfoRDSImpl;

  const BusinessInfoRepoImpl({
    required this.businessInfoRDSImpl,
  });

  @override
  Future<Either<Failure, SubmitBusinessInfoEntity?>> submitBusinessInfo(BusinessInfoEntity businessInfoEntity) async {
    log("BusinessInfoRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final BusinessInfoResponseModel result =
            await businessInfoRDSImpl.submitBusinessInfo(businessInfoEntity);
        log("BusinessInfoRepoImpl Right $result");
        if (result != null) {
          return Right(result.toDomain());
        } else {
          return Left(Failure(failureMessage: "Log in failed"));
        }
      } catch (e) {
        log("BusinessInfoRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Log in failed"));
      }
    }
    log("BusinessInfoRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }


}
