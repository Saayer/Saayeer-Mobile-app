import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class StoreInfoEntity extends Equatable {
  final String? name, url, maroofId, commercialRegistrationNo;

  const StoreInfoEntity({
    this.name,
    this.url,
    this.maroofId,
    this.commercialRegistrationNo,
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

  @override
  List<Object?> get props => [name, url, maroofId, commercialRegistrationNo];
}
