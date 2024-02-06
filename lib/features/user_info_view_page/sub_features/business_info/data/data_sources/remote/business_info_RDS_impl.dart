import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/user_info_end_points.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/models/business_info_request_model.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/models/business_info_response_model.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/business_info_entity.dart';

@Injectable(as: BusinessInfoRDS)
class BusinessInfoRDSImpl implements BusinessInfoRDS {
  final ApiConsumer apiConsumer;

  BusinessInfoRDSImpl({required this.apiConsumer});

  @override
  Future<BusinessInfoResponseModel> submitBusinessInfo(
      BusinessInfoEntity businessInfoEntity) async {
    final BusinessInfoRequestModel businessInfoRequestModel =
        BusinessInfoRequestModel(businessInfoEntity: businessInfoEntity);
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.post(UserInfoEndPoints.updateBusinessInfo,
          body: businessInfoRequestModel.toJson()),
    );
    final BusinessInfoResponseModel businessInfoResponseModel =
        BusinessInfoResponseModel.fromJson(result);
    return businessInfoResponseModel;
  }
}
