// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_information_response_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PersonalInformationResponseVM extends PersonalInformationResponseVM {
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? nationalId;
  @override
  final String? address;
  @override
  final String? district;
  @override
  final String? city;
  @override
  final String? country;

  factory _$PersonalInformationResponseVM(
          [void Function(PersonalInformationResponseVMBuilder)? updates]) =>
      (new PersonalInformationResponseVMBuilder()..update(updates))._build();

  _$PersonalInformationResponseVM._(
      {this.name,
      this.email,
      this.nationalId,
      this.address,
      this.district,
      this.city,
      this.country})
      : super._();

  @override
  PersonalInformationResponseVM rebuild(
          void Function(PersonalInformationResponseVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonalInformationResponseVMBuilder toBuilder() =>
      new PersonalInformationResponseVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonalInformationResponseVM &&
        name == other.name &&
        email == other.email &&
        nationalId == other.nationalId &&
        address == other.address &&
        district == other.district &&
        city == other.city &&
        country == other.country;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, nationalId.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, district.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PersonalInformationResponseVM')
          ..add('name', name)
          ..add('email', email)
          ..add('nationalId', nationalId)
          ..add('address', address)
          ..add('district', district)
          ..add('city', city)
          ..add('country', country))
        .toString();
  }
}

class PersonalInformationResponseVMBuilder
    implements
        Builder<PersonalInformationResponseVM,
            PersonalInformationResponseVMBuilder> {
  _$PersonalInformationResponseVM? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _nationalId;
  String? get nationalId => _$this._nationalId;
  set nationalId(String? nationalId) => _$this._nationalId = nationalId;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _district;
  String? get district => _$this._district;
  set district(String? district) => _$this._district = district;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  PersonalInformationResponseVMBuilder() {
    PersonalInformationResponseVM._defaults(this);
  }

  PersonalInformationResponseVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _email = $v.email;
      _nationalId = $v.nationalId;
      _address = $v.address;
      _district = $v.district;
      _city = $v.city;
      _country = $v.country;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersonalInformationResponseVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PersonalInformationResponseVM;
  }

  @override
  void update(void Function(PersonalInformationResponseVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonalInformationResponseVM build() => _build();

  _$PersonalInformationResponseVM _build() {
    final _$result = _$v ??
        new _$PersonalInformationResponseVM._(
            name: name,
            email: email,
            nationalId: nationalId,
            address: address,
            district: district,
            city: city,
            country: country);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
