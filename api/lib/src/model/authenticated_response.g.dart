// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthenticatedResponse extends AuthenticatedResponse {
  @override
  final String? token;
  @override
  final String? refreshToken;

  factory _$AuthenticatedResponse(
          [void Function(AuthenticatedResponseBuilder)? updates]) =>
      (new AuthenticatedResponseBuilder()..update(updates))._build();

  _$AuthenticatedResponse._({this.token, this.refreshToken}) : super._();

  @override
  AuthenticatedResponse rebuild(
          void Function(AuthenticatedResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticatedResponseBuilder toBuilder() =>
      new AuthenticatedResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticatedResponse &&
        token == other.token &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthenticatedResponse')
          ..add('token', token)
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class AuthenticatedResponseBuilder
    implements Builder<AuthenticatedResponse, AuthenticatedResponseBuilder> {
  _$AuthenticatedResponse? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  AuthenticatedResponseBuilder() {
    AuthenticatedResponse._defaults(this);
  }

  AuthenticatedResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthenticatedResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthenticatedResponse;
  }

  @override
  void update(void Function(AuthenticatedResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthenticatedResponse build() => _build();

  _$AuthenticatedResponse _build() {
    final _$result = _$v ??
        new _$AuthenticatedResponse._(token: token, refreshToken: refreshToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
