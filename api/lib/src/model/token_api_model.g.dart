// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_api_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TokenApiModel extends TokenApiModel {
  @override
  final String? token;
  @override
  final String? refreshToken;

  factory _$TokenApiModel([void Function(TokenApiModelBuilder)? updates]) =>
      (new TokenApiModelBuilder()..update(updates))._build();

  _$TokenApiModel._({this.token, this.refreshToken}) : super._();

  @override
  TokenApiModel rebuild(void Function(TokenApiModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenApiModelBuilder toBuilder() => new TokenApiModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenApiModel &&
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
    return (newBuiltValueToStringHelper(r'TokenApiModel')
          ..add('token', token)
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class TokenApiModelBuilder
    implements Builder<TokenApiModel, TokenApiModelBuilder> {
  _$TokenApiModel? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  TokenApiModelBuilder() {
    TokenApiModel._defaults(this);
  }

  TokenApiModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TokenApiModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TokenApiModel;
  }

  @override
  void update(void Function(TokenApiModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TokenApiModel build() => _build();

  _$TokenApiModel _build() {
    final _$result =
        _$v ?? new _$TokenApiModel._(token: token, refreshToken: refreshToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
