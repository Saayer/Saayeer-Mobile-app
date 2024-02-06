import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/models/store_info_response_model.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/store_info_entity.dart';

abstract class StoreInfoRDS {
  Future<StoreInfoResponseModel> submitStoreInfo(StoreInfoEntity storeInfoEntity);
}
