// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boolean_api_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BooleanApiResponseModel extends BooleanApiResponseModel {
  @override
  final bool? success;
  @override
  final bool? data;
  @override
  final String? errorMessage;
  @override
  final String? reqSecureKey;

  factory _$BooleanApiResponseModel(
          [void Function(BooleanApiResponseModelBuilder)? updates]) =>
      (new BooleanApiResponseModelBuilder()..update(updates))._build();

  _$BooleanApiResponseModel._(
      {this.success, this.data, this.errorMessage, this.reqSecureKey})
      : super._();

  @override
  BooleanApiResponseModel rebuild(
          void Function(BooleanApiResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BooleanApiResponseModelBuilder toBuilder() =>
      new BooleanApiResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BooleanApiResponseModel &&
        success == other.success &&
        data == other.data &&
        errorMessage == other.errorMessage &&
        reqSecureKey == other.reqSecureKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, reqSecureKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BooleanApiResponseModel')
          ..add('success', success)
          ..add('data', data)
          ..add('errorMessage', errorMessage)
          ..add('reqSecureKey', reqSecureKey))
        .toString();
  }
}

class BooleanApiResponseModelBuilder
    implements
        Builder<BooleanApiResponseModel, BooleanApiResponseModelBuilder> {
  _$BooleanApiResponseModel? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _data;
  bool? get data => _$this._data;
  set data(bool? data) => _$this._data = data;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  String? _reqSecureKey;
  String? get reqSecureKey => _$this._reqSecureKey;
  set reqSecureKey(String? reqSecureKey) => _$this._reqSecureKey = reqSecureKey;

  BooleanApiResponseModelBuilder() {
    BooleanApiResponseModel._defaults(this);
  }

  BooleanApiResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _data = $v.data;
      _errorMessage = $v.errorMessage;
      _reqSecureKey = $v.reqSecureKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BooleanApiResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BooleanApiResponseModel;
  }

  @override
  void update(void Function(BooleanApiResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BooleanApiResponseModel build() => _build();

  _$BooleanApiResponseModel _build() {
    final _$result = _$v ??
        new _$BooleanApiResponseModel._(
            success: success,
            data: data,
            errorMessage: errorMessage,
            reqSecureKey: reqSecureKey);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
