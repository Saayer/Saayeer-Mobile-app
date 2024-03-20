import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class StoreInfoEntity extends Equatable {
  final String name, url, maroofId, commercialRegistrationNo;

  const StoreInfoEntity({
    required this.name,
    required this.url,
    required this.maroofId,
    required this.commercialRegistrationNo,
  });

  StoreInfoEntity copyWith({
    String? name,
    String? url,
    String? maroofId,
    String? commercialRegistrationNo,
  }) {
    return StoreInfoEntity(
      name: name ?? this.name,
      url: url ?? this.url,
      maroofId: maroofId ?? this.maroofId,
      commercialRegistrationNo:
          commercialRegistrationNo ?? this.commercialRegistrationNo,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'maroofId': maroofId,
      'commercialRegistrationNo': commercialRegistrationNo,
    };
  }

  factory StoreInfoEntity.fromJson(Map<String, dynamic> map) {
    return StoreInfoEntity(
      name: (map['name'] ?? "") as String,
      url: (map['url'] ?? "") as String,
      maroofId: (map['maroofId'] ?? "") as String,
      commercialRegistrationNo:
          (map['commercialRegistrationNo'] ?? "") as String,
    );
  }

  @override
  List<Object?> get props => [name, url, maroofId, commercialRegistrationNo];
}
