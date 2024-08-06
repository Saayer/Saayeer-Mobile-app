import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AddressesBookRepo {
  Future<Either<Failure, List<CustomerGetDto>>> getAddresses(CustomerQuery? customerQuery);

  Future<Either<Failure, void>> deleteAddresses(int addressId);

  Future<Either<Failure, void>> editAddresses(CustomerAddDto? customerQuery);
}
