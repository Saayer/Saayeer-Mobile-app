import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/business_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/entities/personal_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/store_info_entity.dart';

/// success : true
/// data : {"personal":{"district":null,"city":"لا يوجد","country":null,"name":"Mohameed","email":"MCT.ahmed@gmail.com","nationalId":"111","address":"25"},"business":{"district":null,"city":"لا يوجد","country":null,"companyName":"test test","email":"business@gmail.com","mobileNumber":"054412366777777'","commercialRegistrationNo":"55555555","shortAddress":"sdfsdfsdfsd"},"stores":[{"name":"tradeline","url":"https://www.tradeline.com","maroofID":"555555","commercialRegistrationNo":null,"storeImage":null}],"clients":[{"district":null,"city":null,"country":null,"fullName":"Aly Ahmed","address":"45 street a","mobile":"044444444","email":"dev@gmail.com"}],"score":0.84615386,"scorePercentage":"84.62%"}
/// errorMessage : null

class UserCardResponseModel {
  UserCardResponseModel({
    bool? success,
    Data? data,
    dynamic errorMessage,
  }) {
    _success = success;
    _data = data;
    _errorMessage = errorMessage;
  }

  UserCardResponseModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errorMessage = json['errorMessage'];
  }

  bool? _success;
  Data? _data;
  dynamic _errorMessage;

  UserCardResponseModel copyWith({
    bool? success,
    Data? data,
    dynamic errorMessage,
  }) =>
      UserCardResponseModel(
        success: success ?? _success,
        data: data ?? _data,
        errorMessage: errorMessage ?? _errorMessage,
      );

  bool? get success => _success;

  Data? get data => _data;

  dynamic get errorMessage => _errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['errorMessage'] = _errorMessage;
    return map;
  }

  UserCardEntity toDomain() {
    return UserCardEntity(
        isSuccess: success ?? false,
        hasPersonalInformation: data?.personal != null,
        hasBusinessInformation: data?.business != null,
        hasStoresInformation: data?.stores?.isNotEmpty ?? false,
        score: data?.score?.toDouble() ?? 0,
        scorePercentage: data?.scorePercentage ?? "0%",
        personalInfoEntity: data?.personal != null
            ? PersonalInfoEntity(
                name: data?.personal?.name ?? "",
                email: data?.personal?.email ?? "",
                nationalId: data?.personal?.nationalId ?? "",
                address: data?.personal?.address ?? "",
                district: data?.personal?.district ?? "",
                governorate: data?.personal?.city ?? "")
            : null,
        businessInfoEntity: data?.business != null
            ? BusinessInfoEntity(
                companyName: data?.business?.companyName ?? "",
                email: data?.business?.email ?? "",
                mobileNumber: data?.business?.mobileNumber ?? "",
                commercialRegistrationNo:
                    data?.business?.commercialRegistrationNo ?? "",
                shortAddress: data?.business?.shortAddress ?? "",
                district: data?.business?.district ?? "",
                governorate: data?.business?.city ?? "")
            : null,
        storeInfoEntity: (data?.stores?.isNotEmpty ?? false)
            ? StoreInfoEntity(
                name: data?.stores?[0].name ?? "",
                url: data?.stores?[0].url ?? "",
                maroofId: data?.stores?[0].maroofID ?? "",
                commercialRegistrationNo:
                    data?.stores?[0].commercialRegistrationNo ?? "")
            : null);
  }
}

/// personal : {"district":null,"city":"لا يوجد","country":null,"name":"Mohameed","email":"MCT.ahmed@gmail.com","nationalId":"111","address":"25"}
/// business : {"district":null,"city":"لا يوجد","country":null,"companyName":"test test","email":"business@gmail.com","mobileNumber":"054412366777777'","commercialRegistrationNo":"55555555","shortAddress":"sdfsdfsdfsd"}
/// stores : [{"name":"tradeline","url":"https://www.tradeline.com","maroofID":"555555","commercialRegistrationNo":null,"storeImage":null}]
/// clients : [{"district":null,"city":null,"country":null,"fullName":"Aly Ahmed","address":"45 street a","mobile":"044444444","email":"dev@gmail.com"}]
/// score : 0.84615386
/// scorePercentage : "84.62%"

class Data {
  Data({
    Personal? personal,
    Business? business,
    List<Stores>? stores,
    List<Clients>? clients,
    num? score,
    String? scorePercentage,
  }) {
    _personal = personal;
    _business = business;
    _stores = stores;
    _clients = clients;
    _score = score;
    _scorePercentage = scorePercentage;
  }

  Data.fromJson(dynamic json) {
    _personal =
        json['personal'] != null ? Personal.fromJson(json['personal']) : null;
    _business =
        json['business'] != null ? Business.fromJson(json['business']) : null;
    if (json['stores'] != null) {
      _stores = [];
      json['stores'].forEach((v) {
        _stores?.add(Stores.fromJson(v));
      });
    }
    if (json['clients'] != null) {
      _clients = [];
      json['clients'].forEach((v) {
        _clients?.add(Clients.fromJson(v));
      });
    }
    _score = json['score'];
    _scorePercentage = json['scorePercentage'];
  }

  Personal? _personal;
  Business? _business;
  List<Stores>? _stores;
  List<Clients>? _clients;
  num? _score;
  String? _scorePercentage;

  Data copyWith({
    Personal? personal,
    Business? business,
    List<Stores>? stores,
    List<Clients>? clients,
    num? score,
    String? scorePercentage,
  }) =>
      Data(
        personal: personal ?? _personal,
        business: business ?? _business,
        stores: stores ?? _stores,
        clients: clients ?? _clients,
        score: score ?? _score,
        scorePercentage: scorePercentage ?? _scorePercentage,
      );

  Personal? get personal => _personal;

  Business? get business => _business;

  List<Stores>? get stores => _stores;

  List<Clients>? get clients => _clients;

  num? get score => _score;

  String? get scorePercentage => _scorePercentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_personal != null) {
      map['personal'] = _personal?.toJson();
    }
    if (_business != null) {
      map['business'] = _business?.toJson();
    }
    if (_stores != null) {
      map['stores'] = _stores?.map((v) => v.toJson()).toList();
    }
    if (_clients != null) {
      map['clients'] = _clients?.map((v) => v.toJson()).toList();
    }
    map['score'] = _score;
    map['scorePercentage'] = _scorePercentage;
    return map;
  }
}

/// district : null
/// city : null
/// country : null
/// fullName : "Aly Ahmed"
/// address : "45 street a"
/// mobile : "044444444"
/// email : "dev@gmail.com"

class Clients {
  Clients({
    dynamic district,
    dynamic city,
    dynamic country,
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

  Clients.fromJson(dynamic json) {
    _district = json['district'];
    _city = json['city'];
    _country = json['country'];
    _fullName = json['fullName'];
    _address = json['address'];
    _mobile = json['mobile'];
    _email = json['email'];
  }

  dynamic _district;
  dynamic _city;
  dynamic _country;
  String? _fullName;
  String? _address;
  String? _mobile;
  String? _email;

  Clients copyWith({
    dynamic district,
    dynamic city,
    dynamic country,
    String? fullName,
    String? address,
    String? mobile,
    String? email,
  }) =>
      Clients(
        district: district ?? _district,
        city: city ?? _city,
        country: country ?? _country,
        fullName: fullName ?? _fullName,
        address: address ?? _address,
        mobile: mobile ?? _mobile,
        email: email ?? _email,
      );

  dynamic get district => _district;

  dynamic get city => _city;

  dynamic get country => _country;

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

/// name : "tradeline"
/// url : "https://www.tradeline.com"
/// maroofID : "555555"
/// commercialRegistrationNo : null
/// storeImage : null

class Stores {
  Stores({
    String? name,
    String? url,
    String? maroofID,
    dynamic commercialRegistrationNo,
    dynamic storeImage,
  }) {
    _name = name;
    _url = url;
    _maroofID = maroofID;
    _commercialRegistrationNo = commercialRegistrationNo;
    _storeImage = storeImage;
  }

  Stores.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
    _maroofID = json['maroofID'];
    _commercialRegistrationNo = json['commercialRegistrationNo'];
    _storeImage = json['storeImage'];
  }

  String? _name;
  String? _url;
  String? _maroofID;
  dynamic _commercialRegistrationNo;
  dynamic _storeImage;

  Stores copyWith({
    String? name,
    String? url,
    String? maroofID,
    dynamic commercialRegistrationNo,
    dynamic storeImage,
  }) =>
      Stores(
        name: name ?? _name,
        url: url ?? _url,
        maroofID: maroofID ?? _maroofID,
        commercialRegistrationNo:
            commercialRegistrationNo ?? _commercialRegistrationNo,
        storeImage: storeImage ?? _storeImage,
      );

  String? get name => _name;

  String? get url => _url;

  String? get maroofID => _maroofID;

  dynamic get commercialRegistrationNo => _commercialRegistrationNo;

  dynamic get storeImage => _storeImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    map['maroofID'] = _maroofID;
    map['commercialRegistrationNo'] = _commercialRegistrationNo;
    map['storeImage'] = _storeImage;
    return map;
  }
}

/// district : null
/// city : "لا يوجد"
/// country : null
/// companyName : "test test"
/// email : "business@gmail.com"
/// mobileNumber : "054412366777777'"
/// commercialRegistrationNo : "55555555"
/// shortAddress : "sdfsdfsdfsd"

class Business {
  Business({
    dynamic district,
    String? city,
    dynamic country,
    String? companyName,
    String? email,
    String? mobileNumber,
    String? commercialRegistrationNo,
    String? shortAddress,
  }) {
    _district = district;
    _city = city;
    _country = country;
    _companyName = companyName;
    _email = email;
    _mobileNumber = mobileNumber;
    _commercialRegistrationNo = commercialRegistrationNo;
    _shortAddress = shortAddress;
  }

  Business.fromJson(dynamic json) {
    _district = json['district'];
    _city = json['city'];
    _country = json['country'];
    _companyName = json['companyName'];
    _email = json['email'];
    _mobileNumber = json['mobileNumber'];
    _commercialRegistrationNo = json['commercialRegistrationNo'];
    _shortAddress = json['shortAddress'];
  }

  dynamic _district;
  String? _city;
  dynamic _country;
  String? _companyName;
  String? _email;
  String? _mobileNumber;
  String? _commercialRegistrationNo;
  String? _shortAddress;

  Business copyWith({
    dynamic district,
    String? city,
    dynamic country,
    String? companyName,
    String? email,
    String? mobileNumber,
    String? commercialRegistrationNo,
    String? shortAddress,
  }) =>
      Business(
        district: district ?? _district,
        city: city ?? _city,
        country: country ?? _country,
        companyName: companyName ?? _companyName,
        email: email ?? _email,
        mobileNumber: mobileNumber ?? _mobileNumber,
        commercialRegistrationNo:
            commercialRegistrationNo ?? _commercialRegistrationNo,
        shortAddress: shortAddress ?? _shortAddress,
      );

  dynamic get district => _district;

  String? get city => _city;

  dynamic get country => _country;

  String? get companyName => _companyName;

  String? get email => _email;

  String? get mobileNumber => _mobileNumber;

  String? get commercialRegistrationNo => _commercialRegistrationNo;

  String? get shortAddress => _shortAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['district'] = _district;
    map['city'] = _city;
    map['country'] = _country;
    map['companyName'] = _companyName;
    map['email'] = _email;
    map['mobileNumber'] = _mobileNumber;
    map['commercialRegistrationNo'] = _commercialRegistrationNo;
    map['shortAddress'] = _shortAddress;
    return map;
  }
}

/// district : null
/// city : "لا يوجد"
/// country : null
/// name : "Mohameed"
/// email : "MCT.ahmed@gmail.com"
/// nationalId : "111"
/// address : "25"

class Personal {
  Personal({
    dynamic district,
    String? city,
    dynamic country,
    String? name,
    String? email,
    String? nationalId,
    String? address,
  }) {
    _district = district;
    _city = city;
    _country = country;
    _name = name;
    _email = email;
    _nationalId = nationalId;
    _address = address;
  }

  Personal.fromJson(dynamic json) {
    _district = json['district'];
    _city = json['city'];
    _country = json['country'];
    _name = json['name'];
    _email = json['email'];
    _nationalId = json['nationalId'];
    _address = json['address'];
  }

  dynamic _district;
  String? _city;
  dynamic _country;
  String? _name;
  String? _email;
  String? _nationalId;
  String? _address;

  Personal copyWith({
    dynamic district,
    String? city,
    dynamic country,
    String? name,
    String? email,
    String? nationalId,
    String? address,
  }) =>
      Personal(
        district: district ?? _district,
        city: city ?? _city,
        country: country ?? _country,
        name: name ?? _name,
        email: email ?? _email,
        nationalId: nationalId ?? _nationalId,
        address: address ?? _address,
      );

  dynamic get district => _district;

  String? get city => _city;

  dynamic get country => _country;

  String? get name => _name;

  String? get email => _email;

  String? get nationalId => _nationalId;

  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['district'] = _district;
    map['city'] = _city;
    map['country'] = _country;
    map['name'] = _name;
    map['email'] = _email;
    map['nationalId'] = _nationalId;
    map['address'] = _address;
    return map;
  }
}
