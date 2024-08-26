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
  final double? width;
  @override
  final double? weight;
  @override
  final String? contentDesc;
  @override
  final double? contentValue;
  @override
  final double? cost;
  @override
  final DateTime? createdAt;
  @override
  final String? logisticServiceName;
  @override
  final ShipmentStatus? status;
  @override
  final int? senderCustomerId;
  @override
  final int? receiverCustomerId;
  @override
  final int? senderStoreId;
  @override
  final int? receiverStoreId;
  @override
  final CustomerShipmentGetDto? senderCustomer;
  @override
  final CustomerShipmentGetDto? receiverCustomer;
  @override
  final StoreShipmentGetDto? senderStore;
  @override
  final StoreShipmentGetDto? receiverStore;

  factory _$ShipmentGetDto([void Function(ShipmentGetDtoBuilder)? updates]) =>
      (new ShipmentGetDtoBuilder()..update(updates))._build();

  _$ShipmentGetDto._(
      {this.shipmentId,
      this.length,
      this.height,
      this.width,
      this.weight,
      this.contentDesc,
      this.contentValue,
      this.cost,
      this.createdAt,
      this.logisticServiceName,
      this.status,
      this.senderCustomerId,
      this.receiverCustomerId,
      this.senderStoreId,
      this.receiverStoreId,
      this.senderCustomer,
      this.receiverCustomer,
      this.senderStore,
      this.receiverStore})
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
        width == other.width &&
        weight == other.weight &&
        contentDesc == other.contentDesc &&
        contentValue == other.contentValue &&
        cost == other.cost &&
        createdAt == other.createdAt &&
        logisticServiceName == other.logisticServiceName &&
        status == other.status &&
        senderCustomerId == other.senderCustomerId &&
        receiverCustomerId == other.receiverCustomerId &&
        senderStoreId == other.senderStoreId &&
        receiverStoreId == other.receiverStoreId &&
        senderCustomer == other.senderCustomer &&
        receiverCustomer == other.receiverCustomer &&
        senderStore == other.senderStore &&
        receiverStore == other.receiverStore;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, shipmentId.hashCode);
    _$hash = $jc(_$hash, length.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, width.hashCode);
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, contentDesc.hashCode);
    _$hash = $jc(_$hash, contentValue.hashCode);
    _$hash = $jc(_$hash, cost.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, logisticServiceName.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, senderCustomerId.hashCode);
    _$hash = $jc(_$hash, receiverCustomerId.hashCode);
    _$hash = $jc(_$hash, senderStoreId.hashCode);
    _$hash = $jc(_$hash, receiverStoreId.hashCode);
    _$hash = $jc(_$hash, senderCustomer.hashCode);
    _$hash = $jc(_$hash, receiverCustomer.hashCode);
    _$hash = $jc(_$hash, senderStore.hashCode);
    _$hash = $jc(_$hash, receiverStore.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentGetDto')
          ..add('shipmentId', shipmentId)
          ..add('length', length)
          ..add('height', height)
          ..add('width', width)
          ..add('weight', weight)
          ..add('contentDesc', contentDesc)
          ..add('contentValue', contentValue)
          ..add('cost', cost)
          ..add('createdAt', createdAt)
          ..add('logisticServiceName', logisticServiceName)
          ..add('status', status)
          ..add('senderCustomerId', senderCustomerId)
          ..add('receiverCustomerId', receiverCustomerId)
          ..add('senderStoreId', senderStoreId)
          ..add('receiverStoreId', receiverStoreId)
          ..add('senderCustomer', senderCustomer)
          ..add('receiverCustomer', receiverCustomer)
          ..add('senderStore', senderStore)
          ..add('receiverStore', receiverStore))
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

  double? _width;
  double? get width => _$this._width;
  set width(double? width) => _$this._width = width;

  double? _weight;
  double? get weight => _$this._weight;
  set weight(double? weight) => _$this._weight = weight;

  String? _contentDesc;
  String? get contentDesc => _$this._contentDesc;
  set contentDesc(String? contentDesc) => _$this._contentDesc = contentDesc;

  double? _contentValue;
  double? get contentValue => _$this._contentValue;
  set contentValue(double? contentValue) => _$this._contentValue = contentValue;

  double? _cost;
  double? get cost => _$this._cost;
  set cost(double? cost) => _$this._cost = cost;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _logisticServiceName;
  String? get logisticServiceName => _$this._logisticServiceName;
  set logisticServiceName(String? logisticServiceName) =>
      _$this._logisticServiceName = logisticServiceName;

  ShipmentStatus? _status;
  ShipmentStatus? get status => _$this._status;
  set status(ShipmentStatus? status) => _$this._status = status;

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

  CustomerShipmentGetDtoBuilder? _senderCustomer;
  CustomerShipmentGetDtoBuilder get senderCustomer =>
      _$this._senderCustomer ??= new CustomerShipmentGetDtoBuilder();
  set senderCustomer(CustomerShipmentGetDtoBuilder? senderCustomer) =>
      _$this._senderCustomer = senderCustomer;

  CustomerShipmentGetDtoBuilder? _receiverCustomer;
  CustomerShipmentGetDtoBuilder get receiverCustomer =>
      _$this._receiverCustomer ??= new CustomerShipmentGetDtoBuilder();
  set receiverCustomer(CustomerShipmentGetDtoBuilder? receiverCustomer) =>
      _$this._receiverCustomer = receiverCustomer;

  StoreShipmentGetDtoBuilder? _senderStore;
  StoreShipmentGetDtoBuilder get senderStore =>
      _$this._senderStore ??= new StoreShipmentGetDtoBuilder();
  set senderStore(StoreShipmentGetDtoBuilder? senderStore) =>
      _$this._senderStore = senderStore;

  StoreShipmentGetDtoBuilder? _receiverStore;
  StoreShipmentGetDtoBuilder get receiverStore =>
      _$this._receiverStore ??= new StoreShipmentGetDtoBuilder();
  set receiverStore(StoreShipmentGetDtoBuilder? receiverStore) =>
      _$this._receiverStore = receiverStore;

  ShipmentGetDtoBuilder() {
    ShipmentGetDto._defaults(this);
  }

  ShipmentGetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _shipmentId = $v.shipmentId;
      _length = $v.length;
      _height = $v.height;
      _width = $v.width;
      _weight = $v.weight;
      _contentDesc = $v.contentDesc;
      _contentValue = $v.contentValue;
      _cost = $v.cost;
      _createdAt = $v.createdAt;
      _logisticServiceName = $v.logisticServiceName;
      _status = $v.status;
      _senderCustomerId = $v.senderCustomerId;
      _receiverCustomerId = $v.receiverCustomerId;
      _senderStoreId = $v.senderStoreId;
      _receiverStoreId = $v.receiverStoreId;
      _senderCustomer = $v.senderCustomer?.toBuilder();
      _receiverCustomer = $v.receiverCustomer?.toBuilder();
      _senderStore = $v.senderStore?.toBuilder();
      _receiverStore = $v.receiverStore?.toBuilder();
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
    _$ShipmentGetDto _$result;
    try {
      _$result = _$v ??
          new _$ShipmentGetDto._(
              shipmentId: shipmentId,
              length: length,
              height: height,
              width: width,
              weight: weight,
              contentDesc: contentDesc,
              contentValue: contentValue,
              cost: cost,
              createdAt: createdAt,
              logisticServiceName: logisticServiceName,
              status: status,
              senderCustomerId: senderCustomerId,
              receiverCustomerId: receiverCustomerId,
              senderStoreId: senderStoreId,
              receiverStoreId: receiverStoreId,
              senderCustomer: _senderCustomer?.build(),
              receiverCustomer: _receiverCustomer?.build(),
              senderStore: _senderStore?.build(),
              receiverStore: _receiverStore?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'senderCustomer';
        _senderCustomer?.build();
        _$failedField = 'receiverCustomer';
        _receiverCustomer?.build();
        _$failedField = 'senderStore';
        _senderStore?.build();
        _$failedField = 'receiverStore';
        _receiverStore?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ShipmentGetDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
