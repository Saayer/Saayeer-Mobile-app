// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_query.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentQuery extends ShipmentQuery {
  @override
  final String? general;
  @override
  final DateTime? shippingDateFrom;
  @override
  final DateTime? shippingDateTo;
  @override
  final String? logisticServiceName;
  @override
  final ShipmentStatusEnum? status;
  @override
  final int? storeId;
  @override
  final bool? isReturn;
  @override
  final int? customerId;
  @override
  final int? skip;
  @override
  final int? take;

  factory _$ShipmentQuery([void Function(ShipmentQueryBuilder)? updates]) =>
      (new ShipmentQueryBuilder()..update(updates))._build();

  _$ShipmentQuery._(
      {this.general,
      this.shippingDateFrom,
      this.shippingDateTo,
      this.logisticServiceName,
      this.status,
      this.storeId,
      this.isReturn,
      this.customerId,
      this.skip,
      this.take})
      : super._();

  @override
  ShipmentQuery rebuild(void Function(ShipmentQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentQueryBuilder toBuilder() => new ShipmentQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentQuery &&
        general == other.general &&
        shippingDateFrom == other.shippingDateFrom &&
        shippingDateTo == other.shippingDateTo &&
        logisticServiceName == other.logisticServiceName &&
        status == other.status &&
        storeId == other.storeId &&
        isReturn == other.isReturn &&
        customerId == other.customerId &&
        skip == other.skip &&
        take == other.take;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, general.hashCode);
    _$hash = $jc(_$hash, shippingDateFrom.hashCode);
    _$hash = $jc(_$hash, shippingDateTo.hashCode);
    _$hash = $jc(_$hash, logisticServiceName.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, storeId.hashCode);
    _$hash = $jc(_$hash, isReturn.hashCode);
    _$hash = $jc(_$hash, customerId.hashCode);
    _$hash = $jc(_$hash, skip.hashCode);
    _$hash = $jc(_$hash, take.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentQuery')
          ..add('general', general)
          ..add('shippingDateFrom', shippingDateFrom)
          ..add('shippingDateTo', shippingDateTo)
          ..add('logisticServiceName', logisticServiceName)
          ..add('status', status)
          ..add('storeId', storeId)
          ..add('isReturn', isReturn)
          ..add('customerId', customerId)
          ..add('skip', skip)
          ..add('take', take))
        .toString();
  }
}

class ShipmentQueryBuilder
    implements Builder<ShipmentQuery, ShipmentQueryBuilder> {
  _$ShipmentQuery? _$v;

  String? _general;
  String? get general => _$this._general;
  set general(String? general) => _$this._general = general;

  DateTime? _shippingDateFrom;
  DateTime? get shippingDateFrom => _$this._shippingDateFrom;
  set shippingDateFrom(DateTime? shippingDateFrom) =>
      _$this._shippingDateFrom = shippingDateFrom;

  DateTime? _shippingDateTo;
  DateTime? get shippingDateTo => _$this._shippingDateTo;
  set shippingDateTo(DateTime? shippingDateTo) =>
      _$this._shippingDateTo = shippingDateTo;

  String? _logisticServiceName;
  String? get logisticServiceName => _$this._logisticServiceName;
  set logisticServiceName(String? logisticServiceName) =>
      _$this._logisticServiceName = logisticServiceName;

  ShipmentStatusEnum? _status;
  ShipmentStatusEnum? get status => _$this._status;
  set status(ShipmentStatusEnum? status) => _$this._status = status;

  int? _storeId;
  int? get storeId => _$this._storeId;
  set storeId(int? storeId) => _$this._storeId = storeId;

  bool? _isReturn;
  bool? get isReturn => _$this._isReturn;
  set isReturn(bool? isReturn) => _$this._isReturn = isReturn;

  int? _customerId;
  int? get customerId => _$this._customerId;
  set customerId(int? customerId) => _$this._customerId = customerId;

  int? _skip;
  int? get skip => _$this._skip;
  set skip(int? skip) => _$this._skip = skip;

  int? _take;
  int? get take => _$this._take;
  set take(int? take) => _$this._take = take;

  ShipmentQueryBuilder() {
    ShipmentQuery._defaults(this);
  }

  ShipmentQueryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _general = $v.general;
      _shippingDateFrom = $v.shippingDateFrom;
      _shippingDateTo = $v.shippingDateTo;
      _logisticServiceName = $v.logisticServiceName;
      _status = $v.status;
      _storeId = $v.storeId;
      _isReturn = $v.isReturn;
      _customerId = $v.customerId;
      _skip = $v.skip;
      _take = $v.take;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentQuery other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentQuery;
  }

  @override
  void update(void Function(ShipmentQueryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentQuery build() => _build();

  _$ShipmentQuery _build() {
    final _$result = _$v ??
        new _$ShipmentQuery._(
            general: general,
            shippingDateFrom: shippingDateFrom,
            shippingDateTo: shippingDateTo,
            logisticServiceName: logisticServiceName,
            status: status,
            storeId: storeId,
            isReturn: isReturn,
            customerId: customerId,
            skip: skip,
            take: take);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
