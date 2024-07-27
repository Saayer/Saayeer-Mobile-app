// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_look_up_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddressLookUpDto extends AddressLookUpDto {
  @override
  final int? id;
  @override
  final String? nameEn;
  @override
  final String? nameAr;

  factory _$AddressLookUpDto(
          [void Function(AddressLookUpDtoBuilder)? updates]) =>
      (new AddressLookUpDtoBuilder()..update(updates))._build();

  _$AddressLookUpDto._({this.id, this.nameEn, this.nameAr}) : super._();

  @override
  AddressLookUpDto rebuild(void Function(AddressLookUpDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressLookUpDtoBuilder toBuilder() =>
      new AddressLookUpDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressLookUpDto &&
        id == other.id &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, nameEn.hashCode);
    _$hash = $jc(_$hash, nameAr.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressLookUpDto')
          ..add('id', id)
          ..add('nameEn', nameEn)
          ..add('nameAr', nameAr))
        .toString();
  }
}

class AddressLookUpDtoBuilder
    implements Builder<AddressLookUpDto, AddressLookUpDtoBuilder> {
  _$AddressLookUpDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _nameEn;
  String? get nameEn => _$this._nameEn;
  set nameEn(String? nameEn) => _$this._nameEn = nameEn;

  String? _nameAr;
  String? get nameAr => _$this._nameAr;
  set nameAr(String? nameAr) => _$this._nameAr = nameAr;

  AddressLookUpDtoBuilder() {
    AddressLookUpDto._defaults(this);
  }

  AddressLookUpDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nameEn = $v.nameEn;
      _nameAr = $v.nameAr;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressLookUpDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressLookUpDto;
  }

  @override
  void update(void Function(AddressLookUpDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressLookUpDto build() => _build();

  _$AddressLookUpDto _build() {
    final _$result =
        _$v ?? new _$AddressLookUpDto._(id: id, nameEn: nameEn, nameAr: nameAr);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
