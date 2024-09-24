// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipments_count_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentsCountResponse extends ShipmentsCountResponse {
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

  factory _$ShipmentsCountResponse(
          [void Function(ShipmentsCountResponseBuilder)? updates]) =>
      (new ShipmentsCountResponseBuilder()..update(updates))._build();

  _$ShipmentsCountResponse._(
      {this.totalShipments,
      this.requestedShipments,
      this.pickedShipments,
      this.onTheWayShipments,
      this.deliveredShipments})
      : super._();

  @override
  ShipmentsCountResponse rebuild(
          void Function(ShipmentsCountResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentsCountResponseBuilder toBuilder() =>
      new ShipmentsCountResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentsCountResponse &&
        totalShipments == other.totalShipments &&
        requestedShipments == other.requestedShipments &&
        pickedShipments == other.pickedShipments &&
        onTheWayShipments == other.onTheWayShipments &&
        deliveredShipments == other.deliveredShipments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalShipments.hashCode);
    _$hash = $jc(_$hash, requestedShipments.hashCode);
    _$hash = $jc(_$hash, pickedShipments.hashCode);
    _$hash = $jc(_$hash, onTheWayShipments.hashCode);
    _$hash = $jc(_$hash, deliveredShipments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentsCountResponse')
          ..add('totalShipments', totalShipments)
          ..add('requestedShipments', requestedShipments)
          ..add('pickedShipments', pickedShipments)
          ..add('onTheWayShipments', onTheWayShipments)
          ..add('deliveredShipments', deliveredShipments))
        .toString();
  }
}

class ShipmentsCountResponseBuilder
    implements Builder<ShipmentsCountResponse, ShipmentsCountResponseBuilder> {
  _$ShipmentsCountResponse? _$v;

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

  ShipmentsCountResponseBuilder() {
    ShipmentsCountResponse._defaults(this);
  }

  ShipmentsCountResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalShipments = $v.totalShipments;
      _requestedShipments = $v.requestedShipments;
      _pickedShipments = $v.pickedShipments;
      _onTheWayShipments = $v.onTheWayShipments;
      _deliveredShipments = $v.deliveredShipments;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentsCountResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentsCountResponse;
  }

  @override
  void update(void Function(ShipmentsCountResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentsCountResponse build() => _build();

  _$ShipmentsCountResponse _build() {
    final _$result = _$v ??
        new _$ShipmentsCountResponse._(
            totalShipments: totalShipments,
            requestedShipments: requestedShipments,
            pickedShipments: pickedShipments,
            onTheWayShipments: onTheWayShipments,
            deliveredShipments: deliveredShipments);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
