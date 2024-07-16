// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_vm_api_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserInformationVMApiResponseModel
    extends UserInformationVMApiResponseModel {
  @override
  final bool? success;
  @override
  final UserInformationVM? data;
  @override
  final String? errorMessage;
  @override
  final String? reqSecureKey;

  factory _$UserInformationVMApiResponseModel(
          [void Function(UserInformationVMApiResponseModelBuilder)? updates]) =>
      (new UserInformationVMApiResponseModelBuilder()..update(updates))
          ._build();

  _$UserInformationVMApiResponseModel._(
      {this.success, this.data, this.errorMessage, this.reqSecureKey})
      : super._();

  @override
  UserInformationVMApiResponseModel rebuild(
          void Function(UserInformationVMApiResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserInformationVMApiResponseModelBuilder toBuilder() =>
      new UserInformationVMApiResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserInformationVMApiResponseModel &&
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
    return (newBuiltValueToStringHelper(r'UserInformationVMApiResponseModel')
          ..add('success', success)
          ..add('data', data)
          ..add('errorMessage', errorMessage)
          ..add('reqSecureKey', reqSecureKey))
        .toString();
  }
}

class UserInformationVMApiResponseModelBuilder
    implements
        Builder<UserInformationVMApiResponseModel,
            UserInformationVMApiResponseModelBuilder> {
  _$UserInformationVMApiResponseModel? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UserInformationVMBuilder? _data;
  UserInformationVMBuilder get data =>
      _$this._data ??= new UserInformationVMBuilder();
  set data(UserInformationVMBuilder? data) => _$this._data = data;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  String? _reqSecureKey;
  String? get reqSecureKey => _$this._reqSecureKey;
  set reqSecureKey(String? reqSecureKey) => _$this._reqSecureKey = reqSecureKey;

  UserInformationVMApiResponseModelBuilder() {
    UserInformationVMApiResponseModel._defaults(this);
  }

  UserInformationVMApiResponseModelBuilder get _$this {
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
  void replace(UserInformationVMApiResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserInformationVMApiResponseModel;
  }

  @override
  void update(
      void Function(UserInformationVMApiResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserInformationVMApiResponseModel build() => _build();

  _$UserInformationVMApiResponseModel _build() {
    _$UserInformationVMApiResponseModel _$result;
    try {
      _$result = _$v ??
          new _$UserInformationVMApiResponseModel._(
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
            r'UserInformationVMApiResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
