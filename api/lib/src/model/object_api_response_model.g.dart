// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_api_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ObjectApiResponseModel extends ObjectApiResponseModel {
  @override
  final bool? success;
  @override
  final JsonObject? data;
  @override
  final String? errorMessage;
  @override
  final String? reqSecureKey;

  factory _$ObjectApiResponseModel(
          [void Function(ObjectApiResponseModelBuilder)? updates]) =>
      (new ObjectApiResponseModelBuilder()..update(updates))._build();

  _$ObjectApiResponseModel._(
      {this.success, this.data, this.errorMessage, this.reqSecureKey})
      : super._();

  @override
  ObjectApiResponseModel rebuild(
          void Function(ObjectApiResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ObjectApiResponseModelBuilder toBuilder() =>
      new ObjectApiResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObjectApiResponseModel &&
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
    return (newBuiltValueToStringHelper(r'ObjectApiResponseModel')
          ..add('success', success)
          ..add('data', data)
          ..add('errorMessage', errorMessage)
          ..add('reqSecureKey', reqSecureKey))
        .toString();
  }
}

class ObjectApiResponseModelBuilder
    implements Builder<ObjectApiResponseModel, ObjectApiResponseModelBuilder> {
  _$ObjectApiResponseModel? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  String? _reqSecureKey;
  String? get reqSecureKey => _$this._reqSecureKey;
  set reqSecureKey(String? reqSecureKey) => _$this._reqSecureKey = reqSecureKey;

  ObjectApiResponseModelBuilder() {
    ObjectApiResponseModel._defaults(this);
  }

  ObjectApiResponseModelBuilder get _$this {
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
  void replace(ObjectApiResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ObjectApiResponseModel;
  }

  @override
  void update(void Function(ObjectApiResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ObjectApiResponseModel build() => _build();

  _$ObjectApiResponseModel _build() {
    final _$result = _$v ??
        new _$ObjectApiResponseModel._(
            success: success,
            data: data,
            errorMessage: errorMessage,
            reqSecureKey: reqSecureKey);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
