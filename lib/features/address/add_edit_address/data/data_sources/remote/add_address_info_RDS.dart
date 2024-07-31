import 'package:saayer/features/address/add_edit_address/data/models/submit_address/submit_address_info_response_model.dart';
import 'package:saayer/features/address/add_edit_address/domain/entities/address_info_entity.dart';

abstract class AddAddressInfoRDS {
  Future<SubmitAddressInfoResponseModel> submitAddressInfo(
      AddressInfoEntity addressInfoEntity);
}
