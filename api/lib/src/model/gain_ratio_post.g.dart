// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gain_ratio_post.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GainRatioPost extends GainRatioPost {
  @override
  final double? newGainRatio;

  factory _$GainRatioPost([void Function(GainRatioPostBuilder)? updates]) =>
      (new GainRatioPostBuilder()..update(updates))._build();

  _$GainRatioPost._({this.newGainRatio}) : super._();

  @override
  GainRatioPost rebuild(void Function(GainRatioPostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GainRatioPostBuilder toBuilder() => new GainRatioPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GainRatioPost && newGainRatio == other.newGainRatio;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, newGainRatio.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GainRatioPost')
          ..add('newGainRatio', newGainRatio))
        .toString();
  }
}

class GainRatioPostBuilder
    implements Builder<GainRatioPost, GainRatioPostBuilder> {
  _$GainRatioPost? _$v;

  double? _newGainRatio;
  double? get newGainRatio => _$this._newGainRatio;
  set newGainRatio(double? newGainRatio) => _$this._newGainRatio = newGainRatio;

  GainRatioPostBuilder() {
    GainRatioPost._defaults(this);
  }

  GainRatioPostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newGainRatio = $v.newGainRatio;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GainRatioPost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GainRatioPost;
  }

  @override
  void update(void Function(GainRatioPostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GainRatioPost build() => _build();

  _$GainRatioPost _build() {
    final _$result = _$v ?? new _$GainRatioPost._(newGainRatio: newGainRatio);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
