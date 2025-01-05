import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/clients/domain/repositories/clients_list_repo.dart';

@Injectable(as: ClientsListRepo)
class ClientsListRepoImpl implements ClientsListRepo {
  final OpenAPIConfig openAPIConfig;

  ClientsListRepoImpl({required this.openAPIConfig});

  @override
  Future<Either<Failure, List<ClientGetDto>>> getClientsListByFilter(ClientsQuery? clientsQuery) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getClientsApi()
            .apiClientsGetbyPost(clientsQuery: clientsQuery, apiKey: NetworkKeys.init().networkKeys.apiKey);

        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "get Clients failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "get Clients failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
