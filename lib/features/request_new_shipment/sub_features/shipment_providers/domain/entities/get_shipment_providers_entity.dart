import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class GetShipmentProvidersEntity extends Equatable {
  final String weight, length, width, height, cost, from, to;

  const GetShipmentProvidersEntity({
    required this.weight,
    required this.length,
    required this.width,
    required this.height,
    required this.cost,
    required this.from,
    required this.to,
  });

  GetShipmentProvidersEntity copyWith({
    String? weight,
    String? length,
    String? width,
    String? height,
    String? cost,
    String? from,
    String? to,
  }) {
    return GetShipmentProvidersEntity(
      weight: weight ?? this.weight,
      length: length ?? this.length,
      width: width ?? this.width,
      height: height ?? this.height,
      cost: cost ?? this.cost,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'length': length,
      'width': width,
      'height': height,
      'cost': cost,
      "from": from,
      "to": to,
    };
  }

  factory GetShipmentProvidersEntity.fromJson(Map<String, dynamic> map) {
    return GetShipmentProvidersEntity(
      weight: map['weight'] as String,
      length: map['length'] as String,
      width: map['width'] as String,
      height: map['height'] as String,
      cost: map['cost'] as String,
      from: map['from'] as String,
      to: map['to'] as String,
    );
  }

  @override
  List<Object?> get props => [
        weight,
        length,
        width,
        height,
        cost,
        from,
        to,
      ];
}
