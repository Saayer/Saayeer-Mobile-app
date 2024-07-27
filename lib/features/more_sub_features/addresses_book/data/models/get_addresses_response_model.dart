import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';

/// success : true
/// data : [{"district":null,"city":"الثميد","country":"Åland‬‏","fullName":"Saad sh","address":"45 street a","mobile":"044444444","email":"dev@gmail.com"}]
/// errorMessage : null

class GetAddressesResponseModel {
  GetAddressesResponseModel({
    bool? success,
    List<Data>? data,
    dynamic errorMessage,
  }) {
    _success = success;
    _data = data;
    _errorMessage = errorMessage;
  }

  GetAddressesResponseModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _errorMessage = json['errorMessage'];
  }

  bool? _success;
  List<Data>? _data;
  dynamic _errorMessage;

  GetAddressesResponseModel copyWith({
    bool? success,
    List<Data>? data,
    dynamic errorMessage,
  }) =>
      GetAddressesResponseModel(
        success: success ?? _success,
        data: data ?? _data,
        errorMessage: errorMessage ?? _errorMessage,
      );

  bool? get success => _success;

  List<Data>? get data => _data;

  dynamic get errorMessage => _errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['errorMessage'] = _errorMessage;
    return map;
  }

  List<AddressInfoEntity> toDomain() {
    return List.generate(data?.length ?? 0, (index) {
      final Data dataItem = data![index];
      return AddressInfoEntity(
          name: dataItem.fullName ?? "",
          email: dataItem.email ?? "",
          mobile: dataItem.mobile ?? "",
          address: dataItem.address ?? "",
          district: dataItem.district ?? "",
          city: dataItem.city ?? "",
          country: dataItem.country ?? "",
          alternativeMobile: '',
          zipCode: '');
    });
  }
}

/// district : null
/// city : "الثميد"
/// country : "Åland‬‏"
/// fullName : "Saad sh"
/// address : "45 street a"
/// mobile : "044444444"
/// email : "dev@gmail.com"

class Data {
  Data({
    dynamic district,
    String? city,
    String? country,
    String? fullName,
    String? address,
    String? mobile,
    String? email,
  }) {
    _district = district;
    _city = city;
    _country = country;
    _fullName = fullName;
    _address = address;
    _mobile = mobile;
    _email = email;
  }

  Data.fromJson(dynamic json) {
    _district = json['district'];
    _city = json['city'];
    _country = json['country'];
    _fullName = json['fullName'];
    _address = json['address'];
    _mobile = json['mobile'];
    _email = json['email'];
  }

  dynamic _district;
  String? _city;
  String? _country;
  String? _fullName;
  String? _address;
  String? _mobile;
  String? _email;

  Data copyWith({
    dynamic district,
    String? city,
    String? country,
    String? fullName,
    String? address,
    String? mobile,
    String? email,
  }) =>
      Data(
        district: district ?? _district,
        city: city ?? _city,
        country: country ?? _country,
        fullName: fullName ?? _fullName,
        address: address ?? _address,
        mobile: mobile ?? _mobile,
        email: email ?? _email,
      );

  dynamic get district => _district;

  String? get city => _city;

  String? get country => _country;

  String? get fullName => _fullName;

  String? get address => _address;

  String? get mobile => _mobile;

  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['district'] = _district;
    map['city'] = _city;
    map['country'] = _country;
    map['fullName'] = _fullName;
    map['address'] = _address;
    map['mobile'] = _mobile;
    map['email'] = _email;
    return map;
  }
}
