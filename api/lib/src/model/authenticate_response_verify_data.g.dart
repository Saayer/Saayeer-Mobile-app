// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_response_verify_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthenticateResponseVerifyData extends AuthenticateResponseVerifyData {
  @override
  final String? otp;
  @override
  final String? message;

  factory _$AuthenticateResponseVerifyData(
          [void Function(AuthenticateResponseVerifyDataBuilder)? updates]) =>
      (new AuthenticateResponseVerifyDataBuilder()..update(updates))._build();

  _$AuthenticateResponseVerifyData._({this.otp, this.message}) : super._();

  @override
  AuthenticateResponseVerifyData rebuild(
          void Function(AuthenticateResponseVerifyDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticateResponseVerifyDataBuilder toBuilder() =>
      new AuthenticateResponseVerifyDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticateResponseVerifyData &&
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
    return (newBuiltValueToStringHelper(r'AuthenticateResponseVerifyData')
          ..add('otp', otp)
          ..add('message', message))
        .toString();
  }
}

class AuthenticateResponseVerifyDataBuilder
    implements
        Builder<AuthenticateResponseVerifyData,
            AuthenticateResponseVerifyDataBuilder> {
  _$AuthenticateResponseVerifyData? _$v;

  String? _otp;
  String? get otp => _$this._otp;
  set otp(String? otp) => _$this._otp = otp;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AuthenticateResponseVerifyDataBuilder() {
    AuthenticateResponseVerifyData._defaults(this);
  }

  AuthenticateResponseVerifyDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _otp = $v.otp;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthenticateResponseVerifyData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthenticateResponseVerifyData;
  }

  @override
  void update(void Function(AuthenticateResponseVerifyDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthenticateResponseVerifyData build() => _build();

  _$AuthenticateResponseVerifyData _build() {
    final _$result = _$v ??
        new _$AuthenticateResponseVerifyData._(otp: otp, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
