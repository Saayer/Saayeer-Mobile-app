// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentVM extends ShipmentVM {
  @override
  final String? number;
  @override
  final String? reciver;
  @override
  final String? size;
  @override
  final double? cost;
  @override
  final String? billStatus;

  factory _$ShipmentVM([void Function(ShipmentVMBuilder)? updates]) =>
      (new ShipmentVMBuilder()..update(updates))._build();

  _$ShipmentVM._(
      {this.number, this.reciver, this.size, this.cost, this.billStatus})
      : super._();

  @override
  ShipmentVM rebuild(void Function(ShipmentVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentVMBuilder toBuilder() => new ShipmentVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentVM &&
        number == other.number &&
        reciver == other.reciver &&
        size == other.size &&
        cost == other.cost &&
        billStatus == other.billStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, number.hashCode);
    _$hash = $jc(_$hash, reciver.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, cost.hashCode);
    _$hash = $jc(_$hash, billStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentVM')
          ..add('number', number)
          ..add('reciver', reciver)
          ..add('size', size)
          ..add('cost', cost)
          ..add('billStatus', billStatus))
        .toString();
  }
}

class ShipmentVMBuilder implements Builder<ShipmentVM, ShipmentVMBuilder> {
  _$ShipmentVM? _$v;

  String? _number;
  String? get number => _$this._number;
  set number(String? number) => _$this._number = number;

  String? _reciver;
  String? get reciver => _$this._reciver;
  set reciver(String? reciver) => _$this._reciver = reciver;

  String? _size;
  String? get size => _$this._size;
  set size(String? size) => _$this._size = size;

  double? _cost;
  double? get cost => _$this._cost;
  set cost(double? cost) => _$this._cost = cost;

  String? _billStatus;
  String? get billStatus => _$this._billStatus;
  set billStatus(String? billStatus) => _$this._billStatus = billStatus;

  ShipmentVMBuilder() {
    ShipmentVM._defaults(this);
  }

  ShipmentVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _number = $v.number;
      _reciver = $v.reciver;
      _size = $v.size;
      _cost = $v.cost;
      _billStatus = $v.billStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentVM;
  }

  @override
  void update(void Function(ShipmentVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentVM build() => _build();

  _$ShipmentVM _build() {
    final _$result = _$v ??
        new _$ShipmentVM._(
            number: number,
            reciver: reciver,
            size: size,
            cost: cost,
            billStatus: billStatus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
