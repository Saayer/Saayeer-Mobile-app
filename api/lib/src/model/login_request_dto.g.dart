// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginRequestDto extends LoginRequestDto {
  @override
  final String? phoneNo;

  factory _$LoginRequestDto([void Function(LoginRequestDtoBuilder)? updates]) =>
      (new LoginRequestDtoBuilder()..update(updates))._build();

  _$LoginRequestDto._({this.phoneNo}) : super._();

  @override
  LoginRequestDto rebuild(void Function(LoginRequestDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginRequestDtoBuilder toBuilder() =>
      new LoginRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginRequestDto && phoneNo == other.phoneNo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phoneNo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginRequestDto')
          ..add('phoneNo', phoneNo))
        .toString();
  }
}

class LoginRequestDtoBuilder
    implements Builder<LoginRequestDto, LoginRequestDtoBuilder> {
  _$LoginRequestDto? _$v;

  String? _phoneNo;
  String? get phoneNo => _$this._phoneNo;
  set phoneNo(String? phoneNo) => _$this._phoneNo = phoneNo;

  LoginRequestDtoBuilder() {
    LoginRequestDto._defaults(this);
  }

  LoginRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNo = $v.phoneNo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginRequestDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginRequestDto;
  }

  @override
  void update(void Function(LoginRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginRequestDto build() => _build();

  _$LoginRequestDto _build() {
    final _$result = _$v ?? new _$LoginRequestDto._(phoneNo: phoneNo);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
