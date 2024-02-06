import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/models/business_info_response_model.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/business_info_entity.dart';

abstract class BusinessInfoRDS {
  Future<BusinessInfoResponseModel> submitBusinessInfo(BusinessInfoEntity businessInfoEntity);
}
