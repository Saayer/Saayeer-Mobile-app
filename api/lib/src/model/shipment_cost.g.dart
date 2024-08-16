// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_cost.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentCost extends ShipmentCost {
  @override
  final String? name;
  @override
  final String? company;
  @override
  final double? cost;

  factory _$ShipmentCost([void Function(ShipmentCostBuilder)? updates]) =>
      (new ShipmentCostBuilder()..update(updates))._build();

  _$ShipmentCost._({this.name, this.company, this.cost}) : super._();

  @override
  ShipmentCost rebuild(void Function(ShipmentCostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentCostBuilder toBuilder() => new ShipmentCostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentCost &&
        name == other.name &&
        company == other.company &&
        cost == other.cost;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, company.hashCode);
    _$hash = $jc(_$hash, cost.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentCost')
          ..add('name', name)
          ..add('company', company)
          ..add('cost', cost))
        .toString();
  }
}

class ShipmentCostBuilder
    implements Builder<ShipmentCost, ShipmentCostBuilder> {
  _$ShipmentCost? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  double? _cost;
  double? get cost => _$this._cost;
  set cost(double? cost) => _$this._cost = cost;

  ShipmentCostBuilder() {
    ShipmentCost._defaults(this);
  }

  ShipmentCostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _company = $v.company;
      _cost = $v.cost;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentCost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentCost;
  }

  @override
  void update(void Function(ShipmentCostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentCost build() => _build();

  _$ShipmentCost _build() {
    final _$result =
        _$v ?? new _$ShipmentCost._(name: name, company: company, cost: cost);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
