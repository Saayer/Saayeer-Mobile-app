import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points.dart';
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart';
import 'package:saayer/features/log_in/data/models/log_in_request_model.dart';
import 'package:saayer/features/log_in/data/models/log_in_response_model.dart';
import 'package:saayer/features/log_in/domain/entities/log_in_entity.dart';

@LazySingleton(as: LogInRDS)
class LogInRDSImpl implements LogInRDS {
  final ApiConsumer apiConsumer;

  LogInRDSImpl({required this.apiConsumer});

  @override
  Future<LogInResponseModel> logIn(LogInEntity logInEntity) async {
    final LogInRequestModel logInRequestModel =
        LogInRequestModel(logInEntity: logInEntity);
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.post(EndPoints.login, body: logInRequestModel.toJson()),
    );
    final LogInResponseModel logInResponseModel =
        LogInResponseModel.fromJson(result);
    return logInResponseModel;
  }
}
