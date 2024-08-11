import 'package:saayer/features/more_sub_features/personal_info/domain/entities/submit_personal_info_entity.dart';

/// success : true
/// data : false
/// errorMessage : null

class PersonalInfoResponseModel {
  PersonalInfoResponseModel({
    bool? success,
    bool? data,
    dynamic errorMessage,
  }) {
    _success = success;
    _data = data;
    _errorMessage = errorMessage;
  }

  PersonalInfoResponseModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'];
    _errorMessage = json['errorMessage'];
  }

  bool? _success;
  bool? _data;
  dynamic _errorMessage;

  PersonalInfoResponseModel copyWith({
    bool? success,
    bool? data,
    dynamic errorMessage,
  }) =>
      PersonalInfoResponseModel(
        success: success ?? _success,
        data: data ?? _data,
        errorMessage: errorMessage ?? _errorMessage,
      );

  bool? get success => _success;

  bool? get data => _data;

  dynamic get errorMessage => _errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['data'] = _data;
    map['errorMessage'] = _errorMessage;
    return map;
  }

  SubmitPersonalInfoEntity toDomain() {
    final bool isSuccess = (success ?? false);
    return SubmitPersonalInfoEntity(
        message: errorMessage ?? "", isSuccess: isSuccess);
  }
}
