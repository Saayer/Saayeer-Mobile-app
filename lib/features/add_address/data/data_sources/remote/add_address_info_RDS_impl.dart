import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/end_points/account/client_end_points.dart';
import 'package:saayer/core/API/end_points/end_points/account/user_info_end_points.dart';
import 'package:saayer/features/add_address/data/data_sources/remote/add_address_info_RDS.dart';
import 'package:saayer/features/add_address/data/models/address_info_request_model.dart';
import 'package:saayer/features/add_address/data/models/address_info_response_model.dart';
import 'package:saayer/features/add_address/domain/entities/address_info_entity.dart';

@Injectable(as: AddressInfoRDS)
class AddressInfoRDSImpl implements AddressInfoRDS {
  final ApiConsumer apiConsumer;

  AddressInfoRDSImpl({required this.apiConsumer});

  @override
  Future<AddressInfoResponseModel> submitAddressInfo(
      AddressInfoEntity addressInfoEntity) async {
    final AddressInfoRequestModel addressInfoRequestModel =
        AddressInfoRequestModel(addressInfoEntity: addressInfoEntity);
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.post(ClientEndPoints.addClient,
          body: addressInfoRequestModel.toJson()),
    );
    final AddressInfoResponseModel addressInfoResponseModel =
        AddressInfoResponseModel.fromJson(result);
    return addressInfoResponseModel;
  }
}
