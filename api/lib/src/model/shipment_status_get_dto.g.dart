// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_status_get_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentStatusGetDto extends ShipmentStatusGetDto {
  @override
  final ShipmentStatusEnum? status;
  @override
  final String? description;
  @override
  final DateTime? createdAt;

  factory _$ShipmentStatusGetDto(
          [void Function(ShipmentStatusGetDtoBuilder)? updates]) =>
      (new ShipmentStatusGetDtoBuilder()..update(updates))._build();

  _$ShipmentStatusGetDto._({this.status, this.description, this.createdAt})
      : super._();

  @override
  ShipmentStatusGetDto rebuild(
          void Function(ShipmentStatusGetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentStatusGetDtoBuilder toBuilder() =>
      new ShipmentStatusGetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentStatusGetDto &&
        status == other.status &&
        description == other.description &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentStatusGetDto')
          ..add('status', status)
          ..add('description', description)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class ShipmentStatusGetDtoBuilder
    implements Builder<ShipmentStatusGetDto, ShipmentStatusGetDtoBuilder> {
  _$ShipmentStatusGetDto? _$v;

  ShipmentStatusEnum? _status;
  ShipmentStatusEnum? get status => _$this._status;
  set status(ShipmentStatusEnum? status) => _$this._status = status;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ShipmentStatusGetDtoBuilder() {
    ShipmentStatusGetDto._defaults(this);
  }

  ShipmentStatusGetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _description = $v.description;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentStatusGetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentStatusGetDto;
  }

  @override
  void update(void Function(ShipmentStatusGetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentStatusGetDto build() => _build();

  _$ShipmentStatusGetDto _build() {
    final _$result = _$v ??
        new _$ShipmentStatusGetDto._(
            status: status, description: description, createdAt: createdAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
