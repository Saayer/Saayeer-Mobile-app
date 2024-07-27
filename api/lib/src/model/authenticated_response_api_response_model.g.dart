// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_response_api_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthenticatedResponseApiResponseModel
    extends AuthenticatedResponseApiResponseModel {
  @override
  final bool? success;
  @override
  final AuthenticatedResponse? data;
  @override
  final String? errorMessage;
  @override
  final String? reqSecureKey;

  factory _$AuthenticatedResponseApiResponseModel(
          [void Function(AuthenticatedResponseApiResponseModelBuilder)?
              updates]) =>
      (new AuthenticatedResponseApiResponseModelBuilder()..update(updates))
          ._build();

  _$AuthenticatedResponseApiResponseModel._(
      {this.success, this.data, this.errorMessage, this.reqSecureKey})
      : super._();

  @override
  AuthenticatedResponseApiResponseModel rebuild(
          void Function(AuthenticatedResponseApiResponseModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticatedResponseApiResponseModelBuilder toBuilder() =>
      new AuthenticatedResponseApiResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticatedResponseApiResponseModel &&
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
    return (newBuiltValueToStringHelper(
            r'AuthenticatedResponseApiResponseModel')
          ..add('success', success)
          ..add('data', data)
          ..add('errorMessage', errorMessage)
          ..add('reqSecureKey', reqSecureKey))
        .toString();
  }
}

class AuthenticatedResponseApiResponseModelBuilder
    implements
        Builder<AuthenticatedResponseApiResponseModel,
            AuthenticatedResponseApiResponseModelBuilder> {
  _$AuthenticatedResponseApiResponseModel? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  AuthenticatedResponseBuilder? _data;
  AuthenticatedResponseBuilder get data =>
      _$this._data ??= new AuthenticatedResponseBuilder();
  set data(AuthenticatedResponseBuilder? data) => _$this._data = data;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  String? _reqSecureKey;
  String? get reqSecureKey => _$this._reqSecureKey;
  set reqSecureKey(String? reqSecureKey) => _$this._reqSecureKey = reqSecureKey;

  AuthenticatedResponseApiResponseModelBuilder() {
    AuthenticatedResponseApiResponseModel._defaults(this);
  }

  AuthenticatedResponseApiResponseModelBuilder get _$this {
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
  void replace(AuthenticatedResponseApiResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthenticatedResponseApiResponseModel;
  }

  @override
  void update(
      void Function(AuthenticatedResponseApiResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthenticatedResponseApiResponseModel build() => _build();

  _$AuthenticatedResponseApiResponseModel _build() {
    _$AuthenticatedResponseApiResponseModel _$result;
    try {
      _$result = _$v ??
          new _$AuthenticatedResponseApiResponseModel._(
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
            r'AuthenticatedResponseApiResponseModel',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
