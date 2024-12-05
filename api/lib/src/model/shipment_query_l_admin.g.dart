// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_query_l_admin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentQueryLAdmin extends ShipmentQueryLAdmin {
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
  final bool? isReturn;
  @override
  final int? clientId;
  @override
  final int? skip;
  @override
  final int? take;

  factory _$ShipmentQueryLAdmin(
          [void Function(ShipmentQueryLAdminBuilder)? updates]) =>
      (new ShipmentQueryLAdminBuilder()..update(updates))._build();

  _$ShipmentQueryLAdmin._(
      {this.general,
      this.shippingDateFrom,
      this.shippingDateTo,
      this.logisticServiceName,
      this.status,
      this.isReturn,
      this.clientId,
      this.skip,
      this.take})
      : super._();

  @override
  ShipmentQueryLAdmin rebuild(
          void Function(ShipmentQueryLAdminBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentQueryLAdminBuilder toBuilder() =>
      new ShipmentQueryLAdminBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentQueryLAdmin &&
        general == other.general &&
        shippingDateFrom == other.shippingDateFrom &&
        shippingDateTo == other.shippingDateTo &&
        logisticServiceName == other.logisticServiceName &&
        status == other.status &&
        isReturn == other.isReturn &&
        clientId == other.clientId &&
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
    _$hash = $jc(_$hash, isReturn.hashCode);
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, skip.hashCode);
    _$hash = $jc(_$hash, take.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentQueryLAdmin')
          ..add('general', general)
          ..add('shippingDateFrom', shippingDateFrom)
          ..add('shippingDateTo', shippingDateTo)
          ..add('logisticServiceName', logisticServiceName)
          ..add('status', status)
          ..add('isReturn', isReturn)
          ..add('clientId', clientId)
          ..add('skip', skip)
          ..add('take', take))
        .toString();
  }
}

class ShipmentQueryLAdminBuilder
    implements Builder<ShipmentQueryLAdmin, ShipmentQueryLAdminBuilder> {
  _$ShipmentQueryLAdmin? _$v;

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

  bool? _isReturn;
  bool? get isReturn => _$this._isReturn;
  set isReturn(bool? isReturn) => _$this._isReturn = isReturn;

  int? _clientId;
  int? get clientId => _$this._clientId;
  set clientId(int? clientId) => _$this._clientId = clientId;

  int? _skip;
  int? get skip => _$this._skip;
  set skip(int? skip) => _$this._skip = skip;

  int? _take;
  int? get take => _$this._take;
  set take(int? take) => _$this._take = take;

  ShipmentQueryLAdminBuilder() {
    ShipmentQueryLAdmin._defaults(this);
  }

  ShipmentQueryLAdminBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _general = $v.general;
      _shippingDateFrom = $v.shippingDateFrom;
      _shippingDateTo = $v.shippingDateTo;
      _logisticServiceName = $v.logisticServiceName;
      _status = $v.status;
      _isReturn = $v.isReturn;
      _clientId = $v.clientId;
      _skip = $v.skip;
      _take = $v.take;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentQueryLAdmin other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentQueryLAdmin;
  }

  @override
  void update(void Function(ShipmentQueryLAdminBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentQueryLAdmin build() => _build();

  _$ShipmentQueryLAdmin _build() {
    final _$result = _$v ??
        new _$ShipmentQueryLAdmin._(
            general: general,
            shippingDateFrom: shippingDateFrom,
            shippingDateTo: shippingDateTo,
            logisticServiceName: logisticServiceName,
            status: status,
            isReturn: isReturn,
            clientId: clientId,
            skip: skip,
            take: take);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
