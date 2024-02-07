import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/submit_store_info_entity.dart';

/// success : true
/// data : {"otp":"3718","message":"Otp sent to number XXXXXX3660"}
/// errorMessage : null

class StoreInfoResponseModel {
  StoreInfoResponseModel({
    bool? success,
    bool? data,
    dynamic errorMessage,
  }) {
    _success = success;
    _data = data;
    _errorMessage = errorMessage;
  }

  StoreInfoResponseModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'];
    _errorMessage = json['errorMessage'];
  }

  bool? _success;
  bool? _data;
  dynamic _errorMessage;

  StoreInfoResponseModel copyWith({
    bool? success,
    bool? data,
    dynamic errorMessage,
  }) =>
      StoreInfoResponseModel(
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

  SubmitStoreInfoEntity toDomain() {
    final bool isSuccess = (success ?? false);
    return SubmitStoreInfoEntity(
        message: errorMessage ?? "", isSuccess: isSuccess);
  }
}