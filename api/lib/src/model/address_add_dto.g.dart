// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_add_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddressAddDto extends AddressAddDto {
  @override
  final int? id;
  @override
  final String? details;
  @override
  final int? countryId;
  @override
  final int? governorateId;
  @override
  final int? cityId;
  @override
  final int? areaId;

  factory _$AddressAddDto([void Function(AddressAddDtoBuilder)? updates]) =>
      (new AddressAddDtoBuilder()..update(updates))._build();

  _$AddressAddDto._(
      {this.id,
      this.details,
      this.countryId,
      this.governorateId,
      this.cityId,
      this.areaId})
      : super._();

  @override
  AddressAddDto rebuild(void Function(AddressAddDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressAddDtoBuilder toBuilder() => new AddressAddDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressAddDto &&
        id == other.id &&
        details == other.details &&
        countryId == other.countryId &&
        governorateId == other.governorateId &&
        cityId == other.cityId &&
        areaId == other.areaId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jc(_$hash, countryId.hashCode);
    _$hash = $jc(_$hash, governorateId.hashCode);
    _$hash = $jc(_$hash, cityId.hashCode);
    _$hash = $jc(_$hash, areaId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressAddDto')
          ..add('id', id)
          ..add('details', details)
          ..add('countryId', countryId)
          ..add('governorateId', governorateId)
          ..add('cityId', cityId)
          ..add('areaId', areaId))
        .toString();
  }
}

class AddressAddDtoBuilder
    implements Builder<AddressAddDto, AddressAddDtoBuilder> {
  _$AddressAddDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _details;
  String? get details => _$this._details;
  set details(String? details) => _$this._details = details;

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

  AddressAddDtoBuilder() {
    AddressAddDto._defaults(this);
  }

  AddressAddDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _details = $v.details;
      _countryId = $v.countryId;
      _governorateId = $v.governorateId;
      _cityId = $v.cityId;
      _areaId = $v.areaId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressAddDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressAddDto;
  }

  @override
  void update(void Function(AddressAddDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressAddDto build() => _build();

  _$AddressAddDto _build() {
    final _$result = _$v ??
        new _$AddressAddDto._(
            id: id,
            details: details,
            countryId: countryId,
            governorateId: governorateId,
            cityId: cityId,
            areaId: areaId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
