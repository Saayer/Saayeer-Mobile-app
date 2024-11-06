// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addressable_add_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddressableAddDto extends AddressableAddDto {
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

  factory _$AddressableAddDto(
          [void Function(AddressableAddDtoBuilder)? updates]) =>
      (new AddressableAddDtoBuilder()..update(updates))._build();

  _$AddressableAddDto._(
      {this.addressDetails,
      this.zipcode,
      this.countryId,
      this.governorateId,
      this.cityId,
      this.areaId})
      : super._();

  @override
  AddressableAddDto rebuild(void Function(AddressableAddDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressableAddDtoBuilder toBuilder() =>
      new AddressableAddDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressableAddDto &&
        addressDetails == other.addressDetails &&
        zipcode == other.zipcode &&
        countryId == other.countryId &&
        governorateId == other.governorateId &&
        cityId == other.cityId &&
        areaId == other.areaId;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressableAddDto')
          ..add('addressDetails', addressDetails)
          ..add('zipcode', zipcode)
          ..add('countryId', countryId)
          ..add('governorateId', governorateId)
          ..add('cityId', cityId)
          ..add('areaId', areaId))
        .toString();
  }
}

class AddressableAddDtoBuilder
    implements Builder<AddressableAddDto, AddressableAddDtoBuilder> {
  _$AddressableAddDto? _$v;

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

  AddressableAddDtoBuilder() {
    AddressableAddDto._defaults(this);
  }

  AddressableAddDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addressDetails = $v.addressDetails;
      _zipcode = $v.zipcode;
      _countryId = $v.countryId;
      _governorateId = $v.governorateId;
      _cityId = $v.cityId;
      _areaId = $v.areaId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressableAddDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressableAddDto;
  }

  @override
  void update(void Function(AddressableAddDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressableAddDto build() => _build();

  _$AddressableAddDto _build() {
    final _$result = _$v ??
        new _$AddressableAddDto._(
            addressDetails: addressDetails,
            zipcode: zipcode,
            countryId: countryId,
            governorateId: governorateId,
            cityId: cityId,
            areaId: areaId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
