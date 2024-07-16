// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup_dto_list_api_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LookupDtoListApiResponseModel extends LookupDtoListApiResponseModel {
  @override
  final bool? success;
  @override
  final BuiltList<LookupDto>? data;
  @override
  final String? errorMessage;
  @override
  final String? reqSecureKey;

  factory _$LookupDtoListApiResponseModel(
          [void Function(LookupDtoListApiResponseModelBuilder)? updates]) =>
      (new LookupDtoListApiResponseModelBuilder()..update(updates))._build();

  _$LookupDtoListApiResponseModel._(
      {this.success, this.data, this.errorMessage, this.reqSecureKey})
      : super._();

  @override
  LookupDtoListApiResponseModel rebuild(
          void Function(LookupDtoListApiResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LookupDtoListApiResponseModelBuilder toBuilder() =>
      new LookupDtoListApiResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LookupDtoListApiResponseModel &&
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
    return (newBuiltValueToStringHelper(r'LookupDtoListApiResponseModel')
          ..add('success', success)
          ..add('data', data)
          ..add('errorMessage', errorMessage)
          ..add('reqSecureKey', reqSecureKey))
        .toString();
  }
}

class LookupDtoListApiResponseModelBuilder
    implements
        Builder<LookupDtoListApiResponseModel,
            LookupDtoListApiResponseModelBuilder> {
  _$LookupDtoListApiResponseModel? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<LookupDto>? _data;
  ListBuilder<LookupDto> get data =>
      _$this._data ??= new ListBuilder<LookupDto>();
  set data(ListBuilder<LookupDto>? data) => _$this._data = data;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  String? _reqSecureKey;
  String? get reqSecureKey => _$this._reqSecureKey;
  set reqSecureKey(String? reqSecureKey) => _$this._reqSecureKey = reqSecureKey;

  LookupDtoListApiResponseModelBuilder() {
    LookupDtoListApiResponseModel._defaults(this);
  }

  LookupDtoListApiResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _data = $v.data?.toBuilder();
      _errorMessage = $v.errorMessage;
      _reqSecureKey = $v.reqSecureKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LookupDtoListApiResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LookupDtoListApiResponseModel;
  }

  @override
  void update(void Function(LookupDtoListApiResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LookupDtoListApiResponseModel build() => _build();

  _$LookupDtoListApiResponseModel _build() {
    _$LookupDtoListApiResponseModel _$result;
    try {
      _$result = _$v ??
          new _$LookupDtoListApiResponseModel._(
              success: success,
              data: _data?.build(),
              errorMessage: errorMessage,
              reqSecureKey: reqSecureKey);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LookupDtoListApiResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
