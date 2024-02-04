import 'package:saayer/features/verify_otp/domain/entities/submit_verify_otp_entity.dart';

/// success : false
/// errorMessage : "Otp not correct"

class VerifyOtpResponseModel {
  VerifyOtpResponseModel({
    bool? success,
    String? errorMessage,
  }) {
    _success = success;
    _errorMessage = errorMessage;
  }

  VerifyOtpResponseModel.fromJson(dynamic json) {
    _success = json['success'];
    _errorMessage = json['errorMessage'];
  }

  bool? _success;
  String? _errorMessage;

  VerifyOtpResponseModel copyWith({
    bool? success,
    String? errorMessage,
  }) =>
      VerifyOtpResponseModel(
        success: success ?? _success,
        errorMessage: errorMessage ?? _errorMessage,
      );

  bool? get success => _success;

  String? get errorMessage => _errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errorMessage'] = _errorMessage;
    return map;
  }

  SubmitVerifyOtpEntity toDomain() {
    return SubmitVerifyOtpEntity(
        message: errorMessage ?? "", isSuccess: success ?? false);
  }
}
