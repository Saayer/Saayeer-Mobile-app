// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_response_verify.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthenticateResponseVerify extends AuthenticateResponseVerify {
  @override
  final String? otp;
  @override
  final String? message;

  factory _$AuthenticateResponseVerify(
          [void Function(AuthenticateResponseVerifyBuilder)? updates]) =>
      (new AuthenticateResponseVerifyBuilder()..update(updates))._build();

  _$AuthenticateResponseVerify._({this.otp, this.message}) : super._();

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
        otp == other.otp &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, otp.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthenticateResponseVerify')
          ..add('otp', otp)
          ..add('message', message))
        .toString();
  }
}

class AuthenticateResponseVerifyBuilder
    implements
        Builder<AuthenticateResponseVerify, AuthenticateResponseVerifyBuilder> {
  _$AuthenticateResponseVerify? _$v;

  String? _otp;
  String? get otp => _$this._otp;
  set otp(String? otp) => _$this._otp = otp;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AuthenticateResponseVerifyBuilder() {
    AuthenticateResponseVerify._defaults(this);
  }

  AuthenticateResponseVerifyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _otp = $v.otp;
      _message = $v.message;
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
    final _$result =
        _$v ?? new _$AuthenticateResponseVerify._(otp: otp, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
