// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store_information_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateStoreInformationVM extends CreateStoreInformationVM {
  @override
  final String? name;
  @override
  final String? url;
  @override
  final String? maroofID;
  @override
  final String? commercialRegistrationNo;
  @override
  final String? storeImage;

  factory _$CreateStoreInformationVM(
          [void Function(CreateStoreInformationVMBuilder)? updates]) =>
      (new CreateStoreInformationVMBuilder()..update(updates))._build();

  _$CreateStoreInformationVM._(
      {this.name,
      this.url,
      this.maroofID,
      this.commercialRegistrationNo,
      this.storeImage})
      : super._();

  @override
  CreateStoreInformationVM rebuild(
          void Function(CreateStoreInformationVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateStoreInformationVMBuilder toBuilder() =>
      new CreateStoreInformationVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateStoreInformationVM &&
        name == other.name &&
        url == other.url &&
        maroofID == other.maroofID &&
        commercialRegistrationNo == other.commercialRegistrationNo &&
        storeImage == other.storeImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, maroofID.hashCode);
    _$hash = $jc(_$hash, commercialRegistrationNo.hashCode);
    _$hash = $jc(_$hash, storeImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateStoreInformationVM')
          ..add('name', name)
          ..add('url', url)
          ..add('maroofID', maroofID)
          ..add('commercialRegistrationNo', commercialRegistrationNo)
          ..add('storeImage', storeImage))
        .toString();
  }
}

class CreateStoreInformationVMBuilder
    implements
        Builder<CreateStoreInformationVM, CreateStoreInformationVMBuilder> {
  _$CreateStoreInformationVM? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _maroofID;
  String? get maroofID => _$this._maroofID;
  set maroofID(String? maroofID) => _$this._maroofID = maroofID;

  String? _commercialRegistrationNo;
  String? get commercialRegistrationNo => _$this._commercialRegistrationNo;
  set commercialRegistrationNo(String? commercialRegistrationNo) =>
      _$this._commercialRegistrationNo = commercialRegistrationNo;

  String? _storeImage;
  String? get storeImage => _$this._storeImage;
  set storeImage(String? storeImage) => _$this._storeImage = storeImage;

  CreateStoreInformationVMBuilder() {
    CreateStoreInformationVM._defaults(this);
  }

  CreateStoreInformationVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _url = $v.url;
      _maroofID = $v.maroofID;
      _commercialRegistrationNo = $v.commercialRegistrationNo;
      _storeImage = $v.storeImage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateStoreInformationVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateStoreInformationVM;
  }

  @override
  void update(void Function(CreateStoreInformationVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateStoreInformationVM build() => _build();

  _$CreateStoreInformationVM _build() {
    final _$result = _$v ??
        new _$CreateStoreInformationVM._(
            name: name,
            url: url,
            maroofID: maroofID,
            commercialRegistrationNo: commercialRegistrationNo,
            storeImage: storeImage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
