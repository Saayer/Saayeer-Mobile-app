// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TokenRequestDto extends TokenRequestDto {
  @override
  final String? phoneNumber;
  @override
  final String? verificationCode;

  factory _$TokenRequestDto([void Function(TokenRequestDtoBuilder)? updates]) =>
      (new TokenRequestDtoBuilder()..update(updates))._build();

  _$TokenRequestDto._({this.phoneNumber, this.verificationCode}) : super._();

  @override
  TokenRequestDto rebuild(void Function(TokenRequestDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenRequestDtoBuilder toBuilder() =>
      new TokenRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenRequestDto &&
        phoneNumber == other.phoneNumber &&
        verificationCode == other.verificationCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, verificationCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TokenRequestDto')
          ..add('phoneNumber', phoneNumber)
          ..add('verificationCode', verificationCode))
        .toString();
  }
}

class TokenRequestDtoBuilder
    implements Builder<TokenRequestDto, TokenRequestDtoBuilder> {
  _$TokenRequestDto? _$v;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _verificationCode;
  String? get verificationCode => _$this._verificationCode;
  set verificationCode(String? verificationCode) =>
      _$this._verificationCode = verificationCode;

  TokenRequestDtoBuilder() {
    TokenRequestDto._defaults(this);
  }

  TokenRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNumber = $v.phoneNumber;
      _verificationCode = $v.verificationCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TokenRequestDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TokenRequestDto;
  }

  @override
  void update(void Function(TokenRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TokenRequestDto build() => _build();

  _$TokenRequestDto _build() {
    final _$result = _$v ??
        new _$TokenRequestDto._(
            phoneNumber: phoneNumber, verificationCode: verificationCode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
