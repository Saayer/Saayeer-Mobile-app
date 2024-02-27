import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String id, nameEn, nameAr;

  const CityEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
  });

  CityEntity copyWith({
    String? id,
    String? nameEn,
    String? nameAr,
  }) {
    return CityEntity(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
    );
  }

  @override
  List<Object> get props => [id];
}
