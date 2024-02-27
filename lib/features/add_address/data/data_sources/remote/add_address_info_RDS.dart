import 'package:saayer/features/add_address/data/models/address_info_response_model.dart';
import 'package:saayer/features/add_address/domain/entities/address_info_entity.dart';

abstract class AddressInfoRDS {
  Future<AddressInfoResponseModel> submitAddressInfo(
      AddressInfoEntity addressInfoEntity);
}
