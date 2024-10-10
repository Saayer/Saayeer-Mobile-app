// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_get_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CityGetDto extends CityGetDto {
  @override
  final int? id;
  @override
  final String? nameEn;
  @override
  final String? nameAr;
  @override
  final bool? aramexPickupAvailable;
  @override
  final bool? aramexDeliveryAvailable;

  factory _$CityGetDto([void Function(CityGetDtoBuilder)? updates]) =>
      (new CityGetDtoBuilder()..update(updates))._build();

  _$CityGetDto._(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.aramexPickupAvailable,
      this.aramexDeliveryAvailable})
      : super._();

  @override
  CityGetDto rebuild(void Function(CityGetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CityGetDtoBuilder toBuilder() => new CityGetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CityGetDto &&
        id == other.id &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr &&
        aramexPickupAvailable == other.aramexPickupAvailable &&
        aramexDeliveryAvailable == other.aramexDeliveryAvailable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, nameEn.hashCode);
    _$hash = $jc(_$hash, nameAr.hashCode);
    _$hash = $jc(_$hash, aramexPickupAvailable.hashCode);
    _$hash = $jc(_$hash, aramexDeliveryAvailable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CityGetDto')
          ..add('id', id)
          ..add('nameEn', nameEn)
          ..add('nameAr', nameAr)
          ..add('aramexPickupAvailable', aramexPickupAvailable)
          ..add('aramexDeliveryAvailable', aramexDeliveryAvailable))
        .toString();
  }
}

class CityGetDtoBuilder implements Builder<CityGetDto, CityGetDtoBuilder> {
  _$CityGetDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _nameEn;
  String? get nameEn => _$this._nameEn;
  set nameEn(String? nameEn) => _$this._nameEn = nameEn;

  String? _nameAr;
  String? get nameAr => _$this._nameAr;
  set nameAr(String? nameAr) => _$this._nameAr = nameAr;

  bool? _aramexPickupAvailable;
  bool? get aramexPickupAvailable => _$this._aramexPickupAvailable;
  set aramexPickupAvailable(bool? aramexPickupAvailable) =>
      _$this._aramexPickupAvailable = aramexPickupAvailable;

  bool? _aramexDeliveryAvailable;
  bool? get aramexDeliveryAvailable => _$this._aramexDeliveryAvailable;
  set aramexDeliveryAvailable(bool? aramexDeliveryAvailable) =>
      _$this._aramexDeliveryAvailable = aramexDeliveryAvailable;

  CityGetDtoBuilder() {
    CityGetDto._defaults(this);
  }

  CityGetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nameEn = $v.nameEn;
      _nameAr = $v.nameAr;
      _aramexPickupAvailable = $v.aramexPickupAvailable;
      _aramexDeliveryAvailable = $v.aramexDeliveryAvailable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CityGetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CityGetDto;
  }

  @override
  void update(void Function(CityGetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CityGetDto build() => _build();

  _$CityGetDto _build() {
    final _$result = _$v ??
        new _$CityGetDto._(
            id: id,
            nameEn: nameEn,
            nameAr: nameAr,
            aramexPickupAvailable: aramexPickupAvailable,
            aramexDeliveryAvailable: aramexDeliveryAvailable);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
