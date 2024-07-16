// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_information_request_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientsInformationRequestVM extends ClientsInformationRequestVM {
  @override
  final String? fullName;
  @override
  final String? address;
  @override
  final String? mobile;
  @override
  final String? email;
  @override
  final int? districtId;
  @override
  final int? cityId;
  @override
  final int? countryId;

  factory _$ClientsInformationRequestVM(
          [void Function(ClientsInformationRequestVMBuilder)? updates]) =>
      (new ClientsInformationRequestVMBuilder()..update(updates))._build();

  _$ClientsInformationRequestVM._(
      {this.fullName,
      this.address,
      this.mobile,
      this.email,
      this.districtId,
      this.cityId,
      this.countryId})
      : super._();

  @override
  ClientsInformationRequestVM rebuild(
          void Function(ClientsInformationRequestVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientsInformationRequestVMBuilder toBuilder() =>
      new ClientsInformationRequestVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientsInformationRequestVM &&
        fullName == other.fullName &&
        address == other.address &&
        mobile == other.mobile &&
        email == other.email &&
        districtId == other.districtId &&
        cityId == other.cityId &&
        countryId == other.countryId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, mobile.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, districtId.hashCode);
    _$hash = $jc(_$hash, cityId.hashCode);
    _$hash = $jc(_$hash, countryId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientsInformationRequestVM')
          ..add('fullName', fullName)
          ..add('address', address)
          ..add('mobile', mobile)
          ..add('email', email)
          ..add('districtId', districtId)
          ..add('cityId', cityId)
          ..add('countryId', countryId))
        .toString();
  }
}

class ClientsInformationRequestVMBuilder
    implements
        Builder<ClientsInformationRequestVM,
            ClientsInformationRequestVMBuilder> {
  _$ClientsInformationRequestVM? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _mobile;
  String? get mobile => _$this._mobile;
  set mobile(String? mobile) => _$this._mobile = mobile;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  int? _districtId;
  int? get districtId => _$this._districtId;
  set districtId(int? districtId) => _$this._districtId = districtId;

  int? _cityId;
  int? get cityId => _$this._cityId;
  set cityId(int? cityId) => _$this._cityId = cityId;

  int? _countryId;
  int? get countryId => _$this._countryId;
  set countryId(int? countryId) => _$this._countryId = countryId;

  ClientsInformationRequestVMBuilder() {
    ClientsInformationRequestVM._defaults(this);
  }

  ClientsInformationRequestVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _address = $v.address;
      _mobile = $v.mobile;
      _email = $v.email;
      _districtId = $v.districtId;
      _cityId = $v.cityId;
      _countryId = $v.countryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientsInformationRequestVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientsInformationRequestVM;
  }

  @override
  void update(void Function(ClientsInformationRequestVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientsInformationRequestVM build() => _build();

  _$ClientsInformationRequestVM _build() {
    final _$result = _$v ??
        new _$ClientsInformationRequestVM._(
            fullName: fullName,
            address: address,
            mobile: mobile,
            email: email,
            districtId: districtId,
            cityId: cityId,
            countryId: countryId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
