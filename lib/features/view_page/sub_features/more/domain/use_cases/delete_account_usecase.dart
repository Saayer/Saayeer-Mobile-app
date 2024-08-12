import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/view_page/sub_features/more/domain/repositories/more_repo.dart';

@injectable
class DeleteAccountUseCase implements BaseUseCase<Future<Either<Failure, void>>, NoParameters> {
  final MoreRepo moreRepoImpl;

  const DeleteAccountUseCase({required this.moreRepoImpl});

  @override
  Future<Either<Failure, void>> call(NoParameters parameter) async {
    return await moreRepoImpl.deleteAccount();
  }
}
