// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_get_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentGetDto extends ShipmentGetDto {
  @override
  final int? shipmentId;
  @override
  final double? length;
  @override
  final double? height;
  @override
  final double? weight;
  @override
  final String? contentDesc;
  @override
  final double? contentValue;
  @override
  final int? senderCustomerId;
  @override
  final int? receiverCustomerId;
  @override
  final int? senderStoreId;
  @override
  final int? receiverStoreId;

  factory _$ShipmentGetDto([void Function(ShipmentGetDtoBuilder)? updates]) =>
      (new ShipmentGetDtoBuilder()..update(updates))._build();

  _$ShipmentGetDto._(
      {this.shipmentId,
      this.length,
      this.height,
      this.weight,
      this.contentDesc,
      this.contentValue,
      this.senderCustomerId,
      this.receiverCustomerId,
      this.senderStoreId,
      this.receiverStoreId})
      : super._();

  @override
  ShipmentGetDto rebuild(void Function(ShipmentGetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentGetDtoBuilder toBuilder() =>
      new ShipmentGetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentGetDto &&
        shipmentId == other.shipmentId &&
        length == other.length &&
        height == other.height &&
        weight == other.weight &&
        contentDesc == other.contentDesc &&
        contentValue == other.contentValue &&
        senderCustomerId == other.senderCustomerId &&
        receiverCustomerId == other.receiverCustomerId &&
        senderStoreId == other.senderStoreId &&
        receiverStoreId == other.receiverStoreId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, shipmentId.hashCode);
    _$hash = $jc(_$hash, length.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, contentDesc.hashCode);
    _$hash = $jc(_$hash, contentValue.hashCode);
    _$hash = $jc(_$hash, senderCustomerId.hashCode);
    _$hash = $jc(_$hash, receiverCustomerId.hashCode);
    _$hash = $jc(_$hash, senderStoreId.hashCode);
    _$hash = $jc(_$hash, receiverStoreId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentGetDto')
          ..add('shipmentId', shipmentId)
          ..add('length', length)
          ..add('height', height)
          ..add('weight', weight)
          ..add('contentDesc', contentDesc)
          ..add('contentValue', contentValue)
          ..add('senderCustomerId', senderCustomerId)
          ..add('receiverCustomerId', receiverCustomerId)
          ..add('senderStoreId', senderStoreId)
          ..add('receiverStoreId', receiverStoreId))
        .toString();
  }
}

class ShipmentGetDtoBuilder
    implements Builder<ShipmentGetDto, ShipmentGetDtoBuilder> {
  _$ShipmentGetDto? _$v;

  int? _shipmentId;
  int? get shipmentId => _$this._shipmentId;
  set shipmentId(int? shipmentId) => _$this._shipmentId = shipmentId;

  double? _length;
  double? get length => _$this._length;
  set length(double? length) => _$this._length = length;

  double? _height;
  double? get height => _$this._height;
  set height(double? height) => _$this._height = height;

  double? _weight;
  double? get weight => _$this._weight;
  set weight(double? weight) => _$this._weight = weight;

  String? _contentDesc;
  String? get contentDesc => _$this._contentDesc;
  set contentDesc(String? contentDesc) => _$this._contentDesc = contentDesc;

  double? _contentValue;
  double? get contentValue => _$this._contentValue;
  set contentValue(double? contentValue) => _$this._contentValue = contentValue;

  int? _senderCustomerId;
  int? get senderCustomerId => _$this._senderCustomerId;
  set senderCustomerId(int? senderCustomerId) =>
      _$this._senderCustomerId = senderCustomerId;

  int? _receiverCustomerId;
  int? get receiverCustomerId => _$this._receiverCustomerId;
  set receiverCustomerId(int? receiverCustomerId) =>
      _$this._receiverCustomerId = receiverCustomerId;

  int? _senderStoreId;
  int? get senderStoreId => _$this._senderStoreId;
  set senderStoreId(int? senderStoreId) =>
      _$this._senderStoreId = senderStoreId;

  int? _receiverStoreId;
  int? get receiverStoreId => _$this._receiverStoreId;
  set receiverStoreId(int? receiverStoreId) =>
      _$this._receiverStoreId = receiverStoreId;

  ShipmentGetDtoBuilder() {
    ShipmentGetDto._defaults(this);
  }

  ShipmentGetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _shipmentId = $v.shipmentId;
      _length = $v.length;
      _height = $v.height;
      _weight = $v.weight;
      _contentDesc = $v.contentDesc;
      _contentValue = $v.contentValue;
      _senderCustomerId = $v.senderCustomerId;
      _receiverCustomerId = $v.receiverCustomerId;
      _senderStoreId = $v.senderStoreId;
      _receiverStoreId = $v.receiverStoreId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentGetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentGetDto;
  }

  @override
  void update(void Function(ShipmentGetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentGetDto build() => _build();

  _$ShipmentGetDto _build() {
    final _$result = _$v ??
        new _$ShipmentGetDto._(
            shipmentId: shipmentId,
            length: length,
            height: height,
            weight: weight,
            contentDesc: contentDesc,
            contentValue: contentValue,
            senderCustomerId: senderCustomerId,
            receiverCustomerId: receiverCustomerId,
            senderStoreId: senderStoreId,
            receiverStoreId: receiverStoreId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
