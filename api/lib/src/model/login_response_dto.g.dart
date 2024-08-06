// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginResponseDto extends LoginResponseDto {
  @override
  final String? verificationCodeTemp;

  factory _$LoginResponseDto(
          [void Function(LoginResponseDtoBuilder)? updates]) =>
      (new LoginResponseDtoBuilder()..update(updates))._build();

  _$LoginResponseDto._({this.verificationCodeTemp}) : super._();

  @override
  LoginResponseDto rebuild(void Function(LoginResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginResponseDtoBuilder toBuilder() =>
      new LoginResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginResponseDto &&
        verificationCodeTemp == other.verificationCodeTemp;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, verificationCodeTemp.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginResponseDto')
          ..add('verificationCodeTemp', verificationCodeTemp))
        .toString();
  }
}

class LoginResponseDtoBuilder
    implements Builder<LoginResponseDto, LoginResponseDtoBuilder> {
  _$LoginResponseDto? _$v;

  String? _verificationCodeTemp;
  String? get verificationCodeTemp => _$this._verificationCodeTemp;
  set verificationCodeTemp(String? verificationCodeTemp) =>
      _$this._verificationCodeTemp = verificationCodeTemp;

  LoginResponseDtoBuilder() {
    LoginResponseDto._defaults(this);
  }

  LoginResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _verificationCodeTemp = $v.verificationCodeTemp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginResponseDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginResponseDto;
  }

  @override
  void update(void Function(LoginResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginResponseDto build() => _build();

  _$LoginResponseDto _build() {
    final _$result = _$v ??
        new _$LoginResponseDto._(verificationCodeTemp: verificationCodeTemp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
