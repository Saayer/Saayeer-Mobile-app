// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthenticateRequest extends AuthenticateRequest {
  @override
  final String mobileNumber;

  factory _$AuthenticateRequest(
          [void Function(AuthenticateRequestBuilder)? updates]) =>
      (new AuthenticateRequestBuilder()..update(updates))._build();

  _$AuthenticateRequest._({required this.mobileNumber}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        mobileNumber, r'AuthenticateRequest', 'mobileNumber');
  }

  @override
  AuthenticateRequest rebuild(
          void Function(AuthenticateRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticateRequestBuilder toBuilder() =>
      new AuthenticateRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticateRequest && mobileNumber == other.mobileNumber;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mobileNumber.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthenticateRequest')
          ..add('mobileNumber', mobileNumber))
        .toString();
  }
}

class AuthenticateRequestBuilder
    implements Builder<AuthenticateRequest, AuthenticateRequestBuilder> {
  _$AuthenticateRequest? _$v;

  String? _mobileNumber;
  String? get mobileNumber => _$this._mobileNumber;
  set mobileNumber(String? mobileNumber) => _$this._mobileNumber = mobileNumber;

  AuthenticateRequestBuilder() {
    AuthenticateRequest._defaults(this);
  }

  AuthenticateRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mobileNumber = $v.mobileNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthenticateRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthenticateRequest;
  }

  @override
  void update(void Function(AuthenticateRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthenticateRequest build() => _build();

  _$AuthenticateRequest _build() {
    final _$result = _$v ??
        new _$AuthenticateRequest._(
            mobileNumber: BuiltValueNullFieldError.checkNotNull(
                mobileNumber, r'AuthenticateRequest', 'mobileNumber'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
