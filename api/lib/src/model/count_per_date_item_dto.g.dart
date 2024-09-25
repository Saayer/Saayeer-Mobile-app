// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_per_date_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CountPerDateItemDto extends CountPerDateItemDto {
  @override
  final DateTime? date;
  @override
  final int? count;

  factory _$CountPerDateItemDto(
          [void Function(CountPerDateItemDtoBuilder)? updates]) =>
      (new CountPerDateItemDtoBuilder()..update(updates))._build();

  _$CountPerDateItemDto._({this.date, this.count}) : super._();

  @override
  CountPerDateItemDto rebuild(
          void Function(CountPerDateItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountPerDateItemDtoBuilder toBuilder() =>
      new CountPerDateItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CountPerDateItemDto &&
        date == other.date &&
        count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CountPerDateItemDto')
          ..add('date', date)
          ..add('count', count))
        .toString();
  }
}

class CountPerDateItemDtoBuilder
    implements Builder<CountPerDateItemDto, CountPerDateItemDtoBuilder> {
  _$CountPerDateItemDto? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  CountPerDateItemDtoBuilder() {
    CountPerDateItemDto._defaults(this);
  }

  CountPerDateItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CountPerDateItemDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CountPerDateItemDto;
  }

  @override
  void update(void Function(CountPerDateItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CountPerDateItemDto build() => _build();

  _$CountPerDateItemDto _build() {
    final _$result =
        _$v ?? new _$CountPerDateItemDto._(date: date, count: count);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
