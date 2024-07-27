// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_information_request_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BusinessInformationRequestVM extends BusinessInformationRequestVM {
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
  final int? districtId;
  @override
  final int? cityId;
  @override
  final int? countryId;

  factory _$BusinessInformationRequestVM(
          [void Function(BusinessInformationRequestVMBuilder)? updates]) =>
      (new BusinessInformationRequestVMBuilder()..update(updates))._build();

  _$BusinessInformationRequestVM._(
      {this.companyName,
      this.email,
      this.mobileNumber,
      this.commercialRegistrationNo,
      this.shortAddress,
      this.districtId,
      this.cityId,
      this.countryId})
      : super._();

  @override
  BusinessInformationRequestVM rebuild(
          void Function(BusinessInformationRequestVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BusinessInformationRequestVMBuilder toBuilder() =>
      new BusinessInformationRequestVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BusinessInformationRequestVM &&
        companyName == other.companyName &&
        email == other.email &&
        mobileNumber == other.mobileNumber &&
        commercialRegistrationNo == other.commercialRegistrationNo &&
        shortAddress == other.shortAddress &&
        districtId == other.districtId &&
        cityId == other.cityId &&
        countryId == other.countryId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, mobileNumber.hashCode);
    _$hash = $jc(_$hash, commercialRegistrationNo.hashCode);
    _$hash = $jc(_$hash, shortAddress.hashCode);
    _$hash = $jc(_$hash, districtId.hashCode);
    _$hash = $jc(_$hash, cityId.hashCode);
    _$hash = $jc(_$hash, countryId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BusinessInformationRequestVM')
          ..add('companyName', companyName)
          ..add('email', email)
          ..add('mobileNumber', mobileNumber)
          ..add('commercialRegistrationNo', commercialRegistrationNo)
          ..add('shortAddress', shortAddress)
          ..add('districtId', districtId)
          ..add('cityId', cityId)
          ..add('countryId', countryId))
        .toString();
  }
}

class BusinessInformationRequestVMBuilder
    implements
        Builder<BusinessInformationRequestVM,
            BusinessInformationRequestVMBuilder> {
  _$BusinessInformationRequestVM? _$v;

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

  int? _districtId;
  int? get districtId => _$this._districtId;
  set districtId(int? districtId) => _$this._districtId = districtId;

  int? _cityId;
  int? get cityId => _$this._cityId;
  set cityId(int? cityId) => _$this._cityId = cityId;

  int? _countryId;
  int? get countryId => _$this._countryId;
  set countryId(int? countryId) => _$this._countryId = countryId;

  BusinessInformationRequestVMBuilder() {
    BusinessInformationRequestVM._defaults(this);
  }

  BusinessInformationRequestVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _companyName = $v.companyName;
      _email = $v.email;
      _mobileNumber = $v.mobileNumber;
      _commercialRegistrationNo = $v.commercialRegistrationNo;
      _shortAddress = $v.shortAddress;
      _districtId = $v.districtId;
      _cityId = $v.cityId;
      _countryId = $v.countryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BusinessInformationRequestVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BusinessInformationRequestVM;
  }

  @override
  void update(void Function(BusinessInformationRequestVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BusinessInformationRequestVM build() => _build();

  _$BusinessInformationRequestVM _build() {
    final _$result = _$v ??
        new _$BusinessInformationRequestVM._(
            companyName: companyName,
            email: email,
            mobileNumber: mobileNumber,
            commercialRegistrationNo: commercialRegistrationNo,
            shortAddress: shortAddress,
            districtId: districtId,
            cityId: cityId,
            countryId: countryId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
