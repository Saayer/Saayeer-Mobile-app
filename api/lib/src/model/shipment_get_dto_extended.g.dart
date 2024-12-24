// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_get_dto_extended.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentGetDtoExtended extends ShipmentGetDtoExtended {
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
  final String? createdAt;
  @override
  final String? logisticServiceName;
  @override
  final ShipmentStatusEnum? status;
  @override
  final String? labelURL;
  @override
  final String? traceId;
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
  @override
  final ClientGetDto? client;

  factory _$ShipmentGetDtoExtended(
          [void Function(ShipmentGetDtoExtendedBuilder)? updates]) =>
      (new ShipmentGetDtoExtendedBuilder()..update(updates))._build();

  _$ShipmentGetDtoExtended._(
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
      this.labelURL,
      this.traceId,
      this.senderCustomerId,
      this.receiverCustomerId,
      this.senderStoreId,
      this.receiverStoreId,
      this.senderCustomer,
      this.receiverCustomer,
      this.senderStore,
      this.receiverStore,
      this.client})
      : super._();

  @override
  ShipmentGetDtoExtended rebuild(
          void Function(ShipmentGetDtoExtendedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentGetDtoExtendedBuilder toBuilder() =>
      new ShipmentGetDtoExtendedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentGetDtoExtended &&
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
        labelURL == other.labelURL &&
        traceId == other.traceId &&
        senderCustomerId == other.senderCustomerId &&
        receiverCustomerId == other.receiverCustomerId &&
        senderStoreId == other.senderStoreId &&
        receiverStoreId == other.receiverStoreId &&
        senderCustomer == other.senderCustomer &&
        receiverCustomer == other.receiverCustomer &&
        senderStore == other.senderStore &&
        receiverStore == other.receiverStore &&
        client == other.client;
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
    _$hash = $jc(_$hash, labelURL.hashCode);
    _$hash = $jc(_$hash, traceId.hashCode);
    _$hash = $jc(_$hash, senderCustomerId.hashCode);
    _$hash = $jc(_$hash, receiverCustomerId.hashCode);
    _$hash = $jc(_$hash, senderStoreId.hashCode);
    _$hash = $jc(_$hash, receiverStoreId.hashCode);
    _$hash = $jc(_$hash, senderCustomer.hashCode);
    _$hash = $jc(_$hash, receiverCustomer.hashCode);
    _$hash = $jc(_$hash, senderStore.hashCode);
    _$hash = $jc(_$hash, receiverStore.hashCode);
    _$hash = $jc(_$hash, client.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentGetDtoExtended')
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
          ..add('labelURL', labelURL)
          ..add('traceId', traceId)
          ..add('senderCustomerId', senderCustomerId)
          ..add('receiverCustomerId', receiverCustomerId)
          ..add('senderStoreId', senderStoreId)
          ..add('receiverStoreId', receiverStoreId)
          ..add('senderCustomer', senderCustomer)
          ..add('receiverCustomer', receiverCustomer)
          ..add('senderStore', senderStore)
          ..add('receiverStore', receiverStore)
          ..add('client', client))
        .toString();
  }
}

class ShipmentGetDtoExtendedBuilder
    implements Builder<ShipmentGetDtoExtended, ShipmentGetDtoExtendedBuilder> {
  _$ShipmentGetDtoExtended? _$v;

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

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _logisticServiceName;
  String? get logisticServiceName => _$this._logisticServiceName;
  set logisticServiceName(String? logisticServiceName) =>
      _$this._logisticServiceName = logisticServiceName;

  ShipmentStatusEnum? _status;
  ShipmentStatusEnum? get status => _$this._status;
  set status(ShipmentStatusEnum? status) => _$this._status = status;

  String? _labelURL;
  String? get labelURL => _$this._labelURL;
  set labelURL(String? labelURL) => _$this._labelURL = labelURL;

  String? _traceId;
  String? get traceId => _$this._traceId;
  set traceId(String? traceId) => _$this._traceId = traceId;

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

  ClientGetDtoBuilder? _client;
  ClientGetDtoBuilder get client =>
      _$this._client ??= new ClientGetDtoBuilder();
  set client(ClientGetDtoBuilder? client) => _$this._client = client;

  ShipmentGetDtoExtendedBuilder() {
    ShipmentGetDtoExtended._defaults(this);
  }

  ShipmentGetDtoExtendedBuilder get _$this {
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
      _labelURL = $v.labelURL;
      _traceId = $v.traceId;
      _senderCustomerId = $v.senderCustomerId;
      _receiverCustomerId = $v.receiverCustomerId;
      _senderStoreId = $v.senderStoreId;
      _receiverStoreId = $v.receiverStoreId;
      _senderCustomer = $v.senderCustomer?.toBuilder();
      _receiverCustomer = $v.receiverCustomer?.toBuilder();
      _senderStore = $v.senderStore?.toBuilder();
      _receiverStore = $v.receiverStore?.toBuilder();
      _client = $v.client?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentGetDtoExtended other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentGetDtoExtended;
  }

  @override
  void update(void Function(ShipmentGetDtoExtendedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentGetDtoExtended build() => _build();

  _$ShipmentGetDtoExtended _build() {
    _$ShipmentGetDtoExtended _$result;
    try {
      _$result = _$v ??
          new _$ShipmentGetDtoExtended._(
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
              labelURL: labelURL,
              traceId: traceId,
              senderCustomerId: senderCustomerId,
              receiverCustomerId: receiverCustomerId,
              senderStoreId: senderStoreId,
              receiverStoreId: receiverStoreId,
              senderCustomer: _senderCustomer?.build(),
              receiverCustomer: _receiverCustomer?.build(),
              senderStore: _senderStore?.build(),
              receiverStore: _receiverStore?.build(),
              client: _client?.build());
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
        _$failedField = 'client';
        _client?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ShipmentGetDtoExtended', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
