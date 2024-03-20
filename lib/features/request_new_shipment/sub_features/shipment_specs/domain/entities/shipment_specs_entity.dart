import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ShipmentSpecsEntity extends Equatable {
  final String weight, length, width, height, cost, content;

  const ShipmentSpecsEntity({
    required this.weight,
    required this.length,
    required this.width,
    required this.height,
    required this.cost,
    required this.content,
  });

  ShipmentSpecsEntity copyWith({
    String? weight,
    String? length,
    String? width,
    String? height,
    String? cost,
    String? content,
  }) {
    return ShipmentSpecsEntity(
      weight: weight ?? this.weight,
      length: length ?? this.length,
      width: width ?? this.width,
      height: height ?? this.height,
      cost: cost ?? this.cost,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'length': length,
      'width': width,
      'height': height,
      'cost': cost,
      'content': content,
    };
  }

  factory ShipmentSpecsEntity.fromJson(Map<String, dynamic> map) {
    return ShipmentSpecsEntity(
      weight: map['weight'] as String,
      length: map['length'] as String,
      width: map['width'] as String,
      height: map['height'] as String,
      cost: map['cost'] as String,
      content: map['content'] as String,
    );
  }

  @override
  List<Object?> get props => [
        weight,
        length,
        width,
        height,
        cost,
        content,
      ];
}
