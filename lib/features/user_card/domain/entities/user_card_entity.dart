import 'package:equatable/equatable.dart';

class UserCardEntity extends Equatable {
  final bool isSuccess,
      hasPersonalInformation,
      hasBusinessInformation,
      hasStoresInformation;
  final double score;
  final String scorePercentage;

  const UserCardEntity({
    required this.isSuccess,
    required this.hasPersonalInformation,
    required this.hasBusinessInformation,
    required this.hasStoresInformation,
    required this.score,
    required this.scorePercentage,
  });

  UserCardEntity copyWith({
    bool? isSuccess,
    bool? hasPersonalInformation,
    bool? hasBusinessInformation,
    bool? hasStoresInformation,
    double? score,
    String? scorePercentage,
  }) {
    return UserCardEntity(
      isSuccess: isSuccess ?? this.isSuccess,
      hasPersonalInformation:
          hasPersonalInformation ?? this.hasPersonalInformation,
      hasBusinessInformation:
          hasBusinessInformation ?? this.hasBusinessInformation,
      hasStoresInformation: hasStoresInformation ?? this.hasStoresInformation,
      score: score ?? this.score,
      scorePercentage: scorePercentage ?? this.scorePercentage,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isSuccess'] = isSuccess;
    map['hasPersonalInformation'] = hasPersonalInformation;
    map['hasBusinessInformation'] = hasBusinessInformation;
    map['hasStoresInformation'] = hasStoresInformation;
    map['score'] = score;
    map['scorePercentage'] = scorePercentage;
    return map;
  }

  @override
  List<Object> get props => [
        isSuccess,
        hasPersonalInformation,
        hasBusinessInformation,
        hasStoresInformation,
        score,
        scorePercentage,
      ];
}
