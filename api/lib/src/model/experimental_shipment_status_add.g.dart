// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experimental_shipment_status_add.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExperimentalShipmentStatusAdd extends ExperimentalShipmentStatusAdd {
  @override
  final int? shipmentId;
  @override
  final ShipmentStatusEnum? status;
  @override
  final String? description;
  @override
  final DateTime? createdAt;

  factory _$ExperimentalShipmentStatusAdd(
          [void Function(ExperimentalShipmentStatusAddBuilder)? updates]) =>
      (new ExperimentalShipmentStatusAddBuilder()..update(updates))._build();

  _$ExperimentalShipmentStatusAdd._(
      {this.shipmentId, this.status, this.description, this.createdAt})
      : super._();

  @override
  ExperimentalShipmentStatusAdd rebuild(
          void Function(ExperimentalShipmentStatusAddBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExperimentalShipmentStatusAddBuilder toBuilder() =>
      new ExperimentalShipmentStatusAddBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExperimentalShipmentStatusAdd &&
        shipmentId == other.shipmentId &&
        status == other.status &&
        description == other.description &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, shipmentId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExperimentalShipmentStatusAdd')
          ..add('shipmentId', shipmentId)
          ..add('status', status)
          ..add('description', description)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class ExperimentalShipmentStatusAddBuilder
    implements
        Builder<ExperimentalShipmentStatusAdd,
            ExperimentalShipmentStatusAddBuilder> {
  _$ExperimentalShipmentStatusAdd? _$v;

  int? _shipmentId;
  int? get shipmentId => _$this._shipmentId;
  set shipmentId(int? shipmentId) => _$this._shipmentId = shipmentId;

  ShipmentStatusEnum? _status;
  ShipmentStatusEnum? get status => _$this._status;
  set status(ShipmentStatusEnum? status) => _$this._status = status;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ExperimentalShipmentStatusAddBuilder() {
    ExperimentalShipmentStatusAdd._defaults(this);
  }

  ExperimentalShipmentStatusAddBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _shipmentId = $v.shipmentId;
      _status = $v.status;
      _description = $v.description;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExperimentalShipmentStatusAdd other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExperimentalShipmentStatusAdd;
  }

  @override
  void update(void Function(ExperimentalShipmentStatusAddBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExperimentalShipmentStatusAdd build() => _build();

  _$ExperimentalShipmentStatusAdd _build() {
    final _$result = _$v ??
        new _$ExperimentalShipmentStatusAdd._(
            shipmentId: shipmentId,
            status: status,
            description: description,
            createdAt: createdAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
