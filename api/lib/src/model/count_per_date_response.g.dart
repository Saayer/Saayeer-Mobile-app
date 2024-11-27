// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_per_date_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CountPerDateResponse extends CountPerDateResponse {
  @override
  final int? total;
  @override
  final BuiltList<CountPerDateItemDto>? counts;

  factory _$CountPerDateResponse(
          [void Function(CountPerDateResponseBuilder)? updates]) =>
      (new CountPerDateResponseBuilder()..update(updates))._build();

  _$CountPerDateResponse._({this.total, this.counts}) : super._();

  @override
  CountPerDateResponse rebuild(
          void Function(CountPerDateResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountPerDateResponseBuilder toBuilder() =>
      new CountPerDateResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CountPerDateResponse &&
        total == other.total &&
        counts == other.counts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, counts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CountPerDateResponse')
          ..add('total', total)
          ..add('counts', counts))
        .toString();
  }
}

class CountPerDateResponseBuilder
    implements Builder<CountPerDateResponse, CountPerDateResponseBuilder> {
  _$CountPerDateResponse? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<CountPerDateItemDto>? _counts;
  ListBuilder<CountPerDateItemDto> get counts =>
      _$this._counts ??= new ListBuilder<CountPerDateItemDto>();
  set counts(ListBuilder<CountPerDateItemDto>? counts) =>
      _$this._counts = counts;

  CountPerDateResponseBuilder() {
    CountPerDateResponse._defaults(this);
  }

  CountPerDateResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _counts = $v.counts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CountPerDateResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CountPerDateResponse;
  }

  @override
  void update(void Function(CountPerDateResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CountPerDateResponse build() => _build();

  _$CountPerDateResponse _build() {
    _$CountPerDateResponse _$result;
    try {
      _$result = _$v ??
          new _$CountPerDateResponse._(total: total, counts: _counts?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'counts';
        _counts?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CountPerDateResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
