import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';

/// success : true
/// data : {"personalInformation":{},"businessInformation":{},"storesInformation":{},"score":0.0,"scorePercentage":"0.00%"}
/// errorMessage : null

class UserCardResponseModel {
  UserCardResponseModel({
    bool? success,
    Data? data,
    dynamic errorMessage,
  }) {
    _success = success;
    _data = data;
    _errorMessage = errorMessage;
  }

  UserCardResponseModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errorMessage = json['errorMessage'];
  }

  bool? _success;
  Data? _data;
  dynamic _errorMessage;

  UserCardResponseModel copyWith({
    bool? success,
    Data? data,
    dynamic errorMessage,
  }) =>
      UserCardResponseModel(
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

  UserCardEntity toDomain() {
    return UserCardEntity(
        isSuccess: success ?? false,
        hasPersonalInformation: data?.personalInformation != null,
        hasBusinessInformation: data?.businessInformation != null,
        hasStoresInformation: data?.storesInformation != null,
        score: data?.score ?? 0,
        scorePercentage: data?.scorePercentage ?? "0%");
  }
}

/// personalInformation : {}
/// businessInformation : {}
/// storesInformation : {}
/// score : 0.0
/// scorePercentage : "0.00%"

class Data {
  Data({
    dynamic personalInformation,
    dynamic businessInformation,
    dynamic storesInformation,
    double? score,
    String? scorePercentage,
  }) {
    _personalInformation = personalInformation;
    _businessInformation = businessInformation;
    _storesInformation = storesInformation;
    _score = score;
    _scorePercentage = scorePercentage;
  }

  Data.fromJson(dynamic json) {
    _personalInformation = json['personalInformation'];
    _businessInformation = json['businessInformation'];
    _storesInformation = json['storesInformation'];
    _score = json['score'];
    _scorePercentage = json['scorePercentage'];
  }

  dynamic _personalInformation;
  dynamic _businessInformation;
  dynamic _storesInformation;
  double? _score;
  String? _scorePercentage;

  Data copyWith({
    dynamic personalInformation,
    dynamic businessInformation,
    dynamic storesInformation,
    double? score,
    String? scorePercentage,
  }) =>
      Data(
        personalInformation: personalInformation ?? _personalInformation,
        businessInformation: businessInformation ?? _businessInformation,
        storesInformation: storesInformation ?? _storesInformation,
        score: score ?? _score,
        scorePercentage: scorePercentage ?? _scorePercentage,
      );

  dynamic get personalInformation => _personalInformation;

  dynamic get businessInformation => _businessInformation;

  dynamic get storesInformation => _storesInformation;

  double? get score => _score;

  String? get scorePercentage => _scorePercentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['personalInformation'] = _personalInformation;
    map['businessInformation'] = _businessInformation;
    map['storesInformation'] = _storesInformation;
    map['score'] = _score;
    map['scorePercentage'] = _scorePercentage;
    return map;
  }
}
