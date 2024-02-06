import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/store_info_entity.dart';

class StoreInfoRequestModel {
  final StoreInfoEntity storeInfoEntity;

  const StoreInfoRequestModel({
    required this.storeInfoEntity,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["name"] = storeInfoEntity.name;
    map["url"] = storeInfoEntity.url;
    map["maroofID"] = storeInfoEntity.maroofId;
    map["commercialRegistrationNo"] = storeInfoEntity.commercialRegistrationNo;
    return map;
  }
}
