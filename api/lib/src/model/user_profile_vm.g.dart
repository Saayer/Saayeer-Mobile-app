// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserProfileVM extends UserProfileVM {
  @override
  final String? name;
  @override
  final String? status;
  @override
  final int? totalShipments;
  @override
  final double? balance;
  @override
  final int? totalBills;
  @override
  final int? totalStoreRequests;
  @override
  final BuiltList<ShipmentVM>? newShipmenst;

  factory _$UserProfileVM([void Function(UserProfileVMBuilder)? updates]) =>
      (new UserProfileVMBuilder()..update(updates))._build();

  _$UserProfileVM._(
      {this.name,
      this.status,
      this.totalShipments,
      this.balance,
      this.totalBills,
      this.totalStoreRequests,
      this.newShipmenst})
      : super._();

  @override
  UserProfileVM rebuild(void Function(UserProfileVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileVMBuilder toBuilder() => new UserProfileVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfileVM &&
        name == other.name &&
        status == other.status &&
        totalShipments == other.totalShipments &&
        balance == other.balance &&
        totalBills == other.totalBills &&
        totalStoreRequests == other.totalStoreRequests &&
        newShipmenst == other.newShipmenst;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, totalShipments.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jc(_$hash, totalBills.hashCode);
    _$hash = $jc(_$hash, totalStoreRequests.hashCode);
    _$hash = $jc(_$hash, newShipmenst.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserProfileVM')
          ..add('name', name)
          ..add('status', status)
          ..add('totalShipments', totalShipments)
          ..add('balance', balance)
          ..add('totalBills', totalBills)
          ..add('totalStoreRequests', totalStoreRequests)
          ..add('newShipmenst', newShipmenst))
        .toString();
  }
}

class UserProfileVMBuilder
    implements Builder<UserProfileVM, UserProfileVMBuilder> {
  _$UserProfileVM? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _totalShipments;
  int? get totalShipments => _$this._totalShipments;
  set totalShipments(int? totalShipments) =>
      _$this._totalShipments = totalShipments;

  double? _balance;
  double? get balance => _$this._balance;
  set balance(double? balance) => _$this._balance = balance;

  int? _totalBills;
  int? get totalBills => _$this._totalBills;
  set totalBills(int? totalBills) => _$this._totalBills = totalBills;

  int? _totalStoreRequests;
  int? get totalStoreRequests => _$this._totalStoreRequests;
  set totalStoreRequests(int? totalStoreRequests) =>
      _$this._totalStoreRequests = totalStoreRequests;

  ListBuilder<ShipmentVM>? _newShipmenst;
  ListBuilder<ShipmentVM> get newShipmenst =>
      _$this._newShipmenst ??= new ListBuilder<ShipmentVM>();
  set newShipmenst(ListBuilder<ShipmentVM>? newShipmenst) =>
      _$this._newShipmenst = newShipmenst;

  UserProfileVMBuilder() {
    UserProfileVM._defaults(this);
  }

  UserProfileVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _status = $v.status;
      _totalShipments = $v.totalShipments;
      _balance = $v.balance;
      _totalBills = $v.totalBills;
      _totalStoreRequests = $v.totalStoreRequests;
      _newShipmenst = $v.newShipmenst?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfileVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserProfileVM;
  }

  @override
  void update(void Function(UserProfileVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserProfileVM build() => _build();

  _$UserProfileVM _build() {
    _$UserProfileVM _$result;
    try {
      _$result = _$v ??
          new _$UserProfileVM._(
              name: name,
              status: status,
              totalShipments: totalShipments,
              balance: balance,
              totalBills: totalBills,
              totalStoreRequests: totalStoreRequests,
              newShipmenst: _newShipmenst?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'newShipmenst';
        _newShipmenst?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserProfileVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
