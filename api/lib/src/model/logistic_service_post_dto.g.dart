// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistic_service_post_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogisticServicePostDto extends LogisticServicePostDto {
  @override
  final int? logisticServiceId;
  @override
  final bool? isEnabled;

  factory _$LogisticServicePostDto(
          [void Function(LogisticServicePostDtoBuilder)? updates]) =>
      (new LogisticServicePostDtoBuilder()..update(updates))._build();

  _$LogisticServicePostDto._({this.logisticServiceId, this.isEnabled})
      : super._();

  @override
  LogisticServicePostDto rebuild(
          void Function(LogisticServicePostDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogisticServicePostDtoBuilder toBuilder() =>
      new LogisticServicePostDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogisticServicePostDto &&
        logisticServiceId == other.logisticServiceId &&
        isEnabled == other.isEnabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, logisticServiceId.hashCode);
    _$hash = $jc(_$hash, isEnabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogisticServicePostDto')
          ..add('logisticServiceId', logisticServiceId)
          ..add('isEnabled', isEnabled))
        .toString();
  }
}

class LogisticServicePostDtoBuilder
    implements Builder<LogisticServicePostDto, LogisticServicePostDtoBuilder> {
  _$LogisticServicePostDto? _$v;

  int? _logisticServiceId;
  int? get logisticServiceId => _$this._logisticServiceId;
  set logisticServiceId(int? logisticServiceId) =>
      _$this._logisticServiceId = logisticServiceId;

  bool? _isEnabled;
  bool? get isEnabled => _$this._isEnabled;
  set isEnabled(bool? isEnabled) => _$this._isEnabled = isEnabled;

  LogisticServicePostDtoBuilder() {
    LogisticServicePostDto._defaults(this);
  }

  LogisticServicePostDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _logisticServiceId = $v.logisticServiceId;
      _isEnabled = $v.isEnabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogisticServicePostDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogisticServicePostDto;
  }

  @override
  void update(void Function(LogisticServicePostDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogisticServicePostDto build() => _build();

  _$LogisticServicePostDto _build() {
    final _$result = _$v ??
        new _$LogisticServicePostDto._(
            logisticServiceId: logisticServiceId, isEnabled: isEnabled);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
