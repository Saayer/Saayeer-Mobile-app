import 'package:saayer/features/log_in/domain/entities/submit_log_in_entity.dart';

/// success : true
/// data : "2932"
/// errorMessage : "تم إرسال رقم التحقق بنجاح للرقم XXXXXX8312"
/// reqSecureKey : "1819a4e0444d4e1299b1990680aaf72d"

class LogInResponseModel {
  LogInResponseModel({
    bool? success,
    String? data,
    String? errorMessage,
  }) {
    _success = success;
    _data = data;
    _errorMessage = errorMessage;
  }

  LogInResponseModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'];
    _errorMessage = json['errorMessage'];
  }

  bool? _success;
  String? _data;
  String? _errorMessage;

  LogInResponseModel copyWith({
    bool? success,
    String? data,
    String? errorMessage,
  }) =>
      LogInResponseModel(
        success: success ?? _success,
        data: data ?? _data,
        errorMessage: errorMessage ?? _errorMessage,
      );

  bool? get success => _success;

  String? get data => _data;

  String? get errorMessage => _errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['data'] = _data;
    map['errorMessage'] = _errorMessage;
    return map;
  }

  SubmitLogInEntity toDomain() {
    return SubmitLogInEntity(isSuccess: success, message: errorMessage);
  }
}
