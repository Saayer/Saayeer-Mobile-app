// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_add_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaymentAddDto extends PaymentAddDto {
  @override
  final int shipmentId;
  @override
  final String transactionId;
  @override
  final double amount;
  @override
  final double fee;
  @override
  final String currency;

  factory _$PaymentAddDto([void Function(PaymentAddDtoBuilder)? updates]) =>
      (new PaymentAddDtoBuilder()..update(updates))._build();

  _$PaymentAddDto._(
      {required this.shipmentId,
      required this.transactionId,
      required this.amount,
      required this.fee,
      required this.currency})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        shipmentId, r'PaymentAddDto', 'shipmentId');
    BuiltValueNullFieldError.checkNotNull(
        transactionId, r'PaymentAddDto', 'transactionId');
    BuiltValueNullFieldError.checkNotNull(amount, r'PaymentAddDto', 'amount');
    BuiltValueNullFieldError.checkNotNull(fee, r'PaymentAddDto', 'fee');
    BuiltValueNullFieldError.checkNotNull(
        currency, r'PaymentAddDto', 'currency');
  }

  @override
  PaymentAddDto rebuild(void Function(PaymentAddDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentAddDtoBuilder toBuilder() => new PaymentAddDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentAddDto &&
        shipmentId == other.shipmentId &&
        transactionId == other.transactionId &&
        amount == other.amount &&
        fee == other.fee &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, shipmentId.hashCode);
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, fee.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentAddDto')
          ..add('shipmentId', shipmentId)
          ..add('transactionId', transactionId)
          ..add('amount', amount)
          ..add('fee', fee)
          ..add('currency', currency))
        .toString();
  }
}

class PaymentAddDtoBuilder
    implements Builder<PaymentAddDto, PaymentAddDtoBuilder> {
  _$PaymentAddDto? _$v;

  int? _shipmentId;
  int? get shipmentId => _$this._shipmentId;
  set shipmentId(int? shipmentId) => _$this._shipmentId = shipmentId;

  String? _transactionId;
  String? get transactionId => _$this._transactionId;
  set transactionId(String? transactionId) =>
      _$this._transactionId = transactionId;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  double? _fee;
  double? get fee => _$this._fee;
  set fee(double? fee) => _$this._fee = fee;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  PaymentAddDtoBuilder() {
    PaymentAddDto._defaults(this);
  }

  PaymentAddDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _shipmentId = $v.shipmentId;
      _transactionId = $v.transactionId;
      _amount = $v.amount;
      _fee = $v.fee;
      _currency = $v.currency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentAddDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentAddDto;
  }

  @override
  void update(void Function(PaymentAddDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentAddDto build() => _build();

  _$PaymentAddDto _build() {
    final _$result = _$v ??
        new _$PaymentAddDto._(
            shipmentId: BuiltValueNullFieldError.checkNotNull(
                shipmentId, r'PaymentAddDto', 'shipmentId'),
            transactionId: BuiltValueNullFieldError.checkNotNull(
                transactionId, r'PaymentAddDto', 'transactionId'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'PaymentAddDto', 'amount'),
            fee: BuiltValueNullFieldError.checkNotNull(
                fee, r'PaymentAddDto', 'fee'),
            currency: BuiltValueNullFieldError.checkNotNull(
                currency, r'PaymentAddDto', 'currency'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
