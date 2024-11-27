// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_add_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StoreAddDto extends StoreAddDto {
  @override
  final String? addressDetails;
  @override
  final String? zipcode;
  @override
  final int? countryId;
  @override
  final int? governorateId;
  @override
  final int? cityId;
  @override
  final int? areaId;
  @override
  final int? storeId;
  @override
  final String? name;
  @override
  final String? financialRecordNumber;
  @override
  final String? freelanceCertificateNumber;
  @override
  final String? phoneNo;

  factory _$StoreAddDto([void Function(StoreAddDtoBuilder)? updates]) =>
      (new StoreAddDtoBuilder()..update(updates))._build();

  _$StoreAddDto._(
      {this.addressDetails,
      this.zipcode,
      this.countryId,
      this.governorateId,
      this.cityId,
      this.areaId,
      this.storeId,
      this.name,
      this.financialRecordNumber,
      this.freelanceCertificateNumber,
      this.phoneNo})
      : super._();

  @override
  StoreAddDto rebuild(void Function(StoreAddDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreAddDtoBuilder toBuilder() => new StoreAddDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreAddDto &&
        addressDetails == other.addressDetails &&
        zipcode == other.zipcode &&
        countryId == other.countryId &&
        governorateId == other.governorateId &&
        cityId == other.cityId &&
        areaId == other.areaId &&
        storeId == other.storeId &&
        name == other.name &&
        financialRecordNumber == other.financialRecordNumber &&
        freelanceCertificateNumber == other.freelanceCertificateNumber &&
        phoneNo == other.phoneNo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, addressDetails.hashCode);
    _$hash = $jc(_$hash, zipcode.hashCode);
    _$hash = $jc(_$hash, countryId.hashCode);
    _$hash = $jc(_$hash, governorateId.hashCode);
    _$hash = $jc(_$hash, cityId.hashCode);
    _$hash = $jc(_$hash, areaId.hashCode);
    _$hash = $jc(_$hash, storeId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, financialRecordNumber.hashCode);
    _$hash = $jc(_$hash, freelanceCertificateNumber.hashCode);
    _$hash = $jc(_$hash, phoneNo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StoreAddDto')
          ..add('addressDetails', addressDetails)
          ..add('zipcode', zipcode)
          ..add('countryId', countryId)
          ..add('governorateId', governorateId)
          ..add('cityId', cityId)
          ..add('areaId', areaId)
          ..add('storeId', storeId)
          ..add('name', name)
          ..add('financialRecordNumber', financialRecordNumber)
          ..add('freelanceCertificateNumber', freelanceCertificateNumber)
          ..add('phoneNo', phoneNo))
        .toString();
  }
}

class StoreAddDtoBuilder implements Builder<StoreAddDto, StoreAddDtoBuilder> {
  _$StoreAddDto? _$v;

  String? _addressDetails;
  String? get addressDetails => _$this._addressDetails;
  set addressDetails(String? addressDetails) =>
      _$this._addressDetails = addressDetails;

  String? _zipcode;
  String? get zipcode => _$this._zipcode;
  set zipcode(String? zipcode) => _$this._zipcode = zipcode;

  int? _countryId;
  int? get countryId => _$this._countryId;
  set countryId(int? countryId) => _$this._countryId = countryId;

  int? _governorateId;
  int? get governorateId => _$this._governorateId;
  set governorateId(int? governorateId) =>
      _$this._governorateId = governorateId;

  int? _cityId;
  int? get cityId => _$this._cityId;
  set cityId(int? cityId) => _$this._cityId = cityId;

  int? _areaId;
  int? get areaId => _$this._areaId;
  set areaId(int? areaId) => _$this._areaId = areaId;

  int? _storeId;
  int? get storeId => _$this._storeId;
  set storeId(int? storeId) => _$this._storeId = storeId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _financialRecordNumber;
  String? get financialRecordNumber => _$this._financialRecordNumber;
  set financialRecordNumber(String? financialRecordNumber) =>
      _$this._financialRecordNumber = financialRecordNumber;

  String? _freelanceCertificateNumber;
  String? get freelanceCertificateNumber => _$this._freelanceCertificateNumber;
  set freelanceCertificateNumber(String? freelanceCertificateNumber) =>
      _$this._freelanceCertificateNumber = freelanceCertificateNumber;

  String? _phoneNo;
  String? get phoneNo => _$this._phoneNo;
  set phoneNo(String? phoneNo) => _$this._phoneNo = phoneNo;

  StoreAddDtoBuilder() {
    StoreAddDto._defaults(this);
  }

  StoreAddDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addressDetails = $v.addressDetails;
      _zipcode = $v.zipcode;
      _countryId = $v.countryId;
      _governorateId = $v.governorateId;
      _cityId = $v.cityId;
      _areaId = $v.areaId;
      _storeId = $v.storeId;
      _name = $v.name;
      _financialRecordNumber = $v.financialRecordNumber;
      _freelanceCertificateNumber = $v.freelanceCertificateNumber;
      _phoneNo = $v.phoneNo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreAddDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoreAddDto;
  }

  @override
  void update(void Function(StoreAddDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StoreAddDto build() => _build();

  _$StoreAddDto _build() {
    final _$result = _$v ??
        new _$StoreAddDto._(
            addressDetails: addressDetails,
            zipcode: zipcode,
            countryId: countryId,
            governorateId: governorateId,
            cityId: cityId,
            areaId: areaId,
            storeId: storeId,
            name: name,
            financialRecordNumber: financialRecordNumber,
            freelanceCertificateNumber: freelanceCertificateNumber,
            phoneNo: phoneNo);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
