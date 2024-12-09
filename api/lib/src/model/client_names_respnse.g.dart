// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_names_respnse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientNamesRespnse extends ClientNamesRespnse {
  @override
  final int? clientId;
  @override
  final String? label;

  factory _$ClientNamesRespnse(
          [void Function(ClientNamesRespnseBuilder)? updates]) =>
      (new ClientNamesRespnseBuilder()..update(updates))._build();

  _$ClientNamesRespnse._({this.clientId, this.label}) : super._();

  @override
  ClientNamesRespnse rebuild(
          void Function(ClientNamesRespnseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientNamesRespnseBuilder toBuilder() =>
      new ClientNamesRespnseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientNamesRespnse &&
        clientId == other.clientId &&
        label == other.label;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientNamesRespnse')
          ..add('clientId', clientId)
          ..add('label', label))
        .toString();
  }
}

class ClientNamesRespnseBuilder
    implements Builder<ClientNamesRespnse, ClientNamesRespnseBuilder> {
  _$ClientNamesRespnse? _$v;

  int? _clientId;
  int? get clientId => _$this._clientId;
  set clientId(int? clientId) => _$this._clientId = clientId;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  ClientNamesRespnseBuilder() {
    ClientNamesRespnse._defaults(this);
  }

  ClientNamesRespnseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientId = $v.clientId;
      _label = $v.label;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientNamesRespnse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientNamesRespnse;
  }

  @override
  void update(void Function(ClientNamesRespnseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientNamesRespnse build() => _build();

  _$ClientNamesRespnse _build() {
    final _$result =
        _$v ?? new _$ClientNamesRespnse._(clientId: clientId, label: label);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
