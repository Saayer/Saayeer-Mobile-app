// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_get_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CustomerGetDto extends CustomerGetDto {
  @override
  final int? id;
  @override
  final String? fullName;
  @override
  final AddressGetDto? address;

  factory _$CustomerGetDto([void Function(CustomerGetDtoBuilder)? updates]) =>
      (new CustomerGetDtoBuilder()..update(updates))._build();

  _$CustomerGetDto._({this.id, this.fullName, this.address}) : super._();

  @override
  CustomerGetDto rebuild(void Function(CustomerGetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerGetDtoBuilder toBuilder() =>
      new CustomerGetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerGetDto &&
        id == other.id &&
        fullName == other.fullName &&
        address == other.address;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CustomerGetDto')
          ..add('id', id)
          ..add('fullName', fullName)
          ..add('address', address))
        .toString();
  }
}

class CustomerGetDtoBuilder
    implements Builder<CustomerGetDto, CustomerGetDtoBuilder> {
  _$CustomerGetDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  AddressGetDtoBuilder? _address;
  AddressGetDtoBuilder get address =>
      _$this._address ??= new AddressGetDtoBuilder();
  set address(AddressGetDtoBuilder? address) => _$this._address = address;

  CustomerGetDtoBuilder() {
    CustomerGetDto._defaults(this);
  }

  CustomerGetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _fullName = $v.fullName;
      _address = $v.address?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomerGetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomerGetDto;
  }

  @override
  void update(void Function(CustomerGetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CustomerGetDto build() => _build();

  _$CustomerGetDto _build() {
    _$CustomerGetDto _$result;
    try {
      _$result = _$v ??
          new _$CustomerGetDto._(
              id: id, fullName: fullName, address: _address?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CustomerGetDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
