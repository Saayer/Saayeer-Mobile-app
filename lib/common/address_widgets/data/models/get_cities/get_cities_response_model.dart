import 'package:saayer/common/address_widgets/domain/entities/city_entity.dart';

class GetCitiesResponseModel {
  GetCitiesResponseModel({
    bool? success,
    List<Data>? data,
    dynamic errorMessage,
  }) {
    _success = success;
    _data = data;
    _errorMessage = errorMessage;
  }

  GetCitiesResponseModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _errorMessage = json['errorMessage'];
  }

  bool? _success;
  List<Data>? _data;
  dynamic _errorMessage;

  GetCitiesResponseModel copyWith({
    bool? success,
    List<Data>? data,
    dynamic errorMessage,
  }) =>
      GetCitiesResponseModel(
        success: success ?? _success,
        data: data ?? _data,
        errorMessage: errorMessage ?? _errorMessage,
      );

  bool? get success => _success;

  List<Data>? get data => _data;

  dynamic get errorMessage => _errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['errorMessage'] = _errorMessage;
    return map;
  }

  List<CityEntity> toDomain() {
    return List.generate(data?.length ?? 0, (index) {
      final Data dataItem = data![index];
      return CityEntity(
          id: dataItem.id?.toString() ?? "",
          nameEn: dataItem.name ?? "",
          nameAr: dataItem.name ?? "");
    });
  }
}

/// name : "آبار الطويرفة"
/// id : 9906

class Data {
  Data({
    String? name,
    num? id,
  }) {
    _name = name;
    _id = id;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
  }

  String? _name;
  num? _id;

  Data copyWith({
    String? name,
    num? id,
  }) =>
      Data(
        name: name ?? _name,
        id: id ?? _id,
      );

  String? get name => _name;

  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    return map;
  }
}
