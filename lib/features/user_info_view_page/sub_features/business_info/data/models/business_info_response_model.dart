import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/submit_business_info_entity.dart';

/// success : true
/// data : {"otp":"3718","message":"Otp sent to number XXXXXX3660"}
/// errorMessage : null

class BusinessInfoResponseModel {
  BusinessInfoResponseModel({
    bool? success,
    bool? data,
    dynamic errorMessage,
  }) {
    _success = success;
    _data = data;
    _errorMessage = errorMessage;
  }

  BusinessInfoResponseModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'];
    _errorMessage = json['errorMessage'];
  }

  bool? _success;
  bool? _data;
  dynamic _errorMessage;

  BusinessInfoResponseModel copyWith({
    bool? success,
    bool? data,
    dynamic errorMessage,
  }) =>
      BusinessInfoResponseModel(
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

  SubmitBusinessInfoEntity toDomain() {
    final bool isSuccess = (success ?? false);
    return SubmitBusinessInfoEntity(
        message: errorMessage ?? "", isSuccess: isSuccess);
  }
}
