import 'package:equatable/equatable.dart';
import 'package:saayer/features/profile_sub_features/info/core/utils/enums/enums.dart';

class InfoEntity extends Equatable {
  final InfoTypes infoType;
  final Map<String, dynamic> fields;

  const InfoEntity({
    required this.infoType,
    required this.fields,
  });

  InfoEntity copyWith({
    InfoTypes? infoType,
    Map<String, dynamic>? fields,
  }) {
    return InfoEntity(
      infoType: infoType ?? this.infoType,
      fields: fields ?? this.fields,
    );
  }

  @override
  List<Object> get props => [infoType, fields];
}
