// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experimental_shipment_created_at_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExperimentalShipmentCreatedAtRequest
    extends ExperimentalShipmentCreatedAtRequest {
  @override
  final DateTime? createdAt;
  @override
  final int? shipmentId;

  factory _$ExperimentalShipmentCreatedAtRequest(
          [void Function(ExperimentalShipmentCreatedAtRequestBuilder)?
              updates]) =>
      (new ExperimentalShipmentCreatedAtRequestBuilder()..update(updates))
          ._build();

  _$ExperimentalShipmentCreatedAtRequest._({this.createdAt, this.shipmentId})
      : super._();

  @override
  ExperimentalShipmentCreatedAtRequest rebuild(
          void Function(ExperimentalShipmentCreatedAtRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExperimentalShipmentCreatedAtRequestBuilder toBuilder() =>
      new ExperimentalShipmentCreatedAtRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExperimentalShipmentCreatedAtRequest &&
        createdAt == other.createdAt &&
        shipmentId == other.shipmentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, shipmentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExperimentalShipmentCreatedAtRequest')
          ..add('createdAt', createdAt)
          ..add('shipmentId', shipmentId))
        .toString();
  }
}

class ExperimentalShipmentCreatedAtRequestBuilder
    implements
        Builder<ExperimentalShipmentCreatedAtRequest,
            ExperimentalShipmentCreatedAtRequestBuilder> {
  _$ExperimentalShipmentCreatedAtRequest? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  int? _shipmentId;
  int? get shipmentId => _$this._shipmentId;
  set shipmentId(int? shipmentId) => _$this._shipmentId = shipmentId;

  ExperimentalShipmentCreatedAtRequestBuilder() {
    ExperimentalShipmentCreatedAtRequest._defaults(this);
  }

  ExperimentalShipmentCreatedAtRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _shipmentId = $v.shipmentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExperimentalShipmentCreatedAtRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExperimentalShipmentCreatedAtRequest;
  }

  @override
  void update(
      void Function(ExperimentalShipmentCreatedAtRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExperimentalShipmentCreatedAtRequest build() => _build();

  _$ExperimentalShipmentCreatedAtRequest _build() {
    final _$result = _$v ??
        new _$ExperimentalShipmentCreatedAtRequest._(
            createdAt: createdAt, shipmentId: shipmentId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
