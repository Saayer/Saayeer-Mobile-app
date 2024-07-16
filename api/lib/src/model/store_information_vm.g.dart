// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_information_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StoreInformationVM extends StoreInformationVM {
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

  factory _$StoreInformationVM(
          [void Function(StoreInformationVMBuilder)? updates]) =>
      (new StoreInformationVMBuilder()..update(updates))._build();

  _$StoreInformationVM._(
      {this.name,
      this.url,
      this.maroofID,
      this.commercialRegistrationNo,
      this.storeImage})
      : super._();

  @override
  StoreInformationVM rebuild(
          void Function(StoreInformationVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreInformationVMBuilder toBuilder() =>
      new StoreInformationVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreInformationVM &&
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
    return (newBuiltValueToStringHelper(r'StoreInformationVM')
          ..add('name', name)
          ..add('url', url)
          ..add('maroofID', maroofID)
          ..add('commercialRegistrationNo', commercialRegistrationNo)
          ..add('storeImage', storeImage))
        .toString();
  }
}

class StoreInformationVMBuilder
    implements Builder<StoreInformationVM, StoreInformationVMBuilder> {
  _$StoreInformationVM? _$v;

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

  StoreInformationVMBuilder() {
    StoreInformationVM._defaults(this);
  }

  StoreInformationVMBuilder get _$this {
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
  void replace(StoreInformationVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoreInformationVM;
  }

  @override
  void update(void Function(StoreInformationVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StoreInformationVM build() => _build();

  _$StoreInformationVM _build() {
    final _$result = _$v ??
        new _$StoreInformationVM._(
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
