// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_response_verify.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthenticateResponseVerify extends AuthenticateResponseVerify {
  @override
  final String? reqSecureKey;
  @override
  final bool? success;
  @override
  final AuthenticateResponseVerifyData? data;
  @override
  final String? errorMessage;

  factory _$AuthenticateResponseVerify(
          [void Function(AuthenticateResponseVerifyBuilder)? updates]) =>
      (new AuthenticateResponseVerifyBuilder()..update(updates))._build();

  _$AuthenticateResponseVerify._(
      {this.reqSecureKey, this.success, this.data, this.errorMessage})
      : super._();

  @override
  AuthenticateResponseVerify rebuild(
          void Function(AuthenticateResponseVerifyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticateResponseVerifyBuilder toBuilder() =>
      new AuthenticateResponseVerifyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticateResponseVerify &&
        reqSecureKey == other.reqSecureKey &&
        success == other.success &&
        data == other.data &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reqSecureKey.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthenticateResponseVerify')
          ..add('reqSecureKey', reqSecureKey)
          ..add('success', success)
          ..add('data', data)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class AuthenticateResponseVerifyBuilder
    implements
        Builder<AuthenticateResponseVerify, AuthenticateResponseVerifyBuilder> {
  _$AuthenticateResponseVerify? _$v;

  String? _reqSecureKey;
  String? get reqSecureKey => _$this._reqSecureKey;
  set reqSecureKey(String? reqSecureKey) => _$this._reqSecureKey = reqSecureKey;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  AuthenticateResponseVerifyDataBuilder? _data;
  AuthenticateResponseVerifyDataBuilder get data =>
      _$this._data ??= new AuthenticateResponseVerifyDataBuilder();
  set data(AuthenticateResponseVerifyDataBuilder? data) => _$this._data = data;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  AuthenticateResponseVerifyBuilder() {
    AuthenticateResponseVerify._defaults(this);
  }

  AuthenticateResponseVerifyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reqSecureKey = $v.reqSecureKey;
      _success = $v.success;
      _data = $v.data?.toBuilder();
      _errorMessage = $v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthenticateResponseVerify other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthenticateResponseVerify;
  }

  @override
  void update(void Function(AuthenticateResponseVerifyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthenticateResponseVerify build() => _build();

  _$AuthenticateResponseVerify _build() {
    _$AuthenticateResponseVerify _$result;
    try {
      _$result = _$v ??
          new _$AuthenticateResponseVerify._(
              reqSecureKey: reqSecureKey,
              success: success,
              data: _data?.build(),
              errorMessage: errorMessage);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthenticateResponseVerify', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
