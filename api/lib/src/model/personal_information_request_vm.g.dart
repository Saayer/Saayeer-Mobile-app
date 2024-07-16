// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_information_request_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PersonalInformationRequestVM extends PersonalInformationRequestVM {
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? nationalId;
  @override
  final String? address;
  @override
  final int? districtId;
  @override
  final int? cityId;
  @override
  final int? countryId;

  factory _$PersonalInformationRequestVM(
          [void Function(PersonalInformationRequestVMBuilder)? updates]) =>
      (new PersonalInformationRequestVMBuilder()..update(updates))._build();

  _$PersonalInformationRequestVM._(
      {this.name,
      this.email,
      this.nationalId,
      this.address,
      this.districtId,
      this.cityId,
      this.countryId})
      : super._();

  @override
  PersonalInformationRequestVM rebuild(
          void Function(PersonalInformationRequestVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonalInformationRequestVMBuilder toBuilder() =>
      new PersonalInformationRequestVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonalInformationRequestVM &&
        name == other.name &&
        email == other.email &&
        nationalId == other.nationalId &&
        address == other.address &&
        districtId == other.districtId &&
        cityId == other.cityId &&
        countryId == other.countryId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, nationalId.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, districtId.hashCode);
    _$hash = $jc(_$hash, cityId.hashCode);
    _$hash = $jc(_$hash, countryId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PersonalInformationRequestVM')
          ..add('name', name)
          ..add('email', email)
          ..add('nationalId', nationalId)
          ..add('address', address)
          ..add('districtId', districtId)
          ..add('cityId', cityId)
          ..add('countryId', countryId))
        .toString();
  }
}

class PersonalInformationRequestVMBuilder
    implements
        Builder<PersonalInformationRequestVM,
            PersonalInformationRequestVMBuilder> {
  _$PersonalInformationRequestVM? _$v;

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

  int? _districtId;
  int? get districtId => _$this._districtId;
  set districtId(int? districtId) => _$this._districtId = districtId;

  int? _cityId;
  int? get cityId => _$this._cityId;
  set cityId(int? cityId) => _$this._cityId = cityId;

  int? _countryId;
  int? get countryId => _$this._countryId;
  set countryId(int? countryId) => _$this._countryId = countryId;

  PersonalInformationRequestVMBuilder() {
    PersonalInformationRequestVM._defaults(this);
  }

  PersonalInformationRequestVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _email = $v.email;
      _nationalId = $v.nationalId;
      _address = $v.address;
      _districtId = $v.districtId;
      _cityId = $v.cityId;
      _countryId = $v.countryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersonalInformationRequestVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PersonalInformationRequestVM;
  }

  @override
  void update(void Function(PersonalInformationRequestVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonalInformationRequestVM build() => _build();

  _$PersonalInformationRequestVM _build() {
    final _$result = _$v ??
        new _$PersonalInformationRequestVM._(
            name: name,
            email: email,
            nationalId: nationalId,
            address: address,
            districtId: districtId,
            cityId: cityId,
            countryId: countryId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
