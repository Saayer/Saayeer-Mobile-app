import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/user_info_end_points.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/models/store_info_request_model.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/models/store_info_response_model.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/store_info_entity.dart';

@Injectable(as: StoreInfoRDS)
class StoreInfoRDSImpl implements StoreInfoRDS {
  final ApiConsumer apiConsumer;

  StoreInfoRDSImpl({required this.apiConsumer});

  @override
  Future<StoreInfoResponseModel> submitStoreInfo(
      StoreInfoEntity storeInfoEntity) async {
    final StoreInfoRequestModel storeInfoRequestModel =
        StoreInfoRequestModel(storeInfoEntity: storeInfoEntity);
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.post(UserInfoEndPoints.updateStoreInfo,
          body: storeInfoRequestModel.toJson()),
    );
    final StoreInfoResponseModel storeInfoResponseModel =
        StoreInfoResponseModel.fromJson(result);
    return storeInfoResponseModel;
  }
}
