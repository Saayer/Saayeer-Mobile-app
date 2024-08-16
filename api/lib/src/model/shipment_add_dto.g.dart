// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_add_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentAddDto extends ShipmentAddDto {
  @override
  final int? shipmentId;
  @override
  final int? length;
  @override
  final int? height;
  @override
  final int? weight;
  @override
  final int? contentDesc;
  @override
  final int? contentValue;
  @override
  final int? senderCustomerId;
  @override
  final int? receiverCustomerId;
  @override
  final int? senderStoreId;
  @override
  final int? receiverStoreId;

  factory _$ShipmentAddDto([void Function(ShipmentAddDtoBuilder)? updates]) =>
      (new ShipmentAddDtoBuilder()..update(updates))._build();

  _$ShipmentAddDto._(
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
  ShipmentAddDto rebuild(void Function(ShipmentAddDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentAddDtoBuilder toBuilder() =>
      new ShipmentAddDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentAddDto &&
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
    return (newBuiltValueToStringHelper(r'ShipmentAddDto')
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

class ShipmentAddDtoBuilder
    implements Builder<ShipmentAddDto, ShipmentAddDtoBuilder> {
  _$ShipmentAddDto? _$v;

  int? _shipmentId;
  int? get shipmentId => _$this._shipmentId;
  set shipmentId(int? shipmentId) => _$this._shipmentId = shipmentId;

  int? _length;
  int? get length => _$this._length;
  set length(int? length) => _$this._length = length;

  int? _height;
  int? get height => _$this._height;
  set height(int? height) => _$this._height = height;

  int? _weight;
  int? get weight => _$this._weight;
  set weight(int? weight) => _$this._weight = weight;

  int? _contentDesc;
  int? get contentDesc => _$this._contentDesc;
  set contentDesc(int? contentDesc) => _$this._contentDesc = contentDesc;

  int? _contentValue;
  int? get contentValue => _$this._contentValue;
  set contentValue(int? contentValue) => _$this._contentValue = contentValue;

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

  ShipmentAddDtoBuilder() {
    ShipmentAddDto._defaults(this);
  }

  ShipmentAddDtoBuilder get _$this {
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
  void replace(ShipmentAddDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentAddDto;
  }

  @override
  void update(void Function(ShipmentAddDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentAddDto build() => _build();

  _$ShipmentAddDto _build() {
    final _$result = _$v ??
        new _$ShipmentAddDto._(
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
