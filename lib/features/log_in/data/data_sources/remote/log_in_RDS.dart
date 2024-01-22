import 'package:saayer/features/log_in/data/models/log_in_response_model.dart';
import 'package:saayer/features/log_in/domain/entities/log_in_entity.dart';

abstract class LogInRDS {
  Future<LogInResponseModel> logIn(LogInEntity LogInEntity);
}
