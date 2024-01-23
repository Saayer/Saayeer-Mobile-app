import 'package:saayer/features/log_in/domain/entities/log_in_entity.dart';

class LogInRequestModel {
  final LogInEntity logInEntity;

  const LogInRequestModel({
    required this.logInEntity,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["email"] = logInEntity.email;
    map["password"] = logInEntity.password;
    return map;
  }
}
