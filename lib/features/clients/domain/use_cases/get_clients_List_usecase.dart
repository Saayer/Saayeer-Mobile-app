import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/clients/domain/repositories/clients_list_repo.dart';

@injectable
class GetClientsListUseCase implements BaseUseCase<Future<Either<Failure, List<ClientGetDto>>>, ClientsQuery?> {
  final ClientsListRepo clientsListRepo;

  const GetClientsListUseCase({
    required this.clientsListRepo,
  });

  @override
  Future<Either<Failure, List<ClientGetDto>>> call(ClientsQuery? clientsQuery) async {
    return await clientsListRepo.getClientsListByFilter(clientsQuery);
  }
}
