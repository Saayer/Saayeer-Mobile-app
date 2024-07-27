// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PackageDetails extends PackageDetails {
  @override
  final double? weight;
  @override
  final double? length;
  @override
  final double? width;
  @override
  final double? height;
  @override
  final String? from;
  @override
  final String? to;
  @override
  final double? cost;

  factory _$PackageDetails([void Function(PackageDetailsBuilder)? updates]) =>
      (new PackageDetailsBuilder()..update(updates))._build();

  _$PackageDetails._(
      {this.weight,
      this.length,
      this.width,
      this.height,
      this.from,
      this.to,
      this.cost})
      : super._();

  @override
  PackageDetails rebuild(void Function(PackageDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PackageDetailsBuilder toBuilder() =>
      new PackageDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PackageDetails &&
        weight == other.weight &&
        length == other.length &&
        width == other.width &&
        height == other.height &&
        from == other.from &&
        to == other.to &&
        cost == other.cost;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, length.hashCode);
    _$hash = $jc(_$hash, width.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jc(_$hash, to.hashCode);
    _$hash = $jc(_$hash, cost.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PackageDetails')
          ..add('weight', weight)
          ..add('length', length)
          ..add('width', width)
          ..add('height', height)
          ..add('from', from)
          ..add('to', to)
          ..add('cost', cost))
        .toString();
  }
}

class PackageDetailsBuilder
    implements Builder<PackageDetails, PackageDetailsBuilder> {
  _$PackageDetails? _$v;

  double? _weight;
  double? get weight => _$this._weight;
  set weight(double? weight) => _$this._weight = weight;

  double? _length;
  double? get length => _$this._length;
  set length(double? length) => _$this._length = length;

  double? _width;
  double? get width => _$this._width;
  set width(double? width) => _$this._width = width;

  double? _height;
  double? get height => _$this._height;
  set height(double? height) => _$this._height = height;

  String? _from;
  String? get from => _$this._from;
  set from(String? from) => _$this._from = from;

  String? _to;
  String? get to => _$this._to;
  set to(String? to) => _$this._to = to;

  double? _cost;
  double? get cost => _$this._cost;
  set cost(double? cost) => _$this._cost = cost;

  PackageDetailsBuilder() {
    PackageDetails._defaults(this);
  }

  PackageDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _weight = $v.weight;
      _length = $v.length;
      _width = $v.width;
      _height = $v.height;
      _from = $v.from;
      _to = $v.to;
      _cost = $v.cost;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PackageDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PackageDetails;
  }

  @override
  void update(void Function(PackageDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PackageDetails build() => _build();

  _$PackageDetails _build() {
    final _$result = _$v ??
        new _$PackageDetails._(
            weight: weight,
            length: length,
            width: width,
            height: height,
            from: from,
            to: to,
            cost: cost);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
