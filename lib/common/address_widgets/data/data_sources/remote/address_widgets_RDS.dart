import 'package:saayer/common/address_widgets/data/models/get_cities/get_cities_response_model.dart';

abstract class AddressWidgetsRDS {
  Future<GetCitiesResponseModel> getCities();
}
