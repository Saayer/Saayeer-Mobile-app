// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_add_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CustomerAddDto extends CustomerAddDto {
  @override
  final int? id;
  @override
  final String? fullName;
  @override
  final AddressAddDto? address;

  factory _$CustomerAddDto([void Function(CustomerAddDtoBuilder)? updates]) =>
      (new CustomerAddDtoBuilder()..update(updates))._build();

  _$CustomerAddDto._({this.id, this.fullName, this.address}) : super._();

  @override
  CustomerAddDto rebuild(void Function(CustomerAddDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerAddDtoBuilder toBuilder() =>
      new CustomerAddDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerAddDto &&
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
    return (newBuiltValueToStringHelper(r'CustomerAddDto')
          ..add('id', id)
          ..add('fullName', fullName)
          ..add('address', address))
        .toString();
  }
}

class CustomerAddDtoBuilder
    implements Builder<CustomerAddDto, CustomerAddDtoBuilder> {
  _$CustomerAddDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  AddressAddDtoBuilder? _address;
  AddressAddDtoBuilder get address =>
      _$this._address ??= new AddressAddDtoBuilder();
  set address(AddressAddDtoBuilder? address) => _$this._address = address;

  CustomerAddDtoBuilder() {
    CustomerAddDto._defaults(this);
  }

  CustomerAddDtoBuilder get _$this {
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
  void replace(CustomerAddDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomerAddDto;
  }

  @override
  void update(void Function(CustomerAddDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CustomerAddDto build() => _build();

  _$CustomerAddDto _build() {
    _$CustomerAddDto _$result;
    try {
      _$result = _$v ??
          new _$CustomerAddDto._(
              id: id, fullName: fullName, address: _address?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CustomerAddDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
