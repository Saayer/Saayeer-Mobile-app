// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_device_informations.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginDeviceInformations extends LoginDeviceInformations {
  @override
  final bool? isMobile;
  @override
  final String? deviceInformation;
  @override
  final String? locationInformations;

  factory _$LoginDeviceInformations(
          [void Function(LoginDeviceInformationsBuilder)? updates]) =>
      (new LoginDeviceInformationsBuilder()..update(updates))._build();

  _$LoginDeviceInformations._(
      {this.isMobile, this.deviceInformation, this.locationInformations})
      : super._();

  @override
  LoginDeviceInformations rebuild(
          void Function(LoginDeviceInformationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginDeviceInformationsBuilder toBuilder() =>
      new LoginDeviceInformationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginDeviceInformations &&
        isMobile == other.isMobile &&
        deviceInformation == other.deviceInformation &&
        locationInformations == other.locationInformations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isMobile.hashCode);
    _$hash = $jc(_$hash, deviceInformation.hashCode);
    _$hash = $jc(_$hash, locationInformations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginDeviceInformations')
          ..add('isMobile', isMobile)
          ..add('deviceInformation', deviceInformation)
          ..add('locationInformations', locationInformations))
        .toString();
  }
}

class LoginDeviceInformationsBuilder
    implements
        Builder<LoginDeviceInformations, LoginDeviceInformationsBuilder> {
  _$LoginDeviceInformations? _$v;

  bool? _isMobile;
  bool? get isMobile => _$this._isMobile;
  set isMobile(bool? isMobile) => _$this._isMobile = isMobile;

  String? _deviceInformation;
  String? get deviceInformation => _$this._deviceInformation;
  set deviceInformation(String? deviceInformation) =>
      _$this._deviceInformation = deviceInformation;

  String? _locationInformations;
  String? get locationInformations => _$this._locationInformations;
  set locationInformations(String? locationInformations) =>
      _$this._locationInformations = locationInformations;

  LoginDeviceInformationsBuilder() {
    LoginDeviceInformations._defaults(this);
  }

  LoginDeviceInformationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isMobile = $v.isMobile;
      _deviceInformation = $v.deviceInformation;
      _locationInformations = $v.locationInformations;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginDeviceInformations other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginDeviceInformations;
  }

  @override
  void update(void Function(LoginDeviceInformationsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginDeviceInformations build() => _build();

  _$LoginDeviceInformations _build() {
    final _$result = _$v ??
        new _$LoginDeviceInformations._(
            isMobile: isMobile,
            deviceInformation: deviceInformation,
            locationInformations: locationInformations);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
