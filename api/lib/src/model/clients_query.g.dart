// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_query.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientsQuery extends ClientsQuery {
  @override
  final String? general;
  @override
  final String? phoneNo;
  @override
  final int? totalShipmentsMin;
  @override
  final int? totalShipmentsMax;
  @override
  final int? skip;
  @override
  final int? take;

  factory _$ClientsQuery([void Function(ClientsQueryBuilder)? updates]) =>
      (new ClientsQueryBuilder()..update(updates))._build();

  _$ClientsQuery._(
      {this.general,
      this.phoneNo,
      this.totalShipmentsMin,
      this.totalShipmentsMax,
      this.skip,
      this.take})
      : super._();

  @override
  ClientsQuery rebuild(void Function(ClientsQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientsQueryBuilder toBuilder() => new ClientsQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientsQuery &&
        general == other.general &&
        phoneNo == other.phoneNo &&
        totalShipmentsMin == other.totalShipmentsMin &&
        totalShipmentsMax == other.totalShipmentsMax &&
        skip == other.skip &&
        take == other.take;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, general.hashCode);
    _$hash = $jc(_$hash, phoneNo.hashCode);
    _$hash = $jc(_$hash, totalShipmentsMin.hashCode);
    _$hash = $jc(_$hash, totalShipmentsMax.hashCode);
    _$hash = $jc(_$hash, skip.hashCode);
    _$hash = $jc(_$hash, take.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientsQuery')
          ..add('general', general)
          ..add('phoneNo', phoneNo)
          ..add('totalShipmentsMin', totalShipmentsMin)
          ..add('totalShipmentsMax', totalShipmentsMax)
          ..add('skip', skip)
          ..add('take', take))
        .toString();
  }
}

class ClientsQueryBuilder
    implements Builder<ClientsQuery, ClientsQueryBuilder> {
  _$ClientsQuery? _$v;

  String? _general;
  String? get general => _$this._general;
  set general(String? general) => _$this._general = general;

  String? _phoneNo;
  String? get phoneNo => _$this._phoneNo;
  set phoneNo(String? phoneNo) => _$this._phoneNo = phoneNo;

  int? _totalShipmentsMin;
  int? get totalShipmentsMin => _$this._totalShipmentsMin;
  set totalShipmentsMin(int? totalShipmentsMin) =>
      _$this._totalShipmentsMin = totalShipmentsMin;

  int? _totalShipmentsMax;
  int? get totalShipmentsMax => _$this._totalShipmentsMax;
  set totalShipmentsMax(int? totalShipmentsMax) =>
      _$this._totalShipmentsMax = totalShipmentsMax;

  int? _skip;
  int? get skip => _$this._skip;
  set skip(int? skip) => _$this._skip = skip;

  int? _take;
  int? get take => _$this._take;
  set take(int? take) => _$this._take = take;

  ClientsQueryBuilder() {
    ClientsQuery._defaults(this);
  }

  ClientsQueryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _general = $v.general;
      _phoneNo = $v.phoneNo;
      _totalShipmentsMin = $v.totalShipmentsMin;
      _totalShipmentsMax = $v.totalShipmentsMax;
      _skip = $v.skip;
      _take = $v.take;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientsQuery other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientsQuery;
  }

  @override
  void update(void Function(ClientsQueryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientsQuery build() => _build();

  _$ClientsQuery _build() {
    final _$result = _$v ??
        new _$ClientsQuery._(
            general: general,
            phoneNo: phoneNo,
            totalShipmentsMin: totalShipmentsMin,
            totalShipmentsMax: totalShipmentsMax,
            skip: skip,
            take: take);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
