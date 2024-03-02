import 'package:saayer/features/more_sub_features/addresses_book/data/models/get_addresses_response_model.dart';

abstract class AddressesBookRDS {
  Future<GetAddressesResponseModel> getAddresses();
}
