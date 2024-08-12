// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_get_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientGetDto extends ClientGetDto {
  @override
  final String? fullName;
  @override
  final String? phoneNo;
  @override
  final String? email;
  @override
  final String? businessName;

  factory _$ClientGetDto([void Function(ClientGetDtoBuilder)? updates]) =>
      (new ClientGetDtoBuilder()..update(updates))._build();

  _$ClientGetDto._({this.fullName, this.phoneNo, this.email, this.businessName})
      : super._();

  @override
  ClientGetDto rebuild(void Function(ClientGetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientGetDtoBuilder toBuilder() => new ClientGetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientGetDto &&
        fullName == other.fullName &&
        phoneNo == other.phoneNo &&
        email == other.email &&
        businessName == other.businessName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, phoneNo.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, businessName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientGetDto')
          ..add('fullName', fullName)
          ..add('phoneNo', phoneNo)
          ..add('email', email)
          ..add('businessName', businessName))
        .toString();
  }
}

class ClientGetDtoBuilder
    implements Builder<ClientGetDto, ClientGetDtoBuilder> {
  _$ClientGetDto? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _phoneNo;
  String? get phoneNo => _$this._phoneNo;
  set phoneNo(String? phoneNo) => _$this._phoneNo = phoneNo;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _businessName;
  String? get businessName => _$this._businessName;
  set businessName(String? businessName) => _$this._businessName = businessName;

  ClientGetDtoBuilder() {
    ClientGetDto._defaults(this);
  }

  ClientGetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _phoneNo = $v.phoneNo;
      _email = $v.email;
      _businessName = $v.businessName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientGetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientGetDto;
  }

  @override
  void update(void Function(ClientGetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientGetDto build() => _build();

  _$ClientGetDto _build() {
    final _$result = _$v ??
        new _$ClientGetDto._(
            fullName: fullName,
            phoneNo: phoneNo,
            email: email,
            businessName: businessName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
