// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_information_response_vm_list_api_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientsInformationResponseVMListApiResponseModel
    extends ClientsInformationResponseVMListApiResponseModel {
  @override
  final bool? success;
  @override
  final BuiltList<ClientsInformationResponseVM>? data;
  @override
  final String? errorMessage;
  @override
  final String? reqSecureKey;

  factory _$ClientsInformationResponseVMListApiResponseModel(
          [void Function(
                  ClientsInformationResponseVMListApiResponseModelBuilder)?
              updates]) =>
      (new ClientsInformationResponseVMListApiResponseModelBuilder()
            ..update(updates))
          ._build();

  _$ClientsInformationResponseVMListApiResponseModel._(
      {this.success, this.data, this.errorMessage, this.reqSecureKey})
      : super._();

  @override
  ClientsInformationResponseVMListApiResponseModel rebuild(
          void Function(ClientsInformationResponseVMListApiResponseModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientsInformationResponseVMListApiResponseModelBuilder toBuilder() =>
      new ClientsInformationResponseVMListApiResponseModelBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientsInformationResponseVMListApiResponseModel &&
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
    return (newBuiltValueToStringHelper(
            r'ClientsInformationResponseVMListApiResponseModel')
          ..add('success', success)
          ..add('data', data)
          ..add('errorMessage', errorMessage)
          ..add('reqSecureKey', reqSecureKey))
        .toString();
  }
}

class ClientsInformationResponseVMListApiResponseModelBuilder
    implements
        Builder<ClientsInformationResponseVMListApiResponseModel,
            ClientsInformationResponseVMListApiResponseModelBuilder> {
  _$ClientsInformationResponseVMListApiResponseModel? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<ClientsInformationResponseVM>? _data;
  ListBuilder<ClientsInformationResponseVM> get data =>
      _$this._data ??= new ListBuilder<ClientsInformationResponseVM>();
  set data(ListBuilder<ClientsInformationResponseVM>? data) =>
      _$this._data = data;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  String? _reqSecureKey;
  String? get reqSecureKey => _$this._reqSecureKey;
  set reqSecureKey(String? reqSecureKey) => _$this._reqSecureKey = reqSecureKey;

  ClientsInformationResponseVMListApiResponseModelBuilder() {
    ClientsInformationResponseVMListApiResponseModel._defaults(this);
  }

  ClientsInformationResponseVMListApiResponseModelBuilder get _$this {
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
  void replace(ClientsInformationResponseVMListApiResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientsInformationResponseVMListApiResponseModel;
  }

  @override
  void update(
      void Function(ClientsInformationResponseVMListApiResponseModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientsInformationResponseVMListApiResponseModel build() => _build();

  _$ClientsInformationResponseVMListApiResponseModel _build() {
    _$ClientsInformationResponseVMListApiResponseModel _$result;
    try {
      _$result = _$v ??
          new _$ClientsInformationResponseVMListApiResponseModel._(
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
            r'ClientsInformationResponseVMListApiResponseModel',
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
