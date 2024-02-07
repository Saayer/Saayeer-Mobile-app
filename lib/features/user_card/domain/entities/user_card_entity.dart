import 'package:equatable/equatable.dart';

class UserCardEntity extends Equatable {
  final bool hasPersonalInformation,
      hasBusinessInformation,
      hasStoresInformation;
  final double score;
  final String scorePercentage;

  const UserCardEntity({
    required this.hasPersonalInformation,
    required this.hasBusinessInformation,
    required this.hasStoresInformation,
    required this.score,
    required this.scorePercentage,
  });

  UserCardEntity copyWith({
    bool? hasPersonalInformation,
    bool? hasBusinessInformation,
    bool? hasStoresInformation,
    double? score,
    String? scorePercentage,
  }) {
    return UserCardEntity(
      hasPersonalInformation:
          hasPersonalInformation ?? this.hasPersonalInformation,
      hasBusinessInformation:
          hasBusinessInformation ?? this.hasBusinessInformation,
      hasStoresInformation: hasStoresInformation ?? this.hasStoresInformation,
      score: score ?? this.score,
      scorePercentage: scorePercentage ?? this.scorePercentage,
    );
  }

  @override
  List<Object> get props => [
        hasPersonalInformation,
        hasBusinessInformation,
        hasStoresInformation,
        score,
        scorePercentage,
      ];
}
