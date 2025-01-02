// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistic_cost_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogisticCostDto extends LogisticCostDto {
  @override
  final LogisticServiceGetDto? logisticService;
  @override
  final double? price;
  @override
  final double? logisticCost;
  @override
  final bool? hasError;
  @override
  final String? errorMessage;

  factory _$LogisticCostDto([void Function(LogisticCostDtoBuilder)? updates]) =>
      (new LogisticCostDtoBuilder()..update(updates))._build();

  _$LogisticCostDto._(
      {this.logisticService,
      this.price,
      this.logisticCost,
      this.hasError,
      this.errorMessage})
      : super._();

  @override
  LogisticCostDto rebuild(void Function(LogisticCostDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogisticCostDtoBuilder toBuilder() =>
      new LogisticCostDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogisticCostDto &&
        logisticService == other.logisticService &&
        price == other.price &&
        logisticCost == other.logisticCost &&
        hasError == other.hasError &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, logisticService.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, logisticCost.hashCode);
    _$hash = $jc(_$hash, hasError.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogisticCostDto')
          ..add('logisticService', logisticService)
          ..add('price', price)
          ..add('logisticCost', logisticCost)
          ..add('hasError', hasError)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class LogisticCostDtoBuilder
    implements Builder<LogisticCostDto, LogisticCostDtoBuilder> {
  _$LogisticCostDto? _$v;

  LogisticServiceGetDtoBuilder? _logisticService;
  LogisticServiceGetDtoBuilder get logisticService =>
      _$this._logisticService ??= new LogisticServiceGetDtoBuilder();
  set logisticService(LogisticServiceGetDtoBuilder? logisticService) =>
      _$this._logisticService = logisticService;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _logisticCost;
  double? get logisticCost => _$this._logisticCost;
  set logisticCost(double? logisticCost) => _$this._logisticCost = logisticCost;

  bool? _hasError;
  bool? get hasError => _$this._hasError;
  set hasError(bool? hasError) => _$this._hasError = hasError;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  LogisticCostDtoBuilder() {
    LogisticCostDto._defaults(this);
  }

  LogisticCostDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _logisticService = $v.logisticService?.toBuilder();
      _price = $v.price;
      _logisticCost = $v.logisticCost;
      _hasError = $v.hasError;
      _errorMessage = $v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogisticCostDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogisticCostDto;
  }

  @override
  void update(void Function(LogisticCostDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogisticCostDto build() => _build();

  _$LogisticCostDto _build() {
    _$LogisticCostDto _$result;
    try {
      _$result = _$v ??
          new _$LogisticCostDto._(
              logisticService: _logisticService?.build(),
              price: price,
              logisticCost: logisticCost,
              hasError: hasError,
              errorMessage: errorMessage);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'logisticService';
        _logisticService?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LogisticCostDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
