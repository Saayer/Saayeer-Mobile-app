// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_vm_api_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserProfileVMApiResponseModel extends UserProfileVMApiResponseModel {
  @override
  final bool? success;
  @override
  final UserProfileVM? data;
  @override
  final String? errorMessage;
  @override
  final String? reqSecureKey;

  factory _$UserProfileVMApiResponseModel(
          [void Function(UserProfileVMApiResponseModelBuilder)? updates]) =>
      (new UserProfileVMApiResponseModelBuilder()..update(updates))._build();

  _$UserProfileVMApiResponseModel._(
      {this.success, this.data, this.errorMessage, this.reqSecureKey})
      : super._();

  @override
  UserProfileVMApiResponseModel rebuild(
          void Function(UserProfileVMApiResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileVMApiResponseModelBuilder toBuilder() =>
      new UserProfileVMApiResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfileVMApiResponseModel &&
        success == other.success &&
        data == other.data &&
        errorMessage == other.errorMessage &&
        reqSecureKey == other.reqSecureKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, reqSecureKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserProfileVMApiResponseModel')
          ..add('success', success)
          ..add('data', data)
          ..add('errorMessage', errorMessage)
          ..add('reqSecureKey', reqSecureKey))
        .toString();
  }
}

class UserProfileVMApiResponseModelBuilder
    implements
        Builder<UserProfileVMApiResponseModel,
            UserProfileVMApiResponseModelBuilder> {
  _$UserProfileVMApiResponseModel? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UserProfileVMBuilder? _data;
  UserProfileVMBuilder get data => _$this._data ??= new UserProfileVMBuilder();
  set data(UserProfileVMBuilder? data) => _$this._data = data;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  String? _reqSecureKey;
  String? get reqSecureKey => _$this._reqSecureKey;
  set reqSecureKey(String? reqSecureKey) => _$this._reqSecureKey = reqSecureKey;

  UserProfileVMApiResponseModelBuilder() {
    UserProfileVMApiResponseModel._defaults(this);
  }

  UserProfileVMApiResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _data = $v.data?.toBuilder();
      _errorMessage = $v.errorMessage;
      _reqSecureKey = $v.reqSecureKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfileVMApiResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserProfileVMApiResponseModel;
  }

  @override
  void update(void Function(UserProfileVMApiResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserProfileVMApiResponseModel build() => _build();

  _$UserProfileVMApiResponseModel _build() {
    _$UserProfileVMApiResponseModel _$result;
    try {
      _$result = _$v ??
          new _$UserProfileVMApiResponseModel._(
              success: success,
              data: _data?.build(),
              errorMessage: errorMessage,
              reqSecureKey: reqSecureKey);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserProfileVMApiResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
