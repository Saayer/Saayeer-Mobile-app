// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_add_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CustomerAddDto extends CustomerAddDto {
  @override
  final String? addressDetails;
  @override
  final String? zipcode;
  @override
  final String? phoneNo;
  @override
  final String? email;
  @override
  final int? countryId;
  @override
  final int? governorateId;
  @override
  final int? cityId;
  @override
  final int? areaId;
  @override
  final int? customerId;
  @override
  final String? fullName;
  @override
  final String? phoneNo2;

  factory _$CustomerAddDto([void Function(CustomerAddDtoBuilder)? updates]) =>
      (new CustomerAddDtoBuilder()..update(updates))._build();

  _$CustomerAddDto._(
      {this.addressDetails,
      this.zipcode,
      this.phoneNo,
      this.email,
      this.countryId,
      this.governorateId,
      this.cityId,
      this.areaId,
      this.customerId,
      this.fullName,
      this.phoneNo2})
      : super._();

  @override
  CustomerAddDto rebuild(void Function(CustomerAddDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerAddDtoBuilder toBuilder() =>
      new CustomerAddDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerAddDto &&
        addressDetails == other.addressDetails &&
        zipcode == other.zipcode &&
        phoneNo == other.phoneNo &&
        email == other.email &&
        countryId == other.countryId &&
        governorateId == other.governorateId &&
        cityId == other.cityId &&
        areaId == other.areaId &&
        customerId == other.customerId &&
        fullName == other.fullName &&
        phoneNo2 == other.phoneNo2;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, addressDetails.hashCode);
    _$hash = $jc(_$hash, zipcode.hashCode);
    _$hash = $jc(_$hash, phoneNo.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, countryId.hashCode);
    _$hash = $jc(_$hash, governorateId.hashCode);
    _$hash = $jc(_$hash, cityId.hashCode);
    _$hash = $jc(_$hash, areaId.hashCode);
    _$hash = $jc(_$hash, customerId.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, phoneNo2.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CustomerAddDto')
          ..add('addressDetails', addressDetails)
          ..add('zipcode', zipcode)
          ..add('phoneNo', phoneNo)
          ..add('email', email)
          ..add('countryId', countryId)
          ..add('governorateId', governorateId)
          ..add('cityId', cityId)
          ..add('areaId', areaId)
          ..add('customerId', customerId)
          ..add('fullName', fullName)
          ..add('phoneNo2', phoneNo2))
        .toString();
  }
}

class CustomerAddDtoBuilder
    implements Builder<CustomerAddDto, CustomerAddDtoBuilder> {
  _$CustomerAddDto? _$v;

  String? _addressDetails;
  String? get addressDetails => _$this._addressDetails;
  set addressDetails(String? addressDetails) =>
      _$this._addressDetails = addressDetails;

  String? _zipcode;
  String? get zipcode => _$this._zipcode;
  set zipcode(String? zipcode) => _$this._zipcode = zipcode;

  String? _phoneNo;
  String? get phoneNo => _$this._phoneNo;
  set phoneNo(String? phoneNo) => _$this._phoneNo = phoneNo;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

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

  int? _customerId;
  int? get customerId => _$this._customerId;
  set customerId(int? customerId) => _$this._customerId = customerId;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _phoneNo2;
  String? get phoneNo2 => _$this._phoneNo2;
  set phoneNo2(String? phoneNo2) => _$this._phoneNo2 = phoneNo2;

  CustomerAddDtoBuilder() {
    CustomerAddDto._defaults(this);
  }

  CustomerAddDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addressDetails = $v.addressDetails;
      _zipcode = $v.zipcode;
      _phoneNo = $v.phoneNo;
      _email = $v.email;
      _countryId = $v.countryId;
      _governorateId = $v.governorateId;
      _cityId = $v.cityId;
      _areaId = $v.areaId;
      _customerId = $v.customerId;
      _fullName = $v.fullName;
      _phoneNo2 = $v.phoneNo2;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomerAddDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomerAddDto;
  }

  @override
  void update(void Function(CustomerAddDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CustomerAddDto build() => _build();

  _$CustomerAddDto _build() {
    final _$result = _$v ??
        new _$CustomerAddDto._(
            addressDetails: addressDetails,
            zipcode: zipcode,
            phoneNo: phoneNo,
            email: email,
            countryId: countryId,
            governorateId: governorateId,
            cityId: cityId,
            areaId: areaId,
            customerId: customerId,
            fullName: fullName,
            phoneNo2: phoneNo2);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
