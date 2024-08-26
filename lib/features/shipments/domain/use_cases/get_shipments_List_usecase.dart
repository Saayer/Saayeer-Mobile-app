import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/shipments/domain/repositories/shipments_list_repo.dart';

@injectable
class GetShipmentsListUseCase implements BaseUseCase<Future<Either<Failure, List<ShipmentGetDto>>>, ShipmentQuery?> {
  final ShipmentsListRepo shipmentsListRepo;

  const GetShipmentsListUseCase({
    required this.shipmentsListRepo,
  });

  @override
  Future<Either<Failure, List<ShipmentGetDto>>> call(ShipmentQuery? shipmentQuery) async {
    return await shipmentsListRepo.getShipmentsList(shipmentQuery);
  }
}
