import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/end_points/address/address_end_points.dart';
import 'package:saayer/features/address/addresses_book/data/data_sources/remote/addresses_book_RDS.dart';
import 'package:saayer/features/address/addresses_book/data/models/get_addresses_response_model.dart';

@Injectable(as: AddressesBookRDS)
class AddressesBookRDSImpl implements AddressesBookRDS {
  final ApiConsumer apiConsumer;

  AddressesBookRDSImpl({required this.apiConsumer});

  @override
  Future<GetAddressesResponseModel> getAddresses() async {
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.get(AddressEndPoints.getAddresses),
    );
    final GetAddressesResponseModel getAddressesResponseModel =
        GetAddressesResponseModel.fromJson(result);
    return getAddressesResponseModel;
  }
}
