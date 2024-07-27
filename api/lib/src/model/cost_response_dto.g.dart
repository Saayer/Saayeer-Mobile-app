// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CostResponseDto extends CostResponseDto {
  @override
  final String? shipperCode;
  @override
  final String? name;
  @override
  final String? icon;
  @override
  final String? featuereName;
  @override
  final int? deliverDays;
  @override
  final String? deliverDaysPharse;
  @override
  final double? totalPrice;

  factory _$CostResponseDto([void Function(CostResponseDtoBuilder)? updates]) =>
      (new CostResponseDtoBuilder()..update(updates))._build();

  _$CostResponseDto._(
      {this.shipperCode,
      this.name,
      this.icon,
      this.featuereName,
      this.deliverDays,
      this.deliverDaysPharse,
      this.totalPrice})
      : super._();

  @override
  CostResponseDto rebuild(void Function(CostResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CostResponseDtoBuilder toBuilder() =>
      new CostResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CostResponseDto &&
        shipperCode == other.shipperCode &&
        name == other.name &&
        icon == other.icon &&
        featuereName == other.featuereName &&
        deliverDays == other.deliverDays &&
        deliverDaysPharse == other.deliverDaysPharse &&
        totalPrice == other.totalPrice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, shipperCode.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, featuereName.hashCode);
    _$hash = $jc(_$hash, deliverDays.hashCode);
    _$hash = $jc(_$hash, deliverDaysPharse.hashCode);
    _$hash = $jc(_$hash, totalPrice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CostResponseDto')
          ..add('shipperCode', shipperCode)
          ..add('name', name)
          ..add('icon', icon)
          ..add('featuereName', featuereName)
          ..add('deliverDays', deliverDays)
          ..add('deliverDaysPharse', deliverDaysPharse)
          ..add('totalPrice', totalPrice))
        .toString();
  }
}

class CostResponseDtoBuilder
    implements Builder<CostResponseDto, CostResponseDtoBuilder> {
  _$CostResponseDto? _$v;

  String? _shipperCode;
  String? get shipperCode => _$this._shipperCode;
  set shipperCode(String? shipperCode) => _$this._shipperCode = shipperCode;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _featuereName;
  String? get featuereName => _$this._featuereName;
  set featuereName(String? featuereName) => _$this._featuereName = featuereName;

  int? _deliverDays;
  int? get deliverDays => _$this._deliverDays;
  set deliverDays(int? deliverDays) => _$this._deliverDays = deliverDays;

  String? _deliverDaysPharse;
  String? get deliverDaysPharse => _$this._deliverDaysPharse;
  set deliverDaysPharse(String? deliverDaysPharse) =>
      _$this._deliverDaysPharse = deliverDaysPharse;

  double? _totalPrice;
  double? get totalPrice => _$this._totalPrice;
  set totalPrice(double? totalPrice) => _$this._totalPrice = totalPrice;

  CostResponseDtoBuilder() {
    CostResponseDto._defaults(this);
  }

  CostResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _shipperCode = $v.shipperCode;
      _name = $v.name;
      _icon = $v.icon;
      _featuereName = $v.featuereName;
      _deliverDays = $v.deliverDays;
      _deliverDaysPharse = $v.deliverDaysPharse;
      _totalPrice = $v.totalPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CostResponseDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CostResponseDto;
  }

  @override
  void update(void Function(CostResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CostResponseDto build() => _build();

  _$CostResponseDto _build() {
    final _$result = _$v ??
        new _$CostResponseDto._(
            shipperCode: shipperCode,
            name: name,
            icon: icon,
            featuereName: featuereName,
            deliverDays: deliverDays,
            deliverDaysPharse: deliverDaysPharse,
            totalPrice: totalPrice);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
