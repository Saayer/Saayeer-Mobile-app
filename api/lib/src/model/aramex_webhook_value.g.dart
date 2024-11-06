// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aramex_webhook_value.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AramexWebhookValue extends AramexWebhookValue {
  @override
  final String? waybillNumber;
  @override
  final String? updateCode;
  @override
  final String? updateDateTime;
  @override
  final String? updateLocation;
  @override
  final String? comments;
  @override
  final String? problemCode;
  @override
  final String? orderNumber;

  factory _$AramexWebhookValue(
          [void Function(AramexWebhookValueBuilder)? updates]) =>
      (new AramexWebhookValueBuilder()..update(updates))._build();

  _$AramexWebhookValue._(
      {this.waybillNumber,
      this.updateCode,
      this.updateDateTime,
      this.updateLocation,
      this.comments,
      this.problemCode,
      this.orderNumber})
      : super._();

  @override
  AramexWebhookValue rebuild(
          void Function(AramexWebhookValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AramexWebhookValueBuilder toBuilder() =>
      new AramexWebhookValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AramexWebhookValue &&
        waybillNumber == other.waybillNumber &&
        updateCode == other.updateCode &&
        updateDateTime == other.updateDateTime &&
        updateLocation == other.updateLocation &&
        comments == other.comments &&
        problemCode == other.problemCode &&
        orderNumber == other.orderNumber;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, waybillNumber.hashCode);
    _$hash = $jc(_$hash, updateCode.hashCode);
    _$hash = $jc(_$hash, updateDateTime.hashCode);
    _$hash = $jc(_$hash, updateLocation.hashCode);
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jc(_$hash, problemCode.hashCode);
    _$hash = $jc(_$hash, orderNumber.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AramexWebhookValue')
          ..add('waybillNumber', waybillNumber)
          ..add('updateCode', updateCode)
          ..add('updateDateTime', updateDateTime)
          ..add('updateLocation', updateLocation)
          ..add('comments', comments)
          ..add('problemCode', problemCode)
          ..add('orderNumber', orderNumber))
        .toString();
  }
}

class AramexWebhookValueBuilder
    implements Builder<AramexWebhookValue, AramexWebhookValueBuilder> {
  _$AramexWebhookValue? _$v;

  String? _waybillNumber;
  String? get waybillNumber => _$this._waybillNumber;
  set waybillNumber(String? waybillNumber) =>
      _$this._waybillNumber = waybillNumber;

  String? _updateCode;
  String? get updateCode => _$this._updateCode;
  set updateCode(String? updateCode) => _$this._updateCode = updateCode;

  String? _updateDateTime;
  String? get updateDateTime => _$this._updateDateTime;
  set updateDateTime(String? updateDateTime) =>
      _$this._updateDateTime = updateDateTime;

  String? _updateLocation;
  String? get updateLocation => _$this._updateLocation;
  set updateLocation(String? updateLocation) =>
      _$this._updateLocation = updateLocation;

  String? _comments;
  String? get comments => _$this._comments;
  set comments(String? comments) => _$this._comments = comments;

  String? _problemCode;
  String? get problemCode => _$this._problemCode;
  set problemCode(String? problemCode) => _$this._problemCode = problemCode;

  String? _orderNumber;
  String? get orderNumber => _$this._orderNumber;
  set orderNumber(String? orderNumber) => _$this._orderNumber = orderNumber;

  AramexWebhookValueBuilder() {
    AramexWebhookValue._defaults(this);
  }

  AramexWebhookValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _waybillNumber = $v.waybillNumber;
      _updateCode = $v.updateCode;
      _updateDateTime = $v.updateDateTime;
      _updateLocation = $v.updateLocation;
      _comments = $v.comments;
      _problemCode = $v.problemCode;
      _orderNumber = $v.orderNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AramexWebhookValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AramexWebhookValue;
  }

  @override
  void update(void Function(AramexWebhookValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AramexWebhookValue build() => _build();

  _$AramexWebhookValue _build() {
    final _$result = _$v ??
        new _$AramexWebhookValue._(
            waybillNumber: waybillNumber,
            updateCode: updateCode,
            updateDateTime: updateDateTime,
            updateLocation: updateLocation,
            comments: comments,
            problemCode: problemCode,
            orderNumber: orderNumber);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
