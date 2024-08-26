// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_shipment_get_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CustomerShipmentGetDto extends CustomerShipmentGetDto {
  @override
  final String? addressDetails;
  @override
  final String? countryNameEn;
  @override
  final String? countryNameAr;
  @override
  final String? governorateNameEn;
  @override
  final String? governorateNameAr;
  @override
  final String? cityNameEn;
  @override
  final String? cityNameAr;
  @override
  final String? areaNameEn;
  @override
  final String? areaNameAr;
  @override
  final String? fullName;

  factory _$CustomerShipmentGetDto(
          [void Function(CustomerShipmentGetDtoBuilder)? updates]) =>
      (new CustomerShipmentGetDtoBuilder()..update(updates))._build();

  _$CustomerShipmentGetDto._(
      {this.addressDetails,
      this.countryNameEn,
      this.countryNameAr,
      this.governorateNameEn,
      this.governorateNameAr,
      this.cityNameEn,
      this.cityNameAr,
      this.areaNameEn,
      this.areaNameAr,
      this.fullName})
      : super._();

  @override
  CustomerShipmentGetDto rebuild(
          void Function(CustomerShipmentGetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerShipmentGetDtoBuilder toBuilder() =>
      new CustomerShipmentGetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerShipmentGetDto &&
        addressDetails == other.addressDetails &&
        countryNameEn == other.countryNameEn &&
        countryNameAr == other.countryNameAr &&
        governorateNameEn == other.governorateNameEn &&
        governorateNameAr == other.governorateNameAr &&
        cityNameEn == other.cityNameEn &&
        cityNameAr == other.cityNameAr &&
        areaNameEn == other.areaNameEn &&
        areaNameAr == other.areaNameAr &&
        fullName == other.fullName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, addressDetails.hashCode);
    _$hash = $jc(_$hash, countryNameEn.hashCode);
    _$hash = $jc(_$hash, countryNameAr.hashCode);
    _$hash = $jc(_$hash, governorateNameEn.hashCode);
    _$hash = $jc(_$hash, governorateNameAr.hashCode);
    _$hash = $jc(_$hash, cityNameEn.hashCode);
    _$hash = $jc(_$hash, cityNameAr.hashCode);
    _$hash = $jc(_$hash, areaNameEn.hashCode);
    _$hash = $jc(_$hash, areaNameAr.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CustomerShipmentGetDto')
          ..add('addressDetails', addressDetails)
          ..add('countryNameEn', countryNameEn)
          ..add('countryNameAr', countryNameAr)
          ..add('governorateNameEn', governorateNameEn)
          ..add('governorateNameAr', governorateNameAr)
          ..add('cityNameEn', cityNameEn)
          ..add('cityNameAr', cityNameAr)
          ..add('areaNameEn', areaNameEn)
          ..add('areaNameAr', areaNameAr)
          ..add('fullName', fullName))
        .toString();
  }
}

class CustomerShipmentGetDtoBuilder
    implements Builder<CustomerShipmentGetDto, CustomerShipmentGetDtoBuilder> {
  _$CustomerShipmentGetDto? _$v;

  String? _addressDetails;
  String? get addressDetails => _$this._addressDetails;
  set addressDetails(String? addressDetails) =>
      _$this._addressDetails = addressDetails;

  String? _countryNameEn;
  String? get countryNameEn => _$this._countryNameEn;
  set countryNameEn(String? countryNameEn) =>
      _$this._countryNameEn = countryNameEn;

  String? _countryNameAr;
  String? get countryNameAr => _$this._countryNameAr;
  set countryNameAr(String? countryNameAr) =>
      _$this._countryNameAr = countryNameAr;

  String? _governorateNameEn;
  String? get governorateNameEn => _$this._governorateNameEn;
  set governorateNameEn(String? governorateNameEn) =>
      _$this._governorateNameEn = governorateNameEn;

  String? _governorateNameAr;
  String? get governorateNameAr => _$this._governorateNameAr;
  set governorateNameAr(String? governorateNameAr) =>
      _$this._governorateNameAr = governorateNameAr;

  String? _cityNameEn;
  String? get cityNameEn => _$this._cityNameEn;
  set cityNameEn(String? cityNameEn) => _$this._cityNameEn = cityNameEn;

  String? _cityNameAr;
  String? get cityNameAr => _$this._cityNameAr;
  set cityNameAr(String? cityNameAr) => _$this._cityNameAr = cityNameAr;

  String? _areaNameEn;
  String? get areaNameEn => _$this._areaNameEn;
  set areaNameEn(String? areaNameEn) => _$this._areaNameEn = areaNameEn;

  String? _areaNameAr;
  String? get areaNameAr => _$this._areaNameAr;
  set areaNameAr(String? areaNameAr) => _$this._areaNameAr = areaNameAr;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  CustomerShipmentGetDtoBuilder() {
    CustomerShipmentGetDto._defaults(this);
  }

  CustomerShipmentGetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addressDetails = $v.addressDetails;
      _countryNameEn = $v.countryNameEn;
      _countryNameAr = $v.countryNameAr;
      _governorateNameEn = $v.governorateNameEn;
      _governorateNameAr = $v.governorateNameAr;
      _cityNameEn = $v.cityNameEn;
      _cityNameAr = $v.cityNameAr;
      _areaNameEn = $v.areaNameEn;
      _areaNameAr = $v.areaNameAr;
      _fullName = $v.fullName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomerShipmentGetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomerShipmentGetDto;
  }

  @override
  void update(void Function(CustomerShipmentGetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CustomerShipmentGetDto build() => _build();

  _$CustomerShipmentGetDto _build() {
    final _$result = _$v ??
        new _$CustomerShipmentGetDto._(
            addressDetails: addressDetails,
            countryNameEn: countryNameEn,
            countryNameAr: countryNameAr,
            governorateNameEn: governorateNameEn,
            governorateNameAr: governorateNameAr,
            cityNameEn: cityNameEn,
            cityNameAr: cityNameAr,
            areaNameEn: areaNameEn,
            areaNameAr: areaNameAr,
            fullName: fullName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
