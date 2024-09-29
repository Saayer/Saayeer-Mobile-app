// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_per_date_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AmountPerDateDto extends AmountPerDateDto {
  @override
  final DateTime? date;
  @override
  final double? amount;

  factory _$AmountPerDateDto(
          [void Function(AmountPerDateDtoBuilder)? updates]) =>
      (new AmountPerDateDtoBuilder()..update(updates))._build();

  _$AmountPerDateDto._({this.date, this.amount}) : super._();

  @override
  AmountPerDateDto rebuild(void Function(AmountPerDateDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AmountPerDateDtoBuilder toBuilder() =>
      new AmountPerDateDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AmountPerDateDto &&
        date == other.date &&
        amount == other.amount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AmountPerDateDto')
          ..add('date', date)
          ..add('amount', amount))
        .toString();
  }
}

class AmountPerDateDtoBuilder
    implements Builder<AmountPerDateDto, AmountPerDateDtoBuilder> {
  _$AmountPerDateDto? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  AmountPerDateDtoBuilder() {
    AmountPerDateDto._defaults(this);
  }

  AmountPerDateDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AmountPerDateDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AmountPerDateDto;
  }

  @override
  void update(void Function(AmountPerDateDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AmountPerDateDto build() => _build();

  _$AmountPerDateDto _build() {
    final _$result =
        _$v ?? new _$AmountPerDateDto._(date: date, amount: amount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
