import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:saayer/common/address_widgets/data/data_sources/remote/address_widgets_RDS.dart';
import 'package:saayer/common/address_widgets/data/models/get_cities/get_cities_response_model.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/end_points/address/address_end_points.dart';

@Injectable(as: AddressWidgetsRDS)
class AddressWidgetsRDSImpl implements AddressWidgetsRDS {
  final ApiConsumer apiConsumer;

  AddressWidgetsRDSImpl({required this.apiConsumer});

  @override
  Future<GetCitiesResponseModel> getCities() async {
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.get(AddressEndPoints.getCites),
    );
    final GetCitiesResponseModel getCitiesResponseModel =
        GetCitiesResponseModel.fromJson(result);
    return getCitiesResponseModel;
  }
}
