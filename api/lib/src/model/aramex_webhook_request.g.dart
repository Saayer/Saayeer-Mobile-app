// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aramex_webhook_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AramexWebhookRequest extends AramexWebhookRequest {
  @override
  final String? key;
  @override
  final AramexWebhookValue? value;

  factory _$AramexWebhookRequest(
          [void Function(AramexWebhookRequestBuilder)? updates]) =>
      (new AramexWebhookRequestBuilder()..update(updates))._build();

  _$AramexWebhookRequest._({this.key, this.value}) : super._();

  @override
  AramexWebhookRequest rebuild(
          void Function(AramexWebhookRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AramexWebhookRequestBuilder toBuilder() =>
      new AramexWebhookRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AramexWebhookRequest &&
        key == other.key &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AramexWebhookRequest')
          ..add('key', key)
          ..add('value', value))
        .toString();
  }
}

class AramexWebhookRequestBuilder
    implements Builder<AramexWebhookRequest, AramexWebhookRequestBuilder> {
  _$AramexWebhookRequest? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  AramexWebhookValueBuilder? _value;
  AramexWebhookValueBuilder get value =>
      _$this._value ??= new AramexWebhookValueBuilder();
  set value(AramexWebhookValueBuilder? value) => _$this._value = value;

  AramexWebhookRequestBuilder() {
    AramexWebhookRequest._defaults(this);
  }

  AramexWebhookRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _value = $v.value?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AramexWebhookRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AramexWebhookRequest;
  }

  @override
  void update(void Function(AramexWebhookRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AramexWebhookRequest build() => _build();

  _$AramexWebhookRequest _build() {
    _$AramexWebhookRequest _$result;
    try {
      _$result =
          _$v ?? new _$AramexWebhookRequest._(key: key, value: _value?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        _value?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AramexWebhookRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
