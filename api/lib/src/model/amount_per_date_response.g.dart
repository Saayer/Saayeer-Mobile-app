// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_per_date_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AmountPerDateResponse extends AmountPerDateResponse {
  @override
  final double? total;
  @override
  final BuiltList<AmountPerDateDto>? amounts;

  factory _$AmountPerDateResponse(
          [void Function(AmountPerDateResponseBuilder)? updates]) =>
      (new AmountPerDateResponseBuilder()..update(updates))._build();

  _$AmountPerDateResponse._({this.total, this.amounts}) : super._();

  @override
  AmountPerDateResponse rebuild(
          void Function(AmountPerDateResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AmountPerDateResponseBuilder toBuilder() =>
      new AmountPerDateResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AmountPerDateResponse &&
        total == other.total &&
        amounts == other.amounts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, amounts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AmountPerDateResponse')
          ..add('total', total)
          ..add('amounts', amounts))
        .toString();
  }
}

class AmountPerDateResponseBuilder
    implements Builder<AmountPerDateResponse, AmountPerDateResponseBuilder> {
  _$AmountPerDateResponse? _$v;

  double? _total;
  double? get total => _$this._total;
  set total(double? total) => _$this._total = total;

  ListBuilder<AmountPerDateDto>? _amounts;
  ListBuilder<AmountPerDateDto> get amounts =>
      _$this._amounts ??= new ListBuilder<AmountPerDateDto>();
  set amounts(ListBuilder<AmountPerDateDto>? amounts) =>
      _$this._amounts = amounts;

  AmountPerDateResponseBuilder() {
    AmountPerDateResponse._defaults(this);
  }

  AmountPerDateResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _amounts = $v.amounts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AmountPerDateResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AmountPerDateResponse;
  }

  @override
  void update(void Function(AmountPerDateResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AmountPerDateResponse build() => _build();

  _$AmountPerDateResponse _build() {
    _$AmountPerDateResponse _$result;
    try {
      _$result = _$v ??
          new _$AmountPerDateResponse._(
              total: total, amounts: _amounts?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'amounts';
        _amounts?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AmountPerDateResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
