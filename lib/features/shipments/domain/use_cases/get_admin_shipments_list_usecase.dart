import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/shipments/domain/repositories/shipments_list_repo.dart';

@injectable
class GetAdminShipmentsListUseCase
    implements BaseUseCase<Future<Either<Failure, List<ShipmentGetDtoExtended>>>, ShipmentQueryLAdmin?> {
  final ShipmentsListRepo shipmentsListRepo;

  const GetAdminShipmentsListUseCase({
    required this.shipmentsListRepo,
  });

  @override
  Future<Either<Failure, List<ShipmentGetDtoExtended>>> call(ShipmentQueryLAdmin? shipmentQuery) async {
    return await shipmentsListRepo.getAdminShipmentsList(shipmentQuery);
  }
}
