import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/auth_end_points.dart';
import 'package:saayer/core/entities/logged_in_user_entity.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/features/log_in/data/models/log_in_request_model.dart';
import 'package:saayer/features/log_in/domain/entities/log_in_entity.dart';

@injectable
class RefreshToken {
  final ApiConsumer apiConsumer;

  RefreshToken({required this.apiConsumer});

  Future<void> refreshToken() async {
    // LoggedInUserEntity? loggedInUserEntity =
    //     await getIt<SecureStorageService>().getLoggedInUser();
    // final LogInEntity logInEntity = LogInEntity(
    //     email: loggedInUserEntity?.email ?? "",
    //     password: loggedInUserEntity?.decryptPassword ?? "");
    // final LogInRequestModel logInRequestModel =
    //     LogInRequestModel(logInEntity: logInEntity);
    // await apiConsumer.post(AuthEndPoints().login,
    //     body: logInRequestModel.toJson());
  }

  Future retryRequest(RequestOptions requestOptions) async {
    return apiConsumer.retry(requestOptions);
  }
}
