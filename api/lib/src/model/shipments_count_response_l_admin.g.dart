// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipments_count_response_l_admin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentsCountResponseLAdmin extends ShipmentsCountResponseLAdmin {
  @override
  final int? totalShipments;
  @override
  final int? requestedShipments;
  @override
  final int? pickedShipments;
  @override
  final int? onTheWayShipments;
  @override
  final int? deliveredShipments;
  @override
  final int? clientsCount;

  factory _$ShipmentsCountResponseLAdmin(
          [void Function(ShipmentsCountResponseLAdminBuilder)? updates]) =>
      (new ShipmentsCountResponseLAdminBuilder()..update(updates))._build();

  _$ShipmentsCountResponseLAdmin._(
      {this.totalShipments,
      this.requestedShipments,
      this.pickedShipments,
      this.onTheWayShipments,
      this.deliveredShipments,
      this.clientsCount})
      : super._();

  @override
  ShipmentsCountResponseLAdmin rebuild(
          void Function(ShipmentsCountResponseLAdminBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentsCountResponseLAdminBuilder toBuilder() =>
      new ShipmentsCountResponseLAdminBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentsCountResponseLAdmin &&
        totalShipments == other.totalShipments &&
        requestedShipments == other.requestedShipments &&
        pickedShipments == other.pickedShipments &&
        onTheWayShipments == other.onTheWayShipments &&
        deliveredShipments == other.deliveredShipments &&
        clientsCount == other.clientsCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalShipments.hashCode);
    _$hash = $jc(_$hash, requestedShipments.hashCode);
    _$hash = $jc(_$hash, pickedShipments.hashCode);
    _$hash = $jc(_$hash, onTheWayShipments.hashCode);
    _$hash = $jc(_$hash, deliveredShipments.hashCode);
    _$hash = $jc(_$hash, clientsCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentsCountResponseLAdmin')
          ..add('totalShipments', totalShipments)
          ..add('requestedShipments', requestedShipments)
          ..add('pickedShipments', pickedShipments)
          ..add('onTheWayShipments', onTheWayShipments)
          ..add('deliveredShipments', deliveredShipments)
          ..add('clientsCount', clientsCount))
        .toString();
  }
}

class ShipmentsCountResponseLAdminBuilder
    implements
        Builder<ShipmentsCountResponseLAdmin,
            ShipmentsCountResponseLAdminBuilder> {
  _$ShipmentsCountResponseLAdmin? _$v;

  int? _totalShipments;
  int? get totalShipments => _$this._totalShipments;
  set totalShipments(int? totalShipments) =>
      _$this._totalShipments = totalShipments;

  int? _requestedShipments;
  int? get requestedShipments => _$this._requestedShipments;
  set requestedShipments(int? requestedShipments) =>
      _$this._requestedShipments = requestedShipments;

  int? _pickedShipments;
  int? get pickedShipments => _$this._pickedShipments;
  set pickedShipments(int? pickedShipments) =>
      _$this._pickedShipments = pickedShipments;

  int? _onTheWayShipments;
  int? get onTheWayShipments => _$this._onTheWayShipments;
  set onTheWayShipments(int? onTheWayShipments) =>
      _$this._onTheWayShipments = onTheWayShipments;

  int? _deliveredShipments;
  int? get deliveredShipments => _$this._deliveredShipments;
  set deliveredShipments(int? deliveredShipments) =>
      _$this._deliveredShipments = deliveredShipments;

  int? _clientsCount;
  int? get clientsCount => _$this._clientsCount;
  set clientsCount(int? clientsCount) => _$this._clientsCount = clientsCount;

  ShipmentsCountResponseLAdminBuilder() {
    ShipmentsCountResponseLAdmin._defaults(this);
  }

  ShipmentsCountResponseLAdminBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalShipments = $v.totalShipments;
      _requestedShipments = $v.requestedShipments;
      _pickedShipments = $v.pickedShipments;
      _onTheWayShipments = $v.onTheWayShipments;
      _deliveredShipments = $v.deliveredShipments;
      _clientsCount = $v.clientsCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentsCountResponseLAdmin other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentsCountResponseLAdmin;
  }

  @override
  void update(void Function(ShipmentsCountResponseLAdminBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentsCountResponseLAdmin build() => _build();

  _$ShipmentsCountResponseLAdmin _build() {
    final _$result = _$v ??
        new _$ShipmentsCountResponseLAdmin._(
            totalShipments: totalShipments,
            requestedShipments: requestedShipments,
            pickedShipments: pickedShipments,
            onTheWayShipments: onTheWayShipments,
            deliveredShipments: deliveredShipments,
            clientsCount: clientsCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
