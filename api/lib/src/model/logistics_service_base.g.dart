// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistics_service_base.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogisticsServiceBase extends LogisticsServiceBase {
  @override
  final String? name;
  @override
  final String? company;
  @override
  final int? workDaysMinimum;
  @override
  final int? workDaysMaximum;

  factory _$LogisticsServiceBase(
          [void Function(LogisticsServiceBaseBuilder)? updates]) =>
      (new LogisticsServiceBaseBuilder()..update(updates))._build();

  _$LogisticsServiceBase._(
      {this.name, this.company, this.workDaysMinimum, this.workDaysMaximum})
      : super._();

  @override
  LogisticsServiceBase rebuild(
          void Function(LogisticsServiceBaseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogisticsServiceBaseBuilder toBuilder() =>
      new LogisticsServiceBaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogisticsServiceBase &&
        name == other.name &&
        company == other.company &&
        workDaysMinimum == other.workDaysMinimum &&
        workDaysMaximum == other.workDaysMaximum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, company.hashCode);
    _$hash = $jc(_$hash, workDaysMinimum.hashCode);
    _$hash = $jc(_$hash, workDaysMaximum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogisticsServiceBase')
          ..add('name', name)
          ..add('company', company)
          ..add('workDaysMinimum', workDaysMinimum)
          ..add('workDaysMaximum', workDaysMaximum))
        .toString();
  }
}

class LogisticsServiceBaseBuilder
    implements Builder<LogisticsServiceBase, LogisticsServiceBaseBuilder> {
  _$LogisticsServiceBase? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  int? _workDaysMinimum;
  int? get workDaysMinimum => _$this._workDaysMinimum;
  set workDaysMinimum(int? workDaysMinimum) =>
      _$this._workDaysMinimum = workDaysMinimum;

  int? _workDaysMaximum;
  int? get workDaysMaximum => _$this._workDaysMaximum;
  set workDaysMaximum(int? workDaysMaximum) =>
      _$this._workDaysMaximum = workDaysMaximum;

  LogisticsServiceBaseBuilder() {
    LogisticsServiceBase._defaults(this);
  }

  LogisticsServiceBaseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _company = $v.company;
      _workDaysMinimum = $v.workDaysMinimum;
      _workDaysMaximum = $v.workDaysMaximum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogisticsServiceBase other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogisticsServiceBase;
  }

  @override
  void update(void Function(LogisticsServiceBaseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogisticsServiceBase build() => _build();

  _$LogisticsServiceBase _build() {
    final _$result = _$v ??
        new _$LogisticsServiceBase._(
            name: name,
            company: company,
            workDaysMinimum: workDaysMinimum,
            workDaysMaximum: workDaysMaximum);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
