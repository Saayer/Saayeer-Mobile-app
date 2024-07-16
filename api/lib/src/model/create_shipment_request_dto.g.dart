// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_shipment_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateShipmentRequestDto extends CreateShipmentRequestDto {
  @override
  final int? shipperId;
  @override
  final int? storeId;
  @override
  final int? senderCityId;
  @override
  final int? reciverCityId;
  @override
  final int? orderAmount;
  @override
  final String? reciverName;
  @override
  final String? reciverAddress;
  @override
  final int? reciverPhone;
  @override
  final String? senderName;
  @override
  final String? senderAddress;
  @override
  final int? senderPhone;
  @override
  final String? packageDescription;
  @override
  final PackageDetails? packageDetails;

  factory _$CreateShipmentRequestDto(
          [void Function(CreateShipmentRequestDtoBuilder)? updates]) =>
      (new CreateShipmentRequestDtoBuilder()..update(updates))._build();

  _$CreateShipmentRequestDto._(
      {this.shipperId,
      this.storeId,
      this.senderCityId,
      this.reciverCityId,
      this.orderAmount,
      this.reciverName,
      this.reciverAddress,
      this.reciverPhone,
      this.senderName,
      this.senderAddress,
      this.senderPhone,
      this.packageDescription,
      this.packageDetails})
      : super._();

  @override
  CreateShipmentRequestDto rebuild(
          void Function(CreateShipmentRequestDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateShipmentRequestDtoBuilder toBuilder() =>
      new CreateShipmentRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateShipmentRequestDto &&
        shipperId == other.shipperId &&
        storeId == other.storeId &&
        senderCityId == other.senderCityId &&
        reciverCityId == other.reciverCityId &&
        orderAmount == other.orderAmount &&
        reciverName == other.reciverName &&
        reciverAddress == other.reciverAddress &&
        reciverPhone == other.reciverPhone &&
        senderName == other.senderName &&
        senderAddress == other.senderAddress &&
        senderPhone == other.senderPhone &&
        packageDescription == other.packageDescription &&
        packageDetails == other.packageDetails;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, shipperId.hashCode);
    _$hash = $jc(_$hash, storeId.hashCode);
    _$hash = $jc(_$hash, senderCityId.hashCode);
    _$hash = $jc(_$hash, reciverCityId.hashCode);
    _$hash = $jc(_$hash, orderAmount.hashCode);
    _$hash = $jc(_$hash, reciverName.hashCode);
    _$hash = $jc(_$hash, reciverAddress.hashCode);
    _$hash = $jc(_$hash, reciverPhone.hashCode);
    _$hash = $jc(_$hash, senderName.hashCode);
    _$hash = $jc(_$hash, senderAddress.hashCode);
    _$hash = $jc(_$hash, senderPhone.hashCode);
    _$hash = $jc(_$hash, packageDescription.hashCode);
    _$hash = $jc(_$hash, packageDetails.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateShipmentRequestDto')
          ..add('shipperId', shipperId)
          ..add('storeId', storeId)
          ..add('senderCityId', senderCityId)
          ..add('reciverCityId', reciverCityId)
          ..add('orderAmount', orderAmount)
          ..add('reciverName', reciverName)
          ..add('reciverAddress', reciverAddress)
          ..add('reciverPhone', reciverPhone)
          ..add('senderName', senderName)
          ..add('senderAddress', senderAddress)
          ..add('senderPhone', senderPhone)
          ..add('packageDescription', packageDescription)
          ..add('packageDetails', packageDetails))
        .toString();
  }
}

class CreateShipmentRequestDtoBuilder
    implements
        Builder<CreateShipmentRequestDto, CreateShipmentRequestDtoBuilder> {
  _$CreateShipmentRequestDto? _$v;

  int? _shipperId;
  int? get shipperId => _$this._shipperId;
  set shipperId(int? shipperId) => _$this._shipperId = shipperId;

  int? _storeId;
  int? get storeId => _$this._storeId;
  set storeId(int? storeId) => _$this._storeId = storeId;

  int? _senderCityId;
  int? get senderCityId => _$this._senderCityId;
  set senderCityId(int? senderCityId) => _$this._senderCityId = senderCityId;

  int? _reciverCityId;
  int? get reciverCityId => _$this._reciverCityId;
  set reciverCityId(int? reciverCityId) =>
      _$this._reciverCityId = reciverCityId;

  int? _orderAmount;
  int? get orderAmount => _$this._orderAmount;
  set orderAmount(int? orderAmount) => _$this._orderAmount = orderAmount;

  String? _reciverName;
  String? get reciverName => _$this._reciverName;
  set reciverName(String? reciverName) => _$this._reciverName = reciverName;

  String? _reciverAddress;
  String? get reciverAddress => _$this._reciverAddress;
  set reciverAddress(String? reciverAddress) =>
      _$this._reciverAddress = reciverAddress;

  int? _reciverPhone;
  int? get reciverPhone => _$this._reciverPhone;
  set reciverPhone(int? reciverPhone) => _$this._reciverPhone = reciverPhone;

  String? _senderName;
  String? get senderName => _$this._senderName;
  set senderName(String? senderName) => _$this._senderName = senderName;

  String? _senderAddress;
  String? get senderAddress => _$this._senderAddress;
  set senderAddress(String? senderAddress) =>
      _$this._senderAddress = senderAddress;

  int? _senderPhone;
  int? get senderPhone => _$this._senderPhone;
  set senderPhone(int? senderPhone) => _$this._senderPhone = senderPhone;

  String? _packageDescription;
  String? get packageDescription => _$this._packageDescription;
  set packageDescription(String? packageDescription) =>
      _$this._packageDescription = packageDescription;

  PackageDetailsBuilder? _packageDetails;
  PackageDetailsBuilder get packageDetails =>
      _$this._packageDetails ??= new PackageDetailsBuilder();
  set packageDetails(PackageDetailsBuilder? packageDetails) =>
      _$this._packageDetails = packageDetails;

  CreateShipmentRequestDtoBuilder() {
    CreateShipmentRequestDto._defaults(this);
  }

  CreateShipmentRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _shipperId = $v.shipperId;
      _storeId = $v.storeId;
      _senderCityId = $v.senderCityId;
      _reciverCityId = $v.reciverCityId;
      _orderAmount = $v.orderAmount;
      _reciverName = $v.reciverName;
      _reciverAddress = $v.reciverAddress;
      _reciverPhone = $v.reciverPhone;
      _senderName = $v.senderName;
      _senderAddress = $v.senderAddress;
      _senderPhone = $v.senderPhone;
      _packageDescription = $v.packageDescription;
      _packageDetails = $v.packageDetails?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateShipmentRequestDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateShipmentRequestDto;
  }

  @override
  void update(void Function(CreateShipmentRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateShipmentRequestDto build() => _build();

  _$CreateShipmentRequestDto _build() {
    _$CreateShipmentRequestDto _$result;
    try {
      _$result = _$v ??
          new _$CreateShipmentRequestDto._(
              shipperId: shipperId,
              storeId: storeId,
              senderCityId: senderCityId,
              reciverCityId: reciverCityId,
              orderAmount: orderAmount,
              reciverName: reciverName,
              reciverAddress: reciverAddress,
              reciverPhone: reciverPhone,
              senderName: senderName,
              senderAddress: senderAddress,
              senderPhone: senderPhone,
              packageDescription: packageDescription,
              packageDetails: _packageDetails?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'packageDetails';
        _packageDetails?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateShipmentRequestDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
