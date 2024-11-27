// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_add_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientAddDto extends ClientAddDto {
  @override
  final String? fullName;
  @override
  final String? phoneNo;
  @override
  final String? email;
  @override
  final String? businessName;
  @override
  final String? address;

  factory _$ClientAddDto([void Function(ClientAddDtoBuilder)? updates]) =>
      (new ClientAddDtoBuilder()..update(updates))._build();

  _$ClientAddDto._(
      {this.fullName,
      this.phoneNo,
      this.email,
      this.businessName,
      this.address})
      : super._();

  @override
  ClientAddDto rebuild(void Function(ClientAddDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientAddDtoBuilder toBuilder() => new ClientAddDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientAddDto &&
        fullName == other.fullName &&
        phoneNo == other.phoneNo &&
        email == other.email &&
        businessName == other.businessName &&
        address == other.address;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, phoneNo.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, businessName.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientAddDto')
          ..add('fullName', fullName)
          ..add('phoneNo', phoneNo)
          ..add('email', email)
          ..add('businessName', businessName)
          ..add('address', address))
        .toString();
  }
}

class ClientAddDtoBuilder
    implements Builder<ClientAddDto, ClientAddDtoBuilder> {
  _$ClientAddDto? _$v;

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

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  ClientAddDtoBuilder() {
    ClientAddDto._defaults(this);
  }

  ClientAddDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _phoneNo = $v.phoneNo;
      _email = $v.email;
      _businessName = $v.businessName;
      _address = $v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientAddDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientAddDto;
  }

  @override
  void update(void Function(ClientAddDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientAddDto build() => _build();

  _$ClientAddDto _build() {
    final _$result = _$v ??
        new _$ClientAddDto._(
            fullName: fullName,
            phoneNo: phoneNo,
            email: email,
            businessName: businessName,
            address: address);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
