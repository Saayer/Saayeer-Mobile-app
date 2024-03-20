import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/address/add_address/domain/entities/submit_address_info_entity.dart';

abstract class AddressesBookRepo {
  Future<Either<Failure, List<AddressInfoEntity>>> getAddresses();
}
