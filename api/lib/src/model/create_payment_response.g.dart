// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreatePaymentResponse extends CreatePaymentResponse {
  @override
  final bool? hasError;
  @override
  final BuiltList<ErrorMessage>? errorMessages;

  factory _$CreatePaymentResponse(
          [void Function(CreatePaymentResponseBuilder)? updates]) =>
      (new CreatePaymentResponseBuilder()..update(updates))._build();

  _$CreatePaymentResponse._({this.hasError, this.errorMessages}) : super._();

  @override
  CreatePaymentResponse rebuild(
          void Function(CreatePaymentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePaymentResponseBuilder toBuilder() =>
      new CreatePaymentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePaymentResponse &&
        hasError == other.hasError &&
        errorMessages == other.errorMessages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, hasError.hashCode);
    _$hash = $jc(_$hash, errorMessages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatePaymentResponse')
          ..add('hasError', hasError)
          ..add('errorMessages', errorMessages))
        .toString();
  }
}

class CreatePaymentResponseBuilder
    implements Builder<CreatePaymentResponse, CreatePaymentResponseBuilder> {
  _$CreatePaymentResponse? _$v;

  bool? _hasError;
  bool? get hasError => _$this._hasError;
  set hasError(bool? hasError) => _$this._hasError = hasError;

  ListBuilder<ErrorMessage>? _errorMessages;
  ListBuilder<ErrorMessage> get errorMessages =>
      _$this._errorMessages ??= new ListBuilder<ErrorMessage>();
  set errorMessages(ListBuilder<ErrorMessage>? errorMessages) =>
      _$this._errorMessages = errorMessages;

  CreatePaymentResponseBuilder() {
    CreatePaymentResponse._defaults(this);
  }

  CreatePaymentResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hasError = $v.hasError;
      _errorMessages = $v.errorMessages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePaymentResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatePaymentResponse;
  }

  @override
  void update(void Function(CreatePaymentResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatePaymentResponse build() => _build();

  _$CreatePaymentResponse _build() {
    _$CreatePaymentResponse _$result;
    try {
      _$result = _$v ??
          new _$CreatePaymentResponse._(
              hasError: hasError, errorMessages: _errorMessages?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errorMessages';
        _errorMessages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreatePaymentResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
