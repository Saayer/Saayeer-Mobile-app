import 'package:saayer/features/view_page/sub_features/home/domain/entities/user_profile_entity.dart';

/// reqSecureKey : "c94d9c33f70c418c8118792ff679d4cc"
/// success : true
/// data : {"name":"user name","status":"PersonalInfoComplete","totalShipments":15,"balance":1250.78,"totalBills":10,"totalStoreRequests":30,"newShipmenst":[{"number":"123432","reciver":"Ahmed aly","size":"6 kg","coast":123.23,"billStatus":"Waiting"},{"number":"22223333","reciver":"Hossame","size":"1 inche * 8 inches","coast":345.0,"billStatus":"Paiyed"}]}
/// errorMessage : null

class GetUserProfileModel {
  GetUserProfileModel({
    String? reqSecureKey,
    bool? success,
    Data? data,
    dynamic errorMessage,
  }) {
    _reqSecureKey = reqSecureKey;
    _success = success;
    _data = data;
    _errorMessage = errorMessage;
  }

  GetUserProfileModel.fromJson(dynamic json) {
    _reqSecureKey = json['reqSecureKey'];
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errorMessage = json['errorMessage'];
  }

  String? _reqSecureKey;
  bool? _success;
  Data? _data;
  dynamic _errorMessage;

  GetUserProfileModel copyWith({
    String? reqSecureKey,
    bool? success,
    Data? data,
    dynamic errorMessage,
  }) =>
      GetUserProfileModel(
        reqSecureKey: reqSecureKey ?? _reqSecureKey,
        success: success ?? _success,
        data: data ?? _data,
        errorMessage: errorMessage ?? _errorMessage,
      );

  String? get reqSecureKey => _reqSecureKey;

  bool? get success => _success;

  Data? get data => _data;

  dynamic get errorMessage => _errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reqSecureKey'] = _reqSecureKey;
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['errorMessage'] = _errorMessage;
    return map;
  }

  UserProfileEntity toDomain() {
    return UserProfileEntity(
        name: data?.name ?? "",
        status: data?.status ?? "",
        totalShipments: data?.totalShipments?.toString() ?? "0",
        balance: data?.balance?.toString() ?? "0",
        totalBills: data?.totalBills?.toString() ?? "0",
        totalStoreRequests: data?.totalStoreRequests?.toString() ?? "0");
  }
}

/// name : "user name"
/// status : "PersonalInfoComplete"
/// totalShipments : 15
/// balance : 1250.78
/// totalBills : 10
/// totalStoreRequests : 30
/// newShipmenst : [{"number":"123432","reciver":"Ahmed aly","size":"6 kg","coast":123.23,"billStatus":"Waiting"},{"number":"22223333","reciver":"Hossame","size":"1 inche * 8 inches","coast":345.0,"billStatus":"Paiyed"}]

class Data {
  Data({
    String? name,
    String? status,
    num? totalShipments,
    num? balance,
    num? totalBills,
    num? totalStoreRequests,
    List<NewShipmenst>? newShipmenst,
  }) {
    _name = name;
    _status = status;
    _totalShipments = totalShipments;
    _balance = balance;
    _totalBills = totalBills;
    _totalStoreRequests = totalStoreRequests;
    _newShipmenst = newShipmenst;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _status = json['status'];
    _totalShipments = json['totalShipments'];
    _balance = json['balance'];
    _totalBills = json['totalBills'];
    _totalStoreRequests = json['totalStoreRequests'];
    if (json['newShipmenst'] != null) {
      _newShipmenst = [];
      json['newShipmenst'].forEach((v) {
        _newShipmenst?.add(NewShipmenst.fromJson(v));
      });
    }
  }

  String? _name;
  String? _status;
  num? _totalShipments;
  num? _balance;
  num? _totalBills;
  num? _totalStoreRequests;
  List<NewShipmenst>? _newShipmenst;

  Data copyWith({
    String? name,
    String? status,
    num? totalShipments,
    num? balance,
    num? totalBills,
    num? totalStoreRequests,
    List<NewShipmenst>? newShipmenst,
  }) =>
      Data(
        name: name ?? _name,
        status: status ?? _status,
        totalShipments: totalShipments ?? _totalShipments,
        balance: balance ?? _balance,
        totalBills: totalBills ?? _totalBills,
        totalStoreRequests: totalStoreRequests ?? _totalStoreRequests,
        newShipmenst: newShipmenst ?? _newShipmenst,
      );

  String? get name => _name;

  String? get status => _status;

  num? get totalShipments => _totalShipments;

  num? get balance => _balance;

  num? get totalBills => _totalBills;

  num? get totalStoreRequests => _totalStoreRequests;

  List<NewShipmenst>? get newShipmenst => _newShipmenst;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['status'] = _status;
    map['totalShipments'] = _totalShipments;
    map['balance'] = _balance;
    map['totalBills'] = _totalBills;
    map['totalStoreRequests'] = _totalStoreRequests;
    if (_newShipmenst != null) {
      map['newShipmenst'] = _newShipmenst?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// number : "123432"
/// reciver : "Ahmed aly"
/// size : "6 kg"
/// coast : 123.23
/// billStatus : "Waiting"

class NewShipmenst {
  NewShipmenst({
    String? number,
    String? reciver,
    String? size,
    num? coast,
    String? billStatus,
  }) {
    _number = number;
    _reciver = reciver;
    _size = size;
    _coast = coast;
    _billStatus = billStatus;
  }

  NewShipmenst.fromJson(dynamic json) {
    _number = json['number'];
    _reciver = json['reciver'];
    _size = json['size'];
    _coast = json['coast'];
    _billStatus = json['billStatus'];
  }

  String? _number;
  String? _reciver;
  String? _size;
  num? _coast;
  String? _billStatus;

  NewShipmenst copyWith({
    String? number,
    String? reciver,
    String? size,
    num? coast,
    String? billStatus,
  }) =>
      NewShipmenst(
        number: number ?? _number,
        reciver: reciver ?? _reciver,
        size: size ?? _size,
        coast: coast ?? _coast,
        billStatus: billStatus ?? _billStatus,
      );

  String? get number => _number;

  String? get reciver => _reciver;

  String? get size => _size;

  num? get coast => _coast;

  String? get billStatus => _billStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = _number;
    map['reciver'] = _reciver;
    map['size'] = _size;
    map['coast'] = _coast;
    map['billStatus'] = _billStatus;
    return map;
  }
}
