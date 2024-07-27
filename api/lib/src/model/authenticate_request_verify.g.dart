// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_request_verify.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthenticateRequestVerify extends AuthenticateRequestVerify {
  @override
  final String mobileNumber;
  @override
  final String otp;
  @override
  final LoginDeviceInformations? deviceInformation;

  factory _$AuthenticateRequestVerify(
          [void Function(AuthenticateRequestVerifyBuilder)? updates]) =>
      (new AuthenticateRequestVerifyBuilder()..update(updates))._build();

  _$AuthenticateRequestVerify._(
      {required this.mobileNumber, required this.otp, this.deviceInformation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        mobileNumber, r'AuthenticateRequestVerify', 'mobileNumber');
    BuiltValueNullFieldError.checkNotNull(
        otp, r'AuthenticateRequestVerify', 'otp');
  }

  @override
  AuthenticateRequestVerify rebuild(
          void Function(AuthenticateRequestVerifyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticateRequestVerifyBuilder toBuilder() =>
      new AuthenticateRequestVerifyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticateRequestVerify &&
        mobileNumber == other.mobileNumber &&
        otp == other.otp &&
        deviceInformation == other.deviceInformation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mobileNumber.hashCode);
    _$hash = $jc(_$hash, otp.hashCode);
    _$hash = $jc(_$hash, deviceInformation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthenticateRequestVerify')
          ..add('mobileNumber', mobileNumber)
          ..add('otp', otp)
          ..add('deviceInformation', deviceInformation))
        .toString();
  }
}

class AuthenticateRequestVerifyBuilder
    implements
        Builder<AuthenticateRequestVerify, AuthenticateRequestVerifyBuilder> {
  _$AuthenticateRequestVerify? _$v;

  String? _mobileNumber;
  String? get mobileNumber => _$this._mobileNumber;
  set mobileNumber(String? mobileNumber) => _$this._mobileNumber = mobileNumber;

  String? _otp;
  String? get otp => _$this._otp;
  set otp(String? otp) => _$this._otp = otp;

  LoginDeviceInformationsBuilder? _deviceInformation;
  LoginDeviceInformationsBuilder get deviceInformation =>
      _$this._deviceInformation ??= new LoginDeviceInformationsBuilder();
  set deviceInformation(LoginDeviceInformationsBuilder? deviceInformation) =>
      _$this._deviceInformation = deviceInformation;

  AuthenticateRequestVerifyBuilder() {
    AuthenticateRequestVerify._defaults(this);
  }

  AuthenticateRequestVerifyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mobileNumber = $v.mobileNumber;
      _otp = $v.otp;
      _deviceInformation = $v.deviceInformation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthenticateRequestVerify other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthenticateRequestVerify;
  }

  @override
  void update(void Function(AuthenticateRequestVerifyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthenticateRequestVerify build() => _build();

  _$AuthenticateRequestVerify _build() {
    _$AuthenticateRequestVerify _$result;
    try {
      _$result = _$v ??
          new _$AuthenticateRequestVerify._(
              mobileNumber: BuiltValueNullFieldError.checkNotNull(
                  mobileNumber, r'AuthenticateRequestVerify', 'mobileNumber'),
              otp: BuiltValueNullFieldError.checkNotNull(
                  otp, r'AuthenticateRequestVerify', 'otp'),
              deviceInformation: _deviceInformation?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deviceInformation';
        _deviceInformation?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthenticateRequestVerify', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
