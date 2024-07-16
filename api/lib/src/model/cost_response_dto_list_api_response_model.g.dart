// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_response_dto_list_api_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CostResponseDtoListApiResponseModel
    extends CostResponseDtoListApiResponseModel {
  @override
  final bool? success;
  @override
  final BuiltList<CostResponseDto>? data;
  @override
  final String? errorMessage;
  @override
  final String? reqSecureKey;

  factory _$CostResponseDtoListApiResponseModel(
          [void Function(CostResponseDtoListApiResponseModelBuilder)?
              updates]) =>
      (new CostResponseDtoListApiResponseModelBuilder()..update(updates))
          ._build();

  _$CostResponseDtoListApiResponseModel._(
      {this.success, this.data, this.errorMessage, this.reqSecureKey})
      : super._();

  @override
  CostResponseDtoListApiResponseModel rebuild(
          void Function(CostResponseDtoListApiResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CostResponseDtoListApiResponseModelBuilder toBuilder() =>
      new CostResponseDtoListApiResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CostResponseDtoListApiResponseModel &&
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
    return (newBuiltValueToStringHelper(r'CostResponseDtoListApiResponseModel')
          ..add('success', success)
          ..add('data', data)
          ..add('errorMessage', errorMessage)
          ..add('reqSecureKey', reqSecureKey))
        .toString();
  }
}

class CostResponseDtoListApiResponseModelBuilder
    implements
        Builder<CostResponseDtoListApiResponseModel,
            CostResponseDtoListApiResponseModelBuilder> {
  _$CostResponseDtoListApiResponseModel? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<CostResponseDto>? _data;
  ListBuilder<CostResponseDto> get data =>
      _$this._data ??= new ListBuilder<CostResponseDto>();
  set data(ListBuilder<CostResponseDto>? data) => _$this._data = data;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  String? _reqSecureKey;
  String? get reqSecureKey => _$this._reqSecureKey;
  set reqSecureKey(String? reqSecureKey) => _$this._reqSecureKey = reqSecureKey;

  CostResponseDtoListApiResponseModelBuilder() {
    CostResponseDtoListApiResponseModel._defaults(this);
  }

  CostResponseDtoListApiResponseModelBuilder get _$this {
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
  void replace(CostResponseDtoListApiResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CostResponseDtoListApiResponseModel;
  }

  @override
  void update(
      void Function(CostResponseDtoListApiResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CostResponseDtoListApiResponseModel build() => _build();

  _$CostResponseDtoListApiResponseModel _build() {
    _$CostResponseDtoListApiResponseModel _$result;
    try {
      _$result = _$v ??
          new _$CostResponseDtoListApiResponseModel._(
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
            r'CostResponseDtoListApiResponseModel',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
