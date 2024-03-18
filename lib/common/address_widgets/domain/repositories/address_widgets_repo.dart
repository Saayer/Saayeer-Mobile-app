import 'package:saayer/common/address_widgets/domain/entities/city_entity.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AddressWidgetsRepo {
  Future<Either<Failure, List<CityEntity>>> getCities();
}
