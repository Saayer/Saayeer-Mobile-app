// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_information_response_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BusinessInformationResponseVM extends BusinessInformationResponseVM {
  @override
  final String? companyName;
  @override
  final String? email;
  @override
  final String? mobileNumber;
  @override
  final String? commercialRegistrationNo;
  @override
  final String? shortAddress;
  @override
  final String? district;
  @override
  final String? city;
  @override
  final String? country;

  factory _$BusinessInformationResponseVM(
          [void Function(BusinessInformationResponseVMBuilder)? updates]) =>
      (new BusinessInformationResponseVMBuilder()..update(updates))._build();

  _$BusinessInformationResponseVM._(
      {this.companyName,
      this.email,
      this.mobileNumber,
      this.commercialRegistrationNo,
      this.shortAddress,
      this.district,
      this.city,
      this.country})
      : super._();

  @override
  BusinessInformationResponseVM rebuild(
          void Function(BusinessInformationResponseVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BusinessInformationResponseVMBuilder toBuilder() =>
      new BusinessInformationResponseVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BusinessInformationResponseVM &&
        companyName == other.companyName &&
        email == other.email &&
        mobileNumber == other.mobileNumber &&
        commercialRegistrationNo == other.commercialRegistrationNo &&
        shortAddress == other.shortAddress &&
        district == other.district &&
        city == other.city &&
        country == other.country;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, mobileNumber.hashCode);
    _$hash = $jc(_$hash, commercialRegistrationNo.hashCode);
    _$hash = $jc(_$hash, shortAddress.hashCode);
    _$hash = $jc(_$hash, district.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BusinessInformationResponseVM')
          ..add('companyName', companyName)
          ..add('email', email)
          ..add('mobileNumber', mobileNumber)
          ..add('commercialRegistrationNo', commercialRegistrationNo)
          ..add('shortAddress', shortAddress)
          ..add('district', district)
          ..add('city', city)
          ..add('country', country))
        .toString();
  }
}

class BusinessInformationResponseVMBuilder
    implements
        Builder<BusinessInformationResponseVM,
            BusinessInformationResponseVMBuilder> {
  _$BusinessInformationResponseVM? _$v;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _mobileNumber;
  String? get mobileNumber => _$this._mobileNumber;
  set mobileNumber(String? mobileNumber) => _$this._mobileNumber = mobileNumber;

  String? _commercialRegistrationNo;
  String? get commercialRegistrationNo => _$this._commercialRegistrationNo;
  set commercialRegistrationNo(String? commercialRegistrationNo) =>
      _$this._commercialRegistrationNo = commercialRegistrationNo;

  String? _shortAddress;
  String? get shortAddress => _$this._shortAddress;
  set shortAddress(String? shortAddress) => _$this._shortAddress = shortAddress;

  String? _district;
  String? get district => _$this._district;
  set district(String? district) => _$this._district = district;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  BusinessInformationResponseVMBuilder() {
    BusinessInformationResponseVM._defaults(this);
  }

  BusinessInformationResponseVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _companyName = $v.companyName;
      _email = $v.email;
      _mobileNumber = $v.mobileNumber;
      _commercialRegistrationNo = $v.commercialRegistrationNo;
      _shortAddress = $v.shortAddress;
      _district = $v.district;
      _city = $v.city;
      _country = $v.country;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BusinessInformationResponseVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BusinessInformationResponseVM;
  }

  @override
  void update(void Function(BusinessInformationResponseVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BusinessInformationResponseVM build() => _build();

  _$BusinessInformationResponseVM _build() {
    final _$result = _$v ??
        new _$BusinessInformationResponseVM._(
            companyName: companyName,
            email: email,
            mobileNumber: mobileNumber,
            commercialRegistrationNo: commercialRegistrationNo,
            shortAddress: shortAddress,
            district: district,
            city: city,
            country: country);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
