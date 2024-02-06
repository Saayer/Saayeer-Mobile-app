import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/business_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/submit_business_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/repositories/business_info_repo.dart';

@injectable
class SubmitBusinessInfoUseCase
    implements
        BaseUseCase<Future<Either<Failure, SubmitBusinessInfoEntity?>>,
            BusinessInfoParameters> {
  final BusinessInfoRepo businessInfoRepoImpl;

  const SubmitBusinessInfoUseCase({
    required this.businessInfoRepoImpl,
  });

  @override
  Future<Either<Failure, SubmitBusinessInfoEntity?>> call(
      BusinessInfoParameters parameters) async {
    return await businessInfoRepoImpl
        .submitBusinessInfo(parameters.businessInfoEntity);
  }
}

class BusinessInfoParameters extends Equatable {
  final BusinessInfoEntity businessInfoEntity;

  const BusinessInfoParameters({required this.businessInfoEntity});

  @override
  List<Object?> get props => [businessInfoEntity];
}
