import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/end_points/account/client_end_points.dart';
import 'package:saayer/core/API/end_points/end_points/account/user_info_end_points.dart';
import 'package:saayer/core/API/end_points/end_points/address/address_end_points.dart';
import 'package:saayer/features/add_address/data/data_sources/remote/add_address_info_RDS.dart';
import 'package:saayer/features/add_address/data/models/get_cities/get_cities_response_model.dart';
import 'package:saayer/features/add_address/data/models/submit_address/submit_address_info_request_model.dart';
import 'package:saayer/features/add_address/data/models/submit_address/submit_address_info_response_model.dart';
import 'package:saayer/features/add_address/domain/entities/address_info_entity.dart';

@Injectable(as: AddAddressInfoRDS)
class AddAddressInfoRDSImpl implements AddAddressInfoRDS {
  final ApiConsumer apiConsumer;

  AddAddressInfoRDSImpl({required this.apiConsumer});

  @override
  Future<SubmitAddressInfoResponseModel> submitAddressInfo(
      AddressInfoEntity addressInfoEntity) async {
    final SubmitAddressInfoRequestModel submitAddressInfoRequestModel =
        SubmitAddressInfoRequestModel(addressInfoEntity: addressInfoEntity);
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.post(ClientEndPoints.addClient,
          body: submitAddressInfoRequestModel.toJson()),
    );
    final SubmitAddressInfoResponseModel submitAddressInfoResponseModel =
        SubmitAddressInfoResponseModel.fromJson(result);
    return submitAddressInfoResponseModel;
  }

  @override
  Future<GetCitiesResponseModel> getCities() async {
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.post(AddressEndPoints.getCites),
    );
    final GetCitiesResponseModel getCitiesResponseModel =
        GetCitiesResponseModel.fromJson(result);
    return getCitiesResponseModel;
  }
}
