// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_cost.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ServiceCost extends ServiceCost {
  @override
  final String? name;
  @override
  final String? company;
  @override
  final double? price;
  @override
  final double? logisticCost;
  @override
  final int? workDaysMaximum;
  @override
  final int? workDaysMinimum;
  @override
  final String? estimatedShipmentDays;
  @override
  final bool? hasError;
  @override
  final String? errorMessage;
  @override
  final bool? isImplemented;

  factory _$ServiceCost([void Function(ServiceCostBuilder)? updates]) =>
      (new ServiceCostBuilder()..update(updates))._build();

  _$ServiceCost._(
      {this.name,
      this.company,
      this.price,
      this.logisticCost,
      this.workDaysMaximum,
      this.workDaysMinimum,
      this.estimatedShipmentDays,
      this.hasError,
      this.errorMessage,
      this.isImplemented})
      : super._();

  @override
  ServiceCost rebuild(void Function(ServiceCostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceCostBuilder toBuilder() => new ServiceCostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceCost &&
        name == other.name &&
        company == other.company &&
        price == other.price &&
        logisticCost == other.logisticCost &&
        workDaysMaximum == other.workDaysMaximum &&
        workDaysMinimum == other.workDaysMinimum &&
        estimatedShipmentDays == other.estimatedShipmentDays &&
        hasError == other.hasError &&
        errorMessage == other.errorMessage &&
        isImplemented == other.isImplemented;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, company.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, logisticCost.hashCode);
    _$hash = $jc(_$hash, workDaysMaximum.hashCode);
    _$hash = $jc(_$hash, workDaysMinimum.hashCode);
    _$hash = $jc(_$hash, estimatedShipmentDays.hashCode);
    _$hash = $jc(_$hash, hasError.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, isImplemented.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceCost')
          ..add('name', name)
          ..add('company', company)
          ..add('price', price)
          ..add('logisticCost', logisticCost)
          ..add('workDaysMaximum', workDaysMaximum)
          ..add('workDaysMinimum', workDaysMinimum)
          ..add('estimatedShipmentDays', estimatedShipmentDays)
          ..add('hasError', hasError)
          ..add('errorMessage', errorMessage)
          ..add('isImplemented', isImplemented))
        .toString();
  }
}

class ServiceCostBuilder implements Builder<ServiceCost, ServiceCostBuilder> {
  _$ServiceCost? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _logisticCost;
  double? get logisticCost => _$this._logisticCost;
  set logisticCost(double? logisticCost) => _$this._logisticCost = logisticCost;

  int? _workDaysMaximum;
  int? get workDaysMaximum => _$this._workDaysMaximum;
  set workDaysMaximum(int? workDaysMaximum) =>
      _$this._workDaysMaximum = workDaysMaximum;

  int? _workDaysMinimum;
  int? get workDaysMinimum => _$this._workDaysMinimum;
  set workDaysMinimum(int? workDaysMinimum) =>
      _$this._workDaysMinimum = workDaysMinimum;

  String? _estimatedShipmentDays;
  String? get estimatedShipmentDays => _$this._estimatedShipmentDays;
  set estimatedShipmentDays(String? estimatedShipmentDays) =>
      _$this._estimatedShipmentDays = estimatedShipmentDays;

  bool? _hasError;
  bool? get hasError => _$this._hasError;
  set hasError(bool? hasError) => _$this._hasError = hasError;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  bool? _isImplemented;
  bool? get isImplemented => _$this._isImplemented;
  set isImplemented(bool? isImplemented) =>
      _$this._isImplemented = isImplemented;

  ServiceCostBuilder() {
    ServiceCost._defaults(this);
  }

  ServiceCostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _company = $v.company;
      _price = $v.price;
      _logisticCost = $v.logisticCost;
      _workDaysMaximum = $v.workDaysMaximum;
      _workDaysMinimum = $v.workDaysMinimum;
      _estimatedShipmentDays = $v.estimatedShipmentDays;
      _hasError = $v.hasError;
      _errorMessage = $v.errorMessage;
      _isImplemented = $v.isImplemented;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceCost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceCost;
  }

  @override
  void update(void Function(ServiceCostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceCost build() => _build();

  _$ServiceCost _build() {
    final _$result = _$v ??
        new _$ServiceCost._(
            name: name,
            company: company,
            price: price,
            logisticCost: logisticCost,
            workDaysMaximum: workDaysMaximum,
            workDaysMinimum: workDaysMinimum,
            estimatedShipmentDays: estimatedShipmentDays,
            hasError: hasError,
            errorMessage: errorMessage,
            isImplemented: isImplemented);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
