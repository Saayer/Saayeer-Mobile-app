// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_per_date_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CountPerDateDto extends CountPerDateDto {
  @override
  final DateTime? date;
  @override
  final int? count;

  factory _$CountPerDateDto([void Function(CountPerDateDtoBuilder)? updates]) =>
      (new CountPerDateDtoBuilder()..update(updates))._build();

  _$CountPerDateDto._({this.date, this.count}) : super._();

  @override
  CountPerDateDto rebuild(void Function(CountPerDateDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountPerDateDtoBuilder toBuilder() =>
      new CountPerDateDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CountPerDateDto &&
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
    return (newBuiltValueToStringHelper(r'CountPerDateDto')
          ..add('date', date)
          ..add('count', count))
        .toString();
  }
}

class CountPerDateDtoBuilder
    implements Builder<CountPerDateDto, CountPerDateDtoBuilder> {
  _$CountPerDateDto? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  CountPerDateDtoBuilder() {
    CountPerDateDto._defaults(this);
  }

  CountPerDateDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CountPerDateDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CountPerDateDto;
  }

  @override
  void update(void Function(CountPerDateDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CountPerDateDto build() => _build();

  _$CountPerDateDto _build() {
    final _$result = _$v ?? new _$CountPerDateDto._(date: date, count: count);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
