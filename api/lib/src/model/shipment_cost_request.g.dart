// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_cost_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentCostRequest extends ShipmentCostRequest {
  @override
  final double? length;
  @override
  final double? height;
  @override
  final double? weight;
  @override
  final double? width;
  @override
  final String? contentDesc;
  @override
  final double? contentValue;
  @override
  final AddressableAddDto? senderAddress;
  @override
  final AddressableAddDto? receiverAddress;

  factory _$ShipmentCostRequest(
          [void Function(ShipmentCostRequestBuilder)? updates]) =>
      (new ShipmentCostRequestBuilder()..update(updates))._build();

  _$ShipmentCostRequest._(
      {this.length,
      this.height,
      this.weight,
      this.width,
      this.contentDesc,
      this.contentValue,
      this.senderAddress,
      this.receiverAddress})
      : super._();

  @override
  ShipmentCostRequest rebuild(
          void Function(ShipmentCostRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentCostRequestBuilder toBuilder() =>
      new ShipmentCostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentCostRequest &&
        length == other.length &&
        height == other.height &&
        weight == other.weight &&
        width == other.width &&
        contentDesc == other.contentDesc &&
        contentValue == other.contentValue &&
        senderAddress == other.senderAddress &&
        receiverAddress == other.receiverAddress;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, length.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, width.hashCode);
    _$hash = $jc(_$hash, contentDesc.hashCode);
    _$hash = $jc(_$hash, contentValue.hashCode);
    _$hash = $jc(_$hash, senderAddress.hashCode);
    _$hash = $jc(_$hash, receiverAddress.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentCostRequest')
          ..add('length', length)
          ..add('height', height)
          ..add('weight', weight)
          ..add('width', width)
          ..add('contentDesc', contentDesc)
          ..add('contentValue', contentValue)
          ..add('senderAddress', senderAddress)
          ..add('receiverAddress', receiverAddress))
        .toString();
  }
}

class ShipmentCostRequestBuilder
    implements Builder<ShipmentCostRequest, ShipmentCostRequestBuilder> {
  _$ShipmentCostRequest? _$v;

  double? _length;
  double? get length => _$this._length;
  set length(double? length) => _$this._length = length;

  double? _height;
  double? get height => _$this._height;
  set height(double? height) => _$this._height = height;

  double? _weight;
  double? get weight => _$this._weight;
  set weight(double? weight) => _$this._weight = weight;

  double? _width;
  double? get width => _$this._width;
  set width(double? width) => _$this._width = width;

  String? _contentDesc;
  String? get contentDesc => _$this._contentDesc;
  set contentDesc(String? contentDesc) => _$this._contentDesc = contentDesc;

  double? _contentValue;
  double? get contentValue => _$this._contentValue;
  set contentValue(double? contentValue) => _$this._contentValue = contentValue;

  AddressableAddDtoBuilder? _senderAddress;
  AddressableAddDtoBuilder get senderAddress =>
      _$this._senderAddress ??= new AddressableAddDtoBuilder();
  set senderAddress(AddressableAddDtoBuilder? senderAddress) =>
      _$this._senderAddress = senderAddress;

  AddressableAddDtoBuilder? _receiverAddress;
  AddressableAddDtoBuilder get receiverAddress =>
      _$this._receiverAddress ??= new AddressableAddDtoBuilder();
  set receiverAddress(AddressableAddDtoBuilder? receiverAddress) =>
      _$this._receiverAddress = receiverAddress;

  ShipmentCostRequestBuilder() {
    ShipmentCostRequest._defaults(this);
  }

  ShipmentCostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _length = $v.length;
      _height = $v.height;
      _weight = $v.weight;
      _width = $v.width;
      _contentDesc = $v.contentDesc;
      _contentValue = $v.contentValue;
      _senderAddress = $v.senderAddress?.toBuilder();
      _receiverAddress = $v.receiverAddress?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentCostRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentCostRequest;
  }

  @override
  void update(void Function(ShipmentCostRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentCostRequest build() => _build();

  _$ShipmentCostRequest _build() {
    _$ShipmentCostRequest _$result;
    try {
      _$result = _$v ??
          new _$ShipmentCostRequest._(
              length: length,
              height: height,
              weight: weight,
              width: width,
              contentDesc: contentDesc,
              contentValue: contentValue,
              senderAddress: _senderAddress?.build(),
              receiverAddress: _receiverAddress?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'senderAddress';
        _senderAddress?.build();
        _$failedField = 'receiverAddress';
        _receiverAddress?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ShipmentCostRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
