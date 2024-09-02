// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_logistics.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddressLogistics extends AddressLogistics {
  @override
  final String? addressDetails;
  @override
  final String? countryCode;
  @override
  final String? countryNameEn;
  @override
  final String? governorateNameEn;
  @override
  final String? cityNameEn;
  @override
  final String? areaNameEn;

  factory _$AddressLogistics(
          [void Function(AddressLogisticsBuilder)? updates]) =>
      (new AddressLogisticsBuilder()..update(updates))._build();

  _$AddressLogistics._(
      {this.addressDetails,
      this.countryCode,
      this.countryNameEn,
      this.governorateNameEn,
      this.cityNameEn,
      this.areaNameEn})
      : super._();

  @override
  AddressLogistics rebuild(void Function(AddressLogisticsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressLogisticsBuilder toBuilder() =>
      new AddressLogisticsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressLogistics &&
        addressDetails == other.addressDetails &&
        countryCode == other.countryCode &&
        countryNameEn == other.countryNameEn &&
        governorateNameEn == other.governorateNameEn &&
        cityNameEn == other.cityNameEn &&
        areaNameEn == other.areaNameEn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, addressDetails.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, countryNameEn.hashCode);
    _$hash = $jc(_$hash, governorateNameEn.hashCode);
    _$hash = $jc(_$hash, cityNameEn.hashCode);
    _$hash = $jc(_$hash, areaNameEn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressLogistics')
          ..add('addressDetails', addressDetails)
          ..add('countryCode', countryCode)
          ..add('countryNameEn', countryNameEn)
          ..add('governorateNameEn', governorateNameEn)
          ..add('cityNameEn', cityNameEn)
          ..add('areaNameEn', areaNameEn))
        .toString();
  }
}

class AddressLogisticsBuilder
    implements Builder<AddressLogistics, AddressLogisticsBuilder> {
  _$AddressLogistics? _$v;

  String? _addressDetails;
  String? get addressDetails => _$this._addressDetails;
  set addressDetails(String? addressDetails) =>
      _$this._addressDetails = addressDetails;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  String? _countryNameEn;
  String? get countryNameEn => _$this._countryNameEn;
  set countryNameEn(String? countryNameEn) =>
      _$this._countryNameEn = countryNameEn;

  String? _governorateNameEn;
  String? get governorateNameEn => _$this._governorateNameEn;
  set governorateNameEn(String? governorateNameEn) =>
      _$this._governorateNameEn = governorateNameEn;

  String? _cityNameEn;
  String? get cityNameEn => _$this._cityNameEn;
  set cityNameEn(String? cityNameEn) => _$this._cityNameEn = cityNameEn;

  String? _areaNameEn;
  String? get areaNameEn => _$this._areaNameEn;
  set areaNameEn(String? areaNameEn) => _$this._areaNameEn = areaNameEn;

  AddressLogisticsBuilder() {
    AddressLogistics._defaults(this);
  }

  AddressLogisticsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addressDetails = $v.addressDetails;
      _countryCode = $v.countryCode;
      _countryNameEn = $v.countryNameEn;
      _governorateNameEn = $v.governorateNameEn;
      _cityNameEn = $v.cityNameEn;
      _areaNameEn = $v.areaNameEn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressLogistics other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressLogistics;
  }

  @override
  void update(void Function(AddressLogisticsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressLogistics build() => _build();

  _$AddressLogistics _build() {
    final _$result = _$v ??
        new _$AddressLogistics._(
            addressDetails: addressDetails,
            countryCode: countryCode,
            countryNameEn: countryNameEn,
            governorateNameEn: governorateNameEn,
            cityNameEn: cityNameEn,
            areaNameEn: areaNameEn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
