// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_range_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DateRangeDto extends DateRangeDto {
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  factory _$DateRangeDto([void Function(DateRangeDtoBuilder)? updates]) =>
      (new DateRangeDtoBuilder()..update(updates))._build();

  _$DateRangeDto._({this.startDate, this.endDate}) : super._();

  @override
  DateRangeDto rebuild(void Function(DateRangeDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DateRangeDtoBuilder toBuilder() => new DateRangeDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DateRangeDto &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DateRangeDto')
          ..add('startDate', startDate)
          ..add('endDate', endDate))
        .toString();
  }
}

class DateRangeDtoBuilder
    implements Builder<DateRangeDto, DateRangeDtoBuilder> {
  _$DateRangeDto? _$v;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  DateRangeDtoBuilder() {
    DateRangeDto._defaults(this);
  }

  DateRangeDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DateRangeDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DateRangeDto;
  }

  @override
  void update(void Function(DateRangeDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DateRangeDto build() => _build();

  _$DateRangeDto _build() {
    final _$result =
        _$v ?? new _$DateRangeDto._(startDate: startDate, endDate: endDate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
