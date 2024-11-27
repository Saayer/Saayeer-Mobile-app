// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_cost_logistics.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddressCostLogistics extends AddressCostLogistics {
  @override
  final String? addressDetails;
  @override
  final String? countryCode;
  @override
  final String? stateCode;
  @override
  final String? countryNameEn;
  @override
  final String? governorateNameEn;
  @override
  final String? cityNameEn;
  @override
  final String? areaNameEn;

  factory _$AddressCostLogistics(
          [void Function(AddressCostLogisticsBuilder)? updates]) =>
      (new AddressCostLogisticsBuilder()..update(updates))._build();

  _$AddressCostLogistics._(
      {this.addressDetails,
      this.countryCode,
      this.stateCode,
      this.countryNameEn,
      this.governorateNameEn,
      this.cityNameEn,
      this.areaNameEn})
      : super._();

  @override
  AddressCostLogistics rebuild(
          void Function(AddressCostLogisticsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressCostLogisticsBuilder toBuilder() =>
      new AddressCostLogisticsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressCostLogistics &&
        addressDetails == other.addressDetails &&
        countryCode == other.countryCode &&
        stateCode == other.stateCode &&
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
    _$hash = $jc(_$hash, stateCode.hashCode);
    _$hash = $jc(_$hash, countryNameEn.hashCode);
    _$hash = $jc(_$hash, governorateNameEn.hashCode);
    _$hash = $jc(_$hash, cityNameEn.hashCode);
    _$hash = $jc(_$hash, areaNameEn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressCostLogistics')
          ..add('addressDetails', addressDetails)
          ..add('countryCode', countryCode)
          ..add('stateCode', stateCode)
          ..add('countryNameEn', countryNameEn)
          ..add('governorateNameEn', governorateNameEn)
          ..add('cityNameEn', cityNameEn)
          ..add('areaNameEn', areaNameEn))
        .toString();
  }
}

class AddressCostLogisticsBuilder
    implements Builder<AddressCostLogistics, AddressCostLogisticsBuilder> {
  _$AddressCostLogistics? _$v;

  String? _addressDetails;
  String? get addressDetails => _$this._addressDetails;
  set addressDetails(String? addressDetails) =>
      _$this._addressDetails = addressDetails;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  String? _stateCode;
  String? get stateCode => _$this._stateCode;
  set stateCode(String? stateCode) => _$this._stateCode = stateCode;

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

  AddressCostLogisticsBuilder() {
    AddressCostLogistics._defaults(this);
  }

  AddressCostLogisticsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addressDetails = $v.addressDetails;
      _countryCode = $v.countryCode;
      _stateCode = $v.stateCode;
      _countryNameEn = $v.countryNameEn;
      _governorateNameEn = $v.governorateNameEn;
      _cityNameEn = $v.cityNameEn;
      _areaNameEn = $v.areaNameEn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressCostLogistics other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressCostLogistics;
  }

  @override
  void update(void Function(AddressCostLogisticsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressCostLogistics build() => _build();

  _$AddressCostLogistics _build() {
    final _$result = _$v ??
        new _$AddressCostLogistics._(
            addressDetails: addressDetails,
            countryCode: countryCode,
            stateCode: stateCode,
            countryNameEn: countryNameEn,
            governorateNameEn: governorateNameEn,
            cityNameEn: cityNameEn,
            areaNameEn: areaNameEn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
