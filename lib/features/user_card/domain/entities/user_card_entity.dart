import 'package:equatable/equatable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/features/more_sub_features/personal_info/domain/entities/personal_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/business_info_entity.dart';

class UserCardEntity extends Equatable {
  final bool isSuccess,
      hasPersonalInformation,
      hasBusinessInformation,
      hasStoresInformation;
  final PersonalInfoEntity? personalInfoEntity;
  final BusinessInfoEntity? businessInfoEntity;
  final StoreGetDto? storeInfoEntity;
  final double score;
  final String scorePercentage;

  const UserCardEntity({
    required this.isSuccess,
    required this.hasPersonalInformation,
    required this.hasBusinessInformation,
    required this.hasStoresInformation,
    this.personalInfoEntity,
    this.businessInfoEntity,
    this.storeInfoEntity,
    required this.score,
    required this.scorePercentage,
  });

  UserCardEntity copyWith({
    bool? isSuccess,
    bool? hasPersonalInformation,
    bool? hasBusinessInformation,
    bool? hasStoresInformation,
    PersonalInfoEntity? personalInfoEntity,
    BusinessInfoEntity? businessInfoEntity,
    StoreGetDto? storeInfoEntity,
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
      personalInfoEntity: personalInfoEntity ?? this.personalInfoEntity,
      businessInfoEntity: businessInfoEntity ?? this.businessInfoEntity,
      storeInfoEntity: storeInfoEntity ?? this.storeInfoEntity,
      score: score ?? this.score,
      scorePercentage: scorePercentage ?? this.scorePercentage,
    );
  }

  @override
  List<Object?> get props => [
        isSuccess,
        personalInfoEntity,
        businessInfoEntity,
        storeInfoEntity,
        score,
        scorePercentage,
      ];

  Map<String, dynamic> toJson() {
    return {
      'isSuccess': isSuccess,
      'hasPersonalInformation': hasPersonalInformation,
      'hasBusinessInformation': hasBusinessInformation,
      'hasStoresInformation': hasStoresInformation,
      'personalInfoEntity': personalInfoEntity?.toJson() ?? {},
      'businessInfoEntity': businessInfoEntity?.toJson() ?? {},
      'storeInfoEntity': storeInfoEntity ?? {},
      'score': score,
      'scorePercentage': scorePercentage,
    };
  }

  factory UserCardEntity.fromJson(Map<String, dynamic> map) {
    return UserCardEntity(
      isSuccess: map['isSuccess'] as bool,
      hasPersonalInformation: map['hasPersonalInformation'] as bool,
      hasBusinessInformation: map['hasBusinessInformation'] as bool,
      hasStoresInformation: map['hasStoresInformation'] as bool,
      personalInfoEntity:
          PersonalInfoEntity.fromJson(map['personalInfoEntity']),
      businessInfoEntity:
          BusinessInfoEntity.fromJson(map['businessInfoEntity']),
      //storeInfoEntity: StoreInfoEntity.fromJson(map['storeInfoEntity']),
      score: map['score'] as double,
      scorePercentage: map['scorePercentage'] as String,
    );
  }
}
