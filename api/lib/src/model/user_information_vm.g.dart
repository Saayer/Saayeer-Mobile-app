// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserInformationVM extends UserInformationVM {
  @override
  final PersonalInformationResponseVM? personal;
  @override
  final BusinessInformationResponseVM? business;
  @override
  final BuiltList<StoreInformationVM>? stores;
  @override
  final BuiltList<ClientsInformationResponseVM>? clients;
  @override
  final double? score;
  @override
  final String? scorePercentage;

  factory _$UserInformationVM(
          [void Function(UserInformationVMBuilder)? updates]) =>
      (new UserInformationVMBuilder()..update(updates))._build();

  _$UserInformationVM._(
      {this.personal,
      this.business,
      this.stores,
      this.clients,
      this.score,
      this.scorePercentage})
      : super._();

  @override
  UserInformationVM rebuild(void Function(UserInformationVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserInformationVMBuilder toBuilder() =>
      new UserInformationVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserInformationVM &&
        personal == other.personal &&
        business == other.business &&
        stores == other.stores &&
        clients == other.clients &&
        score == other.score &&
        scorePercentage == other.scorePercentage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, personal.hashCode);
    _$hash = $jc(_$hash, business.hashCode);
    _$hash = $jc(_$hash, stores.hashCode);
    _$hash = $jc(_$hash, clients.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, scorePercentage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserInformationVM')
          ..add('personal', personal)
          ..add('business', business)
          ..add('stores', stores)
          ..add('clients', clients)
          ..add('score', score)
          ..add('scorePercentage', scorePercentage))
        .toString();
  }
}

class UserInformationVMBuilder
    implements Builder<UserInformationVM, UserInformationVMBuilder> {
  _$UserInformationVM? _$v;

  PersonalInformationResponseVMBuilder? _personal;
  PersonalInformationResponseVMBuilder get personal =>
      _$this._personal ??= new PersonalInformationResponseVMBuilder();
  set personal(PersonalInformationResponseVMBuilder? personal) =>
      _$this._personal = personal;

  BusinessInformationResponseVMBuilder? _business;
  BusinessInformationResponseVMBuilder get business =>
      _$this._business ??= new BusinessInformationResponseVMBuilder();
  set business(BusinessInformationResponseVMBuilder? business) =>
      _$this._business = business;

  ListBuilder<StoreInformationVM>? _stores;
  ListBuilder<StoreInformationVM> get stores =>
      _$this._stores ??= new ListBuilder<StoreInformationVM>();
  set stores(ListBuilder<StoreInformationVM>? stores) =>
      _$this._stores = stores;

  ListBuilder<ClientsInformationResponseVM>? _clients;
  ListBuilder<ClientsInformationResponseVM> get clients =>
      _$this._clients ??= new ListBuilder<ClientsInformationResponseVM>();
  set clients(ListBuilder<ClientsInformationResponseVM>? clients) =>
      _$this._clients = clients;

  double? _score;
  double? get score => _$this._score;
  set score(double? score) => _$this._score = score;

  String? _scorePercentage;
  String? get scorePercentage => _$this._scorePercentage;
  set scorePercentage(String? scorePercentage) =>
      _$this._scorePercentage = scorePercentage;

  UserInformationVMBuilder() {
    UserInformationVM._defaults(this);
  }

  UserInformationVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _personal = $v.personal?.toBuilder();
      _business = $v.business?.toBuilder();
      _stores = $v.stores?.toBuilder();
      _clients = $v.clients?.toBuilder();
      _score = $v.score;
      _scorePercentage = $v.scorePercentage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserInformationVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserInformationVM;
  }

  @override
  void update(void Function(UserInformationVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserInformationVM build() => _build();

  _$UserInformationVM _build() {
    _$UserInformationVM _$result;
    try {
      _$result = _$v ??
          new _$UserInformationVM._(
              personal: _personal?.build(),
              business: _business?.build(),
              stores: _stores?.build(),
              clients: _clients?.build(),
              score: score,
              scorePercentage: scorePercentage);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'personal';
        _personal?.build();
        _$failedField = 'business';
        _business?.build();
        _$failedField = 'stores';
        _stores?.build();
        _$failedField = 'clients';
        _clients?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserInformationVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
