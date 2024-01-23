import 'package:saayer/core/entities/logged_in_user_entity.dart';
import 'package:saayer/features/log_in/domain/entities/submit_log_in_entity.dart';

/// message : "login Successfully"
/// body : {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZDVjYWRkZDhhODdlNzQ1MjJiN2NiYmJlMjVhMDM5ODAwZjc3NDUwMGNmOTBhY2ZmMmNmYTdhMTZhN2I3MDZiYjBjNjZkMzk5ZmNhNWRmOGQiLCJpYXQiOjE2Nzk0OTQ4ODYuNzUwMDYxMDM1MTU2MjUsIm5iZiI6MTY3OTQ5NDg4Ni43NTAwNjM4OTYxNzkxOTkyMTg3NSwiZXhwIjoxNzExMTE3Mjg2LjczNzgyNjEwODkzMjQ5NTExNzE4NzUsInN1YiI6IjMwIiwic2NvcGVzIjpbXX0.dPEzmdHWcf7E7atPISIpH1_NKaLP_NecGwi2GiwJbQd7T5mXNKsZld_ZKzAnKmSoLLyMnScHa3KMN-KY3nO7XzNMG1Oh4CYXLfZ-rENOpqtZIvnhxCd--mTht9vy9_LByrQGF8ZF_NT6w7PObe5GFbGoKOUdWkXxHglfYl1Gku18UQKj5Zws7CtA0YE725tXfI-c24wH6PVXuBl7utsklhFThkVXIvBnYMEd049i5grGBAsmt_SPkEFnhu2mAKV7I02F6GTt5cTzdiu0zB2QAgc0tKAY4ON39gjS86QJAlSblu24XNWpeOPMD9qD9JPltReGKuvZ1mwOimfFRqHAceAMn6dzJsNYHSeoaqwvOsYm-hieO8jiuqsDdSu3aVW_7AMI6_UMwztzlaK0aCxiQ-Fy1hIRx7AU8f2STxIb5Xuc1QyqOnvuflJCCRSfHdvVna4RMiOE2_z1WzzexaVFtq_F2jeg1Ut-KmRQRBFQpEkImVh3la-zlj0SafnOmyPmx9f2SJr4z8-NerJ96hSss3YfMiNG5STvTun6Qo1dCmJX1vd6MKw6j0ipho45_uQSDyiCAmMK0XMw6WkXnhNXSLwqoS8vG3GPVsq10F4tAhQBGS4QE_qF_GnLvy2RTnn4oG3VYaAHybBofXEGdIO4s8N1OUqcDmpN-Q54wszjA6M","expire_at":"2023-04-22T14:21:26.000000Z","id":30,"name":"shimaa","email":"shimaa6696@gmail.com","user_type":3,"gender":"female","date_of_birth":"6-6-96","image":"https://admintest.wannareach.com/storage/images/users/https://admintest.wannareach.com/storage/uploads/users/image641b0dec7c3dc1679494636.jpg"}
/// pagination : null

class LogInResponseModel {
  LogInResponseModel({
    String? message,
    Body? body,
    dynamic pagination,
  }) {
    _message = message;
    _body = body;
    _pagination = pagination;
  }

  LogInResponseModel.fromJson(dynamic json) {
    _message = json['message'];
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
    _pagination = json['pagination'];
  }

  String? _message;
  Body? _body;
  dynamic _pagination;

  LogInResponseModel copyWith({
    String? message,
    Body? body,
    dynamic pagination,
  }) =>
      LogInResponseModel(
        message: message ?? _message,
        body: body ?? _body,
        pagination: pagination ?? _pagination,
      );

  String? get message => _message;

  Body? get body => _body;

  dynamic get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_body != null) {
      map['body'] = _body?.toJson();
    }
    map['pagination'] = _pagination;
    return map;
  }

  SubmitLogInEntity toDomain() {
    bool isSuccess =
        _message != null ? (_message!.contains("Successfully")) : false;
    LoggedInUserEntity loggedInUserEntity = LoggedInUserEntity(
        id: this._body!._id.toString(),
        name: this._body!._name ?? "",
        email: this._body!._email ?? "",
        password: "",
        imageUrl: this._body!._image ?? "",
        gender: this._body!._gender ?? "",
        dateOfBirth: this._body!._dateOfBirth ?? "",
        userType: this._body!._userType.toString());
    return SubmitLogInEntity(
        isSuccess: isSuccess,
        message: _message!,
        loggedInUserEntity: loggedInUserEntity);
  }
}

/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZDVjYWRkZDhhODdlNzQ1MjJiN2NiYmJlMjVhMDM5ODAwZjc3NDUwMGNmOTBhY2ZmMmNmYTdhMTZhN2I3MDZiYjBjNjZkMzk5ZmNhNWRmOGQiLCJpYXQiOjE2Nzk0OTQ4ODYuNzUwMDYxMDM1MTU2MjUsIm5iZiI6MTY3OTQ5NDg4Ni43NTAwNjM4OTYxNzkxOTkyMTg3NSwiZXhwIjoxNzExMTE3Mjg2LjczNzgyNjEwODkzMjQ5NTExNzE4NzUsInN1YiI6IjMwIiwic2NvcGVzIjpbXX0.dPEzmdHWcf7E7atPISIpH1_NKaLP_NecGwi2GiwJbQd7T5mXNKsZld_ZKzAnKmSoLLyMnScHa3KMN-KY3nO7XzNMG1Oh4CYXLfZ-rENOpqtZIvnhxCd--mTht9vy9_LByrQGF8ZF_NT6w7PObe5GFbGoKOUdWkXxHglfYl1Gku18UQKj5Zws7CtA0YE725tXfI-c24wH6PVXuBl7utsklhFThkVXIvBnYMEd049i5grGBAsmt_SPkEFnhu2mAKV7I02F6GTt5cTzdiu0zB2QAgc0tKAY4ON39gjS86QJAlSblu24XNWpeOPMD9qD9JPltReGKuvZ1mwOimfFRqHAceAMn6dzJsNYHSeoaqwvOsYm-hieO8jiuqsDdSu3aVW_7AMI6_UMwztzlaK0aCxiQ-Fy1hIRx7AU8f2STxIb5Xuc1QyqOnvuflJCCRSfHdvVna4RMiOE2_z1WzzexaVFtq_F2jeg1Ut-KmRQRBFQpEkImVh3la-zlj0SafnOmyPmx9f2SJr4z8-NerJ96hSss3YfMiNG5STvTun6Qo1dCmJX1vd6MKw6j0ipho45_uQSDyiCAmMK0XMw6WkXnhNXSLwqoS8vG3GPVsq10F4tAhQBGS4QE_qF_GnLvy2RTnn4oG3VYaAHybBofXEGdIO4s8N1OUqcDmpN-Q54wszjA6M"
/// expire_at : "2023-04-22T14:21:26.000000Z"
/// id : 30
/// name : "shimaa"
/// email : "shimaa6696@gmail.com"
/// user_type : 3
/// gender : "female"
/// date_of_birth : "6-6-96"
/// image : "https://admintest.wannareach.com/storage/images/users/https://admintest.wannareach.com/storage/uploads/users/image641b0dec7c3dc1679494636.jpg"

class Body {
  Body({
    String? token,
    String? expireAt,
    num? id,
    String? name,
    String? email,
    num? userType,
    String? gender,
    String? dateOfBirth,
    String? image,
  }) {
    _token = token;
    _expireAt = expireAt;
    _id = id;
    _name = name;
    _email = email;
    _userType = userType;
    _gender = gender;
    _dateOfBirth = dateOfBirth;
    _image = image;
  }

  Body.fromJson(dynamic json) {
    _token = json['token'];
    _expireAt = json['expire_at'];
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _userType = json['user_type'];
    _gender = json['gender'];
    _dateOfBirth = json['date_of_birth'];
    _image = json['image'];
  }

  String? _token;
  String? _expireAt;
  num? _id;
  String? _name;
  String? _email;
  num? _userType;
  String? _gender;
  String? _dateOfBirth;
  String? _image;

  Body copyWith({
    String? token,
    String? expireAt,
    num? id,
    String? name,
    String? email,
    num? userType,
    String? gender,
    String? dateOfBirth,
    String? image,
  }) =>
      Body(
        token: token ?? _token,
        expireAt: expireAt ?? _expireAt,
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        userType: userType ?? _userType,
        gender: gender ?? _gender,
        dateOfBirth: dateOfBirth ?? _dateOfBirth,
        image: image ?? _image,
      );

  String? get token => _token;

  String? get expireAt => _expireAt;

  num? get id => _id;

  String? get name => _name;

  String? get email => _email;

  num? get userType => _userType;

  String? get gender => _gender;

  String? get dateOfBirth => _dateOfBirth;

  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['expire_at'] = _expireAt;
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['user_type'] = _userType;
    map['gender'] = _gender;
    map['date_of_birth'] = _dateOfBirth;
    map['image'] = _image;
    return map;
  }
}
