// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_query.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CustomerQuery extends CustomerQuery {
  @override
  final String? general;
  @override
  final String? phone;
  @override
  final int? countryId;
  @override
  final int? governorateId;
  @override
  final int? cityId;
  @override
  final DateTime? shipmentDateFrom;
  @override
  final DateTime? shipmentDateTo;
  @override
  final int? totalShipmentsMin;
  @override
  final int? totalShipmentsMax;
  @override
  final bool? orderDescending;
  @override
  final int? skip;
  @override
  final int? take;

  factory _$CustomerQuery([void Function(CustomerQueryBuilder)? updates]) =>
      (new CustomerQueryBuilder()..update(updates))._build();

  _$CustomerQuery._(
      {this.general,
      this.phone,
      this.countryId,
      this.governorateId,
      this.cityId,
      this.shipmentDateFrom,
      this.shipmentDateTo,
      this.totalShipmentsMin,
      this.totalShipmentsMax,
      this.orderDescending,
      this.skip,
      this.take})
      : super._();

  @override
  CustomerQuery rebuild(void Function(CustomerQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerQueryBuilder toBuilder() => new CustomerQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerQuery &&
        general == other.general &&
        phone == other.phone &&
        countryId == other.countryId &&
        governorateId == other.governorateId &&
        cityId == other.cityId &&
        shipmentDateFrom == other.shipmentDateFrom &&
        shipmentDateTo == other.shipmentDateTo &&
        totalShipmentsMin == other.totalShipmentsMin &&
        totalShipmentsMax == other.totalShipmentsMax &&
        orderDescending == other.orderDescending &&
        skip == other.skip &&
        take == other.take;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, general.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, countryId.hashCode);
    _$hash = $jc(_$hash, governorateId.hashCode);
    _$hash = $jc(_$hash, cityId.hashCode);
    _$hash = $jc(_$hash, shipmentDateFrom.hashCode);
    _$hash = $jc(_$hash, shipmentDateTo.hashCode);
    _$hash = $jc(_$hash, totalShipmentsMin.hashCode);
    _$hash = $jc(_$hash, totalShipmentsMax.hashCode);
    _$hash = $jc(_$hash, orderDescending.hashCode);
    _$hash = $jc(_$hash, skip.hashCode);
    _$hash = $jc(_$hash, take.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CustomerQuery')
          ..add('general', general)
          ..add('phone', phone)
          ..add('countryId', countryId)
          ..add('governorateId', governorateId)
          ..add('cityId', cityId)
          ..add('shipmentDateFrom', shipmentDateFrom)
          ..add('shipmentDateTo', shipmentDateTo)
          ..add('totalShipmentsMin', totalShipmentsMin)
          ..add('totalShipmentsMax', totalShipmentsMax)
          ..add('orderDescending', orderDescending)
          ..add('skip', skip)
          ..add('take', take))
        .toString();
  }
}

class CustomerQueryBuilder
    implements Builder<CustomerQuery, CustomerQueryBuilder> {
  _$CustomerQuery? _$v;

  String? _general;
  String? get general => _$this._general;
  set general(String? general) => _$this._general = general;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  int? _countryId;
  int? get countryId => _$this._countryId;
  set countryId(int? countryId) => _$this._countryId = countryId;

  int? _governorateId;
  int? get governorateId => _$this._governorateId;
  set governorateId(int? governorateId) =>
      _$this._governorateId = governorateId;

  int? _cityId;
  int? get cityId => _$this._cityId;
  set cityId(int? cityId) => _$this._cityId = cityId;

  DateTime? _shipmentDateFrom;
  DateTime? get shipmentDateFrom => _$this._shipmentDateFrom;
  set shipmentDateFrom(DateTime? shipmentDateFrom) =>
      _$this._shipmentDateFrom = shipmentDateFrom;

  DateTime? _shipmentDateTo;
  DateTime? get shipmentDateTo => _$this._shipmentDateTo;
  set shipmentDateTo(DateTime? shipmentDateTo) =>
      _$this._shipmentDateTo = shipmentDateTo;

  int? _totalShipmentsMin;
  int? get totalShipmentsMin => _$this._totalShipmentsMin;
  set totalShipmentsMin(int? totalShipmentsMin) =>
      _$this._totalShipmentsMin = totalShipmentsMin;

  int? _totalShipmentsMax;
  int? get totalShipmentsMax => _$this._totalShipmentsMax;
  set totalShipmentsMax(int? totalShipmentsMax) =>
      _$this._totalShipmentsMax = totalShipmentsMax;

  bool? _orderDescending;
  bool? get orderDescending => _$this._orderDescending;
  set orderDescending(bool? orderDescending) =>
      _$this._orderDescending = orderDescending;

  int? _skip;
  int? get skip => _$this._skip;
  set skip(int? skip) => _$this._skip = skip;

  int? _take;
  int? get take => _$this._take;
  set take(int? take) => _$this._take = take;

  CustomerQueryBuilder() {
    CustomerQuery._defaults(this);
  }

  CustomerQueryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _general = $v.general;
      _phone = $v.phone;
      _countryId = $v.countryId;
      _governorateId = $v.governorateId;
      _cityId = $v.cityId;
      _shipmentDateFrom = $v.shipmentDateFrom;
      _shipmentDateTo = $v.shipmentDateTo;
      _totalShipmentsMin = $v.totalShipmentsMin;
      _totalShipmentsMax = $v.totalShipmentsMax;
      _orderDescending = $v.orderDescending;
      _skip = $v.skip;
      _take = $v.take;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomerQuery other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomerQuery;
  }

  @override
  void update(void Function(CustomerQueryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CustomerQuery build() => _build();

  _$CustomerQuery _build() {
    final _$result = _$v ??
        new _$CustomerQuery._(
            general: general,
            phone: phone,
            countryId: countryId,
            governorateId: governorateId,
            cityId: cityId,
            shipmentDateFrom: shipmentDateFrom,
            shipmentDateTo: shipmentDateTo,
            totalShipmentsMin: totalShipmentsMin,
            totalShipmentsMax: totalShipmentsMax,
            orderDescending: orderDescending,
            skip: skip,
            take: take);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
