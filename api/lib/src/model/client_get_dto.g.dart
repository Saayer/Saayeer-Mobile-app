// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_get_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientGetDto extends ClientGetDto {
  @override
  final int? clientId;
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
  @override
  final String? createdAt;
  @override
  final int? totalShipments;
  @override
  final double? totalPaid;
  @override
  final double? totalGain;
  @override
  final int? numberOfStores;

  factory _$ClientGetDto([void Function(ClientGetDtoBuilder)? updates]) =>
      (new ClientGetDtoBuilder()..update(updates))._build();

  _$ClientGetDto._(
      {this.clientId,
      this.fullName,
      this.phoneNo,
      this.email,
      this.businessName,
      this.address,
      this.createdAt,
      this.totalShipments,
      this.totalPaid,
      this.totalGain,
      this.numberOfStores})
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
        clientId == other.clientId &&
        fullName == other.fullName &&
        phoneNo == other.phoneNo &&
        email == other.email &&
        businessName == other.businessName &&
        address == other.address &&
        createdAt == other.createdAt &&
        totalShipments == other.totalShipments &&
        totalPaid == other.totalPaid &&
        totalGain == other.totalGain &&
        numberOfStores == other.numberOfStores;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, phoneNo.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, businessName.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, totalShipments.hashCode);
    _$hash = $jc(_$hash, totalPaid.hashCode);
    _$hash = $jc(_$hash, totalGain.hashCode);
    _$hash = $jc(_$hash, numberOfStores.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientGetDto')
          ..add('clientId', clientId)
          ..add('fullName', fullName)
          ..add('phoneNo', phoneNo)
          ..add('email', email)
          ..add('businessName', businessName)
          ..add('address', address)
          ..add('createdAt', createdAt)
          ..add('totalShipments', totalShipments)
          ..add('totalPaid', totalPaid)
          ..add('totalGain', totalGain)
          ..add('numberOfStores', numberOfStores))
        .toString();
  }
}

class ClientGetDtoBuilder
    implements Builder<ClientGetDto, ClientGetDtoBuilder> {
  _$ClientGetDto? _$v;

  int? _clientId;
  int? get clientId => _$this._clientId;
  set clientId(int? clientId) => _$this._clientId = clientId;

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

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  int? _totalShipments;
  int? get totalShipments => _$this._totalShipments;
  set totalShipments(int? totalShipments) =>
      _$this._totalShipments = totalShipments;

  double? _totalPaid;
  double? get totalPaid => _$this._totalPaid;
  set totalPaid(double? totalPaid) => _$this._totalPaid = totalPaid;

  double? _totalGain;
  double? get totalGain => _$this._totalGain;
  set totalGain(double? totalGain) => _$this._totalGain = totalGain;

  int? _numberOfStores;
  int? get numberOfStores => _$this._numberOfStores;
  set numberOfStores(int? numberOfStores) =>
      _$this._numberOfStores = numberOfStores;

  ClientGetDtoBuilder() {
    ClientGetDto._defaults(this);
  }

  ClientGetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientId = $v.clientId;
      _fullName = $v.fullName;
      _phoneNo = $v.phoneNo;
      _email = $v.email;
      _businessName = $v.businessName;
      _address = $v.address;
      _createdAt = $v.createdAt;
      _totalShipments = $v.totalShipments;
      _totalPaid = $v.totalPaid;
      _totalGain = $v.totalGain;
      _numberOfStores = $v.numberOfStores;
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
            clientId: clientId,
            fullName: fullName,
            phoneNo: phoneNo,
            email: email,
            businessName: businessName,
            address: address,
            createdAt: createdAt,
            totalShipments: totalShipments,
            totalPaid: totalPaid,
            totalGain: totalGain,
            numberOfStores: numberOfStores);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
