import 'package:injectable/injectable.dart';
import 'package:saayer/common/address_widgets/data/data_sources/remote/address_widgets_RDS.dart';
import 'package:saayer/common/address_widgets/domain/repositories/address_widgets_repo.dart';

@Injectable(as: AddressWidgetsRepo)
class AddressWidgetsRepoImpl implements AddressWidgetsRepo {
  final AddressWidgetsRDS addressWidgetsRDSImpl;

  const AddressWidgetsRepoImpl({
    required this.addressWidgetsRDSImpl,
  });

}
