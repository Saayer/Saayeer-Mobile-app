// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_information_response_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientsInformationResponseVM extends ClientsInformationResponseVM {
  @override
  final String? fullName;
  @override
  final String? address;
  @override
  final String? mobile;
  @override
  final String? email;
  @override
  final String? district;
  @override
  final String? city;
  @override
  final String? country;

  factory _$ClientsInformationResponseVM(
          [void Function(ClientsInformationResponseVMBuilder)? updates]) =>
      (new ClientsInformationResponseVMBuilder()..update(updates))._build();

  _$ClientsInformationResponseVM._(
      {this.fullName,
      this.address,
      this.mobile,
      this.email,
      this.district,
      this.city,
      this.country})
      : super._();

  @override
  ClientsInformationResponseVM rebuild(
          void Function(ClientsInformationResponseVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientsInformationResponseVMBuilder toBuilder() =>
      new ClientsInformationResponseVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientsInformationResponseVM &&
        fullName == other.fullName &&
        address == other.address &&
        mobile == other.mobile &&
        email == other.email &&
        district == other.district &&
        city == other.city &&
        country == other.country;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, mobile.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, district.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientsInformationResponseVM')
          ..add('fullName', fullName)
          ..add('address', address)
          ..add('mobile', mobile)
          ..add('email', email)
          ..add('district', district)
          ..add('city', city)
          ..add('country', country))
        .toString();
  }
}

class ClientsInformationResponseVMBuilder
    implements
        Builder<ClientsInformationResponseVM,
            ClientsInformationResponseVMBuilder> {
  _$ClientsInformationResponseVM? _$v;

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

  String? _district;
  String? get district => _$this._district;
  set district(String? district) => _$this._district = district;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  ClientsInformationResponseVMBuilder() {
    ClientsInformationResponseVM._defaults(this);
  }

  ClientsInformationResponseVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _address = $v.address;
      _mobile = $v.mobile;
      _email = $v.email;
      _district = $v.district;
      _city = $v.city;
      _country = $v.country;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientsInformationResponseVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientsInformationResponseVM;
  }

  @override
  void update(void Function(ClientsInformationResponseVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientsInformationResponseVM build() => _build();

  _$ClientsInformationResponseVM _build() {
    final _$result = _$v ??
        new _$ClientsInformationResponseVM._(
            fullName: fullName,
            address: address,
            mobile: mobile,
            email: email,
            district: district,
            city: city,
            country: country);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
