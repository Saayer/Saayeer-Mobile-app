// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistic_service_get_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogisticServiceGetDto extends LogisticServiceGetDto {
  @override
  final int? logisticServiceId;
  @override
  final String? serviceName;
  @override
  final String? company;
  @override
  final bool? isImplemented;
  @override
  final bool? isEnabled;
  @override
  final int? workDaysMaximum;
  @override
  final int? workDaysMinimum;

  factory _$LogisticServiceGetDto(
          [void Function(LogisticServiceGetDtoBuilder)? updates]) =>
      (new LogisticServiceGetDtoBuilder()..update(updates))._build();

  _$LogisticServiceGetDto._(
      {this.logisticServiceId,
      this.serviceName,
      this.company,
      this.isImplemented,
      this.isEnabled,
      this.workDaysMaximum,
      this.workDaysMinimum})
      : super._();

  @override
  LogisticServiceGetDto rebuild(
          void Function(LogisticServiceGetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogisticServiceGetDtoBuilder toBuilder() =>
      new LogisticServiceGetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogisticServiceGetDto &&
        logisticServiceId == other.logisticServiceId &&
        serviceName == other.serviceName &&
        company == other.company &&
        isImplemented == other.isImplemented &&
        isEnabled == other.isEnabled &&
        workDaysMaximum == other.workDaysMaximum &&
        workDaysMinimum == other.workDaysMinimum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, logisticServiceId.hashCode);
    _$hash = $jc(_$hash, serviceName.hashCode);
    _$hash = $jc(_$hash, company.hashCode);
    _$hash = $jc(_$hash, isImplemented.hashCode);
    _$hash = $jc(_$hash, isEnabled.hashCode);
    _$hash = $jc(_$hash, workDaysMaximum.hashCode);
    _$hash = $jc(_$hash, workDaysMinimum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogisticServiceGetDto')
          ..add('logisticServiceId', logisticServiceId)
          ..add('serviceName', serviceName)
          ..add('company', company)
          ..add('isImplemented', isImplemented)
          ..add('isEnabled', isEnabled)
          ..add('workDaysMaximum', workDaysMaximum)
          ..add('workDaysMinimum', workDaysMinimum))
        .toString();
  }
}

class LogisticServiceGetDtoBuilder
    implements Builder<LogisticServiceGetDto, LogisticServiceGetDtoBuilder> {
  _$LogisticServiceGetDto? _$v;

  int? _logisticServiceId;
  int? get logisticServiceId => _$this._logisticServiceId;
  set logisticServiceId(int? logisticServiceId) =>
      _$this._logisticServiceId = logisticServiceId;

  String? _serviceName;
  String? get serviceName => _$this._serviceName;
  set serviceName(String? serviceName) => _$this._serviceName = serviceName;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  bool? _isImplemented;
  bool? get isImplemented => _$this._isImplemented;
  set isImplemented(bool? isImplemented) =>
      _$this._isImplemented = isImplemented;

  bool? _isEnabled;
  bool? get isEnabled => _$this._isEnabled;
  set isEnabled(bool? isEnabled) => _$this._isEnabled = isEnabled;

  int? _workDaysMaximum;
  int? get workDaysMaximum => _$this._workDaysMaximum;
  set workDaysMaximum(int? workDaysMaximum) =>
      _$this._workDaysMaximum = workDaysMaximum;

  int? _workDaysMinimum;
  int? get workDaysMinimum => _$this._workDaysMinimum;
  set workDaysMinimum(int? workDaysMinimum) =>
      _$this._workDaysMinimum = workDaysMinimum;

  LogisticServiceGetDtoBuilder() {
    LogisticServiceGetDto._defaults(this);
  }

  LogisticServiceGetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _logisticServiceId = $v.logisticServiceId;
      _serviceName = $v.serviceName;
      _company = $v.company;
      _isImplemented = $v.isImplemented;
      _isEnabled = $v.isEnabled;
      _workDaysMaximum = $v.workDaysMaximum;
      _workDaysMinimum = $v.workDaysMinimum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogisticServiceGetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogisticServiceGetDto;
  }

  @override
  void update(void Function(LogisticServiceGetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogisticServiceGetDto build() => _build();

  _$LogisticServiceGetDto _build() {
    final _$result = _$v ??
        new _$LogisticServiceGetDto._(
            logisticServiceId: logisticServiceId,
            serviceName: serviceName,
            company: company,
            isImplemented: isImplemented,
            isEnabled: isEnabled,
            workDaysMaximum: workDaysMaximum,
            workDaysMinimum: workDaysMinimum);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
