// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_extended_get_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CityExtendedGetDto extends CityExtendedGetDto {
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
  @override
  final AddressLookUpDto? governorate;

  factory _$CityExtendedGetDto(
          [void Function(CityExtendedGetDtoBuilder)? updates]) =>
      (new CityExtendedGetDtoBuilder()..update(updates))._build();

  _$CityExtendedGetDto._(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.aramexPickupAvailable,
      this.aramexDeliveryAvailable,
      this.governorate})
      : super._();

  @override
  CityExtendedGetDto rebuild(
          void Function(CityExtendedGetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CityExtendedGetDtoBuilder toBuilder() =>
      new CityExtendedGetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CityExtendedGetDto &&
        id == other.id &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr &&
        aramexPickupAvailable == other.aramexPickupAvailable &&
        aramexDeliveryAvailable == other.aramexDeliveryAvailable &&
        governorate == other.governorate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, nameEn.hashCode);
    _$hash = $jc(_$hash, nameAr.hashCode);
    _$hash = $jc(_$hash, aramexPickupAvailable.hashCode);
    _$hash = $jc(_$hash, aramexDeliveryAvailable.hashCode);
    _$hash = $jc(_$hash, governorate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CityExtendedGetDto')
          ..add('id', id)
          ..add('nameEn', nameEn)
          ..add('nameAr', nameAr)
          ..add('aramexPickupAvailable', aramexPickupAvailable)
          ..add('aramexDeliveryAvailable', aramexDeliveryAvailable)
          ..add('governorate', governorate))
        .toString();
  }
}

class CityExtendedGetDtoBuilder
    implements Builder<CityExtendedGetDto, CityExtendedGetDtoBuilder> {
  _$CityExtendedGetDto? _$v;

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

  AddressLookUpDtoBuilder? _governorate;
  AddressLookUpDtoBuilder get governorate =>
      _$this._governorate ??= new AddressLookUpDtoBuilder();
  set governorate(AddressLookUpDtoBuilder? governorate) =>
      _$this._governorate = governorate;

  CityExtendedGetDtoBuilder() {
    CityExtendedGetDto._defaults(this);
  }

  CityExtendedGetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nameEn = $v.nameEn;
      _nameAr = $v.nameAr;
      _aramexPickupAvailable = $v.aramexPickupAvailable;
      _aramexDeliveryAvailable = $v.aramexDeliveryAvailable;
      _governorate = $v.governorate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CityExtendedGetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CityExtendedGetDto;
  }

  @override
  void update(void Function(CityExtendedGetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CityExtendedGetDto build() => _build();

  _$CityExtendedGetDto _build() {
    _$CityExtendedGetDto _$result;
    try {
      _$result = _$v ??
          new _$CityExtendedGetDto._(
              id: id,
              nameEn: nameEn,
              nameAr: nameAr,
              aramexPickupAvailable: aramexPickupAvailable,
              aramexDeliveryAvailable: aramexDeliveryAvailable,
              governorate: _governorate?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'governorate';
        _governorate?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CityExtendedGetDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
