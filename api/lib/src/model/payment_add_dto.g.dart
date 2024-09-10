// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_add_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaymentAddDto extends PaymentAddDto {
  @override
  final int shipmentId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final double fee;
  @override
  final String transactionId;
  @override
  final String? sourceCompany;
  @override
  final String? sourceGatewayId;
  @override
  final String? sourceMessage;
  @override
  final String? sourceName;
  @override
  final String? sourceNumber;
  @override
  final String? sourceReferenceNumber;
  @override
  final String? sourceType;
  @override
  final String? status;

  factory _$PaymentAddDto([void Function(PaymentAddDtoBuilder)? updates]) =>
      (new PaymentAddDtoBuilder()..update(updates))._build();

  _$PaymentAddDto._(
      {required this.shipmentId,
      required this.amount,
      required this.currency,
      required this.fee,
      required this.transactionId,
      this.sourceCompany,
      this.sourceGatewayId,
      this.sourceMessage,
      this.sourceName,
      this.sourceNumber,
      this.sourceReferenceNumber,
      this.sourceType,
      this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        shipmentId, r'PaymentAddDto', 'shipmentId');
    BuiltValueNullFieldError.checkNotNull(amount, r'PaymentAddDto', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        currency, r'PaymentAddDto', 'currency');
    BuiltValueNullFieldError.checkNotNull(fee, r'PaymentAddDto', 'fee');
    BuiltValueNullFieldError.checkNotNull(
        transactionId, r'PaymentAddDto', 'transactionId');
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
        amount == other.amount &&
        currency == other.currency &&
        fee == other.fee &&
        transactionId == other.transactionId &&
        sourceCompany == other.sourceCompany &&
        sourceGatewayId == other.sourceGatewayId &&
        sourceMessage == other.sourceMessage &&
        sourceName == other.sourceName &&
        sourceNumber == other.sourceNumber &&
        sourceReferenceNumber == other.sourceReferenceNumber &&
        sourceType == other.sourceType &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, shipmentId.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, fee.hashCode);
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, sourceCompany.hashCode);
    _$hash = $jc(_$hash, sourceGatewayId.hashCode);
    _$hash = $jc(_$hash, sourceMessage.hashCode);
    _$hash = $jc(_$hash, sourceName.hashCode);
    _$hash = $jc(_$hash, sourceNumber.hashCode);
    _$hash = $jc(_$hash, sourceReferenceNumber.hashCode);
    _$hash = $jc(_$hash, sourceType.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentAddDto')
          ..add('shipmentId', shipmentId)
          ..add('amount', amount)
          ..add('currency', currency)
          ..add('fee', fee)
          ..add('transactionId', transactionId)
          ..add('sourceCompany', sourceCompany)
          ..add('sourceGatewayId', sourceGatewayId)
          ..add('sourceMessage', sourceMessage)
          ..add('sourceName', sourceName)
          ..add('sourceNumber', sourceNumber)
          ..add('sourceReferenceNumber', sourceReferenceNumber)
          ..add('sourceType', sourceType)
          ..add('status', status))
        .toString();
  }
}

class PaymentAddDtoBuilder
    implements Builder<PaymentAddDto, PaymentAddDtoBuilder> {
  _$PaymentAddDto? _$v;

  int? _shipmentId;
  int? get shipmentId => _$this._shipmentId;
  set shipmentId(int? shipmentId) => _$this._shipmentId = shipmentId;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  double? _fee;
  double? get fee => _$this._fee;
  set fee(double? fee) => _$this._fee = fee;

  String? _transactionId;
  String? get transactionId => _$this._transactionId;
  set transactionId(String? transactionId) =>
      _$this._transactionId = transactionId;

  String? _sourceCompany;
  String? get sourceCompany => _$this._sourceCompany;
  set sourceCompany(String? sourceCompany) =>
      _$this._sourceCompany = sourceCompany;

  String? _sourceGatewayId;
  String? get sourceGatewayId => _$this._sourceGatewayId;
  set sourceGatewayId(String? sourceGatewayId) =>
      _$this._sourceGatewayId = sourceGatewayId;

  String? _sourceMessage;
  String? get sourceMessage => _$this._sourceMessage;
  set sourceMessage(String? sourceMessage) =>
      _$this._sourceMessage = sourceMessage;

  String? _sourceName;
  String? get sourceName => _$this._sourceName;
  set sourceName(String? sourceName) => _$this._sourceName = sourceName;

  String? _sourceNumber;
  String? get sourceNumber => _$this._sourceNumber;
  set sourceNumber(String? sourceNumber) => _$this._sourceNumber = sourceNumber;

  String? _sourceReferenceNumber;
  String? get sourceReferenceNumber => _$this._sourceReferenceNumber;
  set sourceReferenceNumber(String? sourceReferenceNumber) =>
      _$this._sourceReferenceNumber = sourceReferenceNumber;

  String? _sourceType;
  String? get sourceType => _$this._sourceType;
  set sourceType(String? sourceType) => _$this._sourceType = sourceType;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  PaymentAddDtoBuilder() {
    PaymentAddDto._defaults(this);
  }

  PaymentAddDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _shipmentId = $v.shipmentId;
      _amount = $v.amount;
      _currency = $v.currency;
      _fee = $v.fee;
      _transactionId = $v.transactionId;
      _sourceCompany = $v.sourceCompany;
      _sourceGatewayId = $v.sourceGatewayId;
      _sourceMessage = $v.sourceMessage;
      _sourceName = $v.sourceName;
      _sourceNumber = $v.sourceNumber;
      _sourceReferenceNumber = $v.sourceReferenceNumber;
      _sourceType = $v.sourceType;
      _status = $v.status;
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
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'PaymentAddDto', 'amount'),
            currency: BuiltValueNullFieldError.checkNotNull(
                currency, r'PaymentAddDto', 'currency'),
            fee: BuiltValueNullFieldError.checkNotNull(
                fee, r'PaymentAddDto', 'fee'),
            transactionId: BuiltValueNullFieldError.checkNotNull(
                transactionId, r'PaymentAddDto', 'transactionId'),
            sourceCompany: sourceCompany,
            sourceGatewayId: sourceGatewayId,
            sourceMessage: sourceMessage,
            sourceName: sourceName,
            sourceNumber: sourceNumber,
            sourceReferenceNumber: sourceReferenceNumber,
            sourceType: sourceType,
            status: status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
