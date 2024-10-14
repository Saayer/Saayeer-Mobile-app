import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AddEditAddressInfoRepo {
  Future<Either<Failure, CustomerGetDto?>> submitAddressInfo(CustomerAddDto customerAddDto);

  Future<Either<Failure, List<CityGetDto>>> getCities(int? governorateId);

  Future<Either<Failure, List<AddressLookUpDto>>> getCountries();

  Future<Either<Failure, List<AddressLookUpDto>>> getGovernorates(int? countryId);

  Future<Either<Failure, void>> updateAddressInfo(CustomerAddDto customerAddDto);
}
