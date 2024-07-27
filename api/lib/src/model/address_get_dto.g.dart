// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_get_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddressGetDto extends AddressGetDto {
  @override
  final int? id;
  @override
  final String? details;
  @override
  final AddressLookUpDto? country;
  @override
  final AddressLookUpDto? governorate;
  @override
  final AddressLookUpDto? city;
  @override
  final AddressLookUpDto? area;

  factory _$AddressGetDto([void Function(AddressGetDtoBuilder)? updates]) =>
      (new AddressGetDtoBuilder()..update(updates))._build();

  _$AddressGetDto._(
      {this.id,
      this.details,
      this.country,
      this.governorate,
      this.city,
      this.area})
      : super._();

  @override
  AddressGetDto rebuild(void Function(AddressGetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressGetDtoBuilder toBuilder() => new AddressGetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressGetDto &&
        id == other.id &&
        details == other.details &&
        country == other.country &&
        governorate == other.governorate &&
        city == other.city &&
        area == other.area;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, governorate.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, area.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressGetDto')
          ..add('id', id)
          ..add('details', details)
          ..add('country', country)
          ..add('governorate', governorate)
          ..add('city', city)
          ..add('area', area))
        .toString();
  }
}

class AddressGetDtoBuilder
    implements Builder<AddressGetDto, AddressGetDtoBuilder> {
  _$AddressGetDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _details;
  String? get details => _$this._details;
  set details(String? details) => _$this._details = details;

  AddressLookUpDtoBuilder? _country;
  AddressLookUpDtoBuilder get country =>
      _$this._country ??= new AddressLookUpDtoBuilder();
  set country(AddressLookUpDtoBuilder? country) => _$this._country = country;

  AddressLookUpDtoBuilder? _governorate;
  AddressLookUpDtoBuilder get governorate =>
      _$this._governorate ??= new AddressLookUpDtoBuilder();
  set governorate(AddressLookUpDtoBuilder? governorate) =>
      _$this._governorate = governorate;

  AddressLookUpDtoBuilder? _city;
  AddressLookUpDtoBuilder get city =>
      _$this._city ??= new AddressLookUpDtoBuilder();
  set city(AddressLookUpDtoBuilder? city) => _$this._city = city;

  AddressLookUpDtoBuilder? _area;
  AddressLookUpDtoBuilder get area =>
      _$this._area ??= new AddressLookUpDtoBuilder();
  set area(AddressLookUpDtoBuilder? area) => _$this._area = area;

  AddressGetDtoBuilder() {
    AddressGetDto._defaults(this);
  }

  AddressGetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _details = $v.details;
      _country = $v.country?.toBuilder();
      _governorate = $v.governorate?.toBuilder();
      _city = $v.city?.toBuilder();
      _area = $v.area?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressGetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressGetDto;
  }

  @override
  void update(void Function(AddressGetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressGetDto build() => _build();

  _$AddressGetDto _build() {
    _$AddressGetDto _$result;
    try {
      _$result = _$v ??
          new _$AddressGetDto._(
              id: id,
              details: details,
              country: _country?.build(),
              governorate: _governorate?.build(),
              city: _city?.build(),
              area: _area?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'country';
        _country?.build();
        _$failedField = 'governorate';
        _governorate?.build();
        _$failedField = 'city';
        _city?.build();
        _$failedField = 'area';
        _area?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AddressGetDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
