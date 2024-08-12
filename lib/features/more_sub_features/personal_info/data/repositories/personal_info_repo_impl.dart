import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/personal_info/domain/repositories/personal_info_repo.dart';

@Injectable(as: PersonalInfoRepo)
class PersonalInfoRepoImpl implements PersonalInfoRepo {
  final OpenAPIConfig openAPIConfig;

  const PersonalInfoRepoImpl({
    required this.openAPIConfig,
  });

  @override
  Future<Either<Failure, void>> editPersonalInfo(
      ClientAddDto clientDto) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final result =
            await openAPIConfig.openapi.getClientsApi().apiClientsPut(clientAddDto: clientDto,apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.statusCode == 200 || result.statusCode == 201) {
          return Right(result.data);
        } else {
          return Left(Failure(failureMessage: "editPersonalInfo failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "editPersonalInfo failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, ClientGetDto?>> getPersonalInfo() async{
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final result =
        await openAPIConfig.openapi.getClientsApi().apiClientsGet(apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data);
        } else {
          return Left(Failure(failureMessage: "getPersonalInfo failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "getPersonalInfo failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
