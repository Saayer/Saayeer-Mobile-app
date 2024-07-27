// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppSettings extends AppSettings {
  @override
  final String? androidVersion;
  @override
  final String? iosVersion;

  factory _$AppSettings([void Function(AppSettingsBuilder)? updates]) =>
      (new AppSettingsBuilder()..update(updates))._build();

  _$AppSettings._({this.androidVersion, this.iosVersion}) : super._();

  @override
  AppSettings rebuild(void Function(AppSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppSettingsBuilder toBuilder() => new AppSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppSettings &&
        androidVersion == other.androidVersion &&
        iosVersion == other.iosVersion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, androidVersion.hashCode);
    _$hash = $jc(_$hash, iosVersion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppSettings')
          ..add('androidVersion', androidVersion)
          ..add('iosVersion', iosVersion))
        .toString();
  }
}

class AppSettingsBuilder implements Builder<AppSettings, AppSettingsBuilder> {
  _$AppSettings? _$v;

  String? _androidVersion;
  String? get androidVersion => _$this._androidVersion;
  set androidVersion(String? androidVersion) =>
      _$this._androidVersion = androidVersion;

  String? _iosVersion;
  String? get iosVersion => _$this._iosVersion;
  set iosVersion(String? iosVersion) => _$this._iosVersion = iosVersion;

  AppSettingsBuilder() {
    AppSettings._defaults(this);
  }

  AppSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _androidVersion = $v.androidVersion;
      _iosVersion = $v.iosVersion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppSettings;
  }

  @override
  void update(void Function(AppSettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppSettings build() => _build();

  _$AppSettings _build() {
    final _$result = _$v ??
        new _$AppSettings._(
            androidVersion: androidVersion, iosVersion: iosVersion);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
