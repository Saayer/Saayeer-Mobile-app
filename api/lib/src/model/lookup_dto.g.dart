// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LookupDto extends LookupDto {
  @override
  final int? id;
  @override
  final String? name;

  factory _$LookupDto([void Function(LookupDtoBuilder)? updates]) =>
      (new LookupDtoBuilder()..update(updates))._build();

  _$LookupDto._({this.id, this.name}) : super._();

  @override
  LookupDto rebuild(void Function(LookupDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LookupDtoBuilder toBuilder() => new LookupDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LookupDto && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LookupDto')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class LookupDtoBuilder implements Builder<LookupDto, LookupDtoBuilder> {
  _$LookupDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  LookupDtoBuilder() {
    LookupDto._defaults(this);
  }

  LookupDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LookupDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LookupDto;
  }

  @override
  void update(void Function(LookupDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LookupDto build() => _build();

  _$LookupDto _build() {
    final _$result = _$v ?? new _$LookupDto._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
