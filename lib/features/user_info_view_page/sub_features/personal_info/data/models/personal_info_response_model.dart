import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/entities/submit_personal_info_entity.dart';

/// success : true
/// data : {"otp":"3718","message":"Otp sent to number XXXXXX3660"}
/// errorMessage : null

class PersonalInfoResponseModel {
  PersonalInfoResponseModel({
    bool? success,
    Data? data,
    dynamic errorMessage,
  }) {
    _success = success;
    _data = data;
    _errorMessage = errorMessage;
  }

  PersonalInfoResponseModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errorMessage = json['errorMessage'];
  }

  bool? _success;
  Data? _data;
  dynamic _errorMessage;

  PersonalInfoResponseModel copyWith({
    bool? success,
    Data? data,
    dynamic errorMessage,
  }) =>
      PersonalInfoResponseModel(
        success: success ?? _success,
        data: data ?? _data,
        errorMessage: errorMessage ?? _errorMessage,
      );

  bool? get success => _success;

  Data? get data => _data;

  dynamic get errorMessage => _errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['errorMessage'] = _errorMessage;
    return map;
  }

  SubmitPersonalInfoEntity toDomain() {
    final bool isSuccess = (success ?? false);
    return SubmitPersonalInfoEntity(
        message: isSuccess ? (data?.message ?? "") : (errorMessage ?? ""),
        isSuccess: isSuccess);
  }
}

/// otp : "3718"
/// message : "Otp sent to number XXXXXX3660"

class Data {
  Data({
    String? otp,
    String? message,
  }) {
    _otp = otp;
    _message = message;
  }

  Data.fromJson(dynamic json) {
    _otp = json['otp'];
    _message = json['message'];
  }

  String? _otp;
  String? _message;

  Data copyWith({
    String? otp,
    String? message,
  }) =>
      Data(
        otp: otp ?? _otp,
        message: message ?? _message,
      );

  String? get otp => _otp;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp'] = _otp;
    map['message'] = _message;
    return map;
  }
}
