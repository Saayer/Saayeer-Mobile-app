// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_api_response_public_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppSettingsApiResponsePublicModel
    extends AppSettingsApiResponsePublicModel {
  @override
  final bool? success;
  @override
  final AppSettings? data;
  @override
  final String? errorMessage;

  factory _$AppSettingsApiResponsePublicModel(
          [void Function(AppSettingsApiResponsePublicModelBuilder)? updates]) =>
      (new AppSettingsApiResponsePublicModelBuilder()..update(updates))
          ._build();

  _$AppSettingsApiResponsePublicModel._(
      {this.success, this.data, this.errorMessage})
      : super._();

  @override
  AppSettingsApiResponsePublicModel rebuild(
          void Function(AppSettingsApiResponsePublicModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppSettingsApiResponsePublicModelBuilder toBuilder() =>
      new AppSettingsApiResponsePublicModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppSettingsApiResponsePublicModel &&
        success == other.success &&
        data == other.data &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppSettingsApiResponsePublicModel')
          ..add('success', success)
          ..add('data', data)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class AppSettingsApiResponsePublicModelBuilder
    implements
        Builder<AppSettingsApiResponsePublicModel,
            AppSettingsApiResponsePublicModelBuilder> {
  _$AppSettingsApiResponsePublicModel? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  AppSettingsBuilder? _data;
  AppSettingsBuilder get data => _$this._data ??= new AppSettingsBuilder();
  set data(AppSettingsBuilder? data) => _$this._data = data;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  AppSettingsApiResponsePublicModelBuilder() {
    AppSettingsApiResponsePublicModel._defaults(this);
  }

  AppSettingsApiResponsePublicModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _data = $v.data?.toBuilder();
      _errorMessage = $v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppSettingsApiResponsePublicModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppSettingsApiResponsePublicModel;
  }

  @override
  void update(
      void Function(AppSettingsApiResponsePublicModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppSettingsApiResponsePublicModel build() => _build();

  _$AppSettingsApiResponsePublicModel _build() {
    _$AppSettingsApiResponsePublicModel _$result;
    try {
      _$result = _$v ??
          new _$AppSettingsApiResponsePublicModel._(
              success: success,
              data: _data?.build(),
              errorMessage: errorMessage);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppSettingsApiResponsePublicModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
