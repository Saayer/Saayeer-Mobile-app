import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/home/domain/repositories/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final OpenAPIConfig openAPIConfig;

  const HomeRepoImpl({
    required this.openAPIConfig,
  });

  @override
  Future<Either<Failure, ClientGetDto>> getUserProfile() async {
    log("getUserProfile");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final Response<ClientGetDto> result =
            await openAPIConfig.openapi.getClientsApi().apiClientsGet(apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!);
        } else {
          return Left(Failure(failureMessage: "Request failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "Request failed"));
      }
    }
    log("HomeRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, ShipmentsCountResponse>> getShipmentsStatusTotalCount(DateRangeDto dataRangeDto) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final Response<ShipmentsCountResponse> result = await openAPIConfig.openapi
            .getClientDashboardApi()
            .apiClientDashboardShipmentsPerStatusPost(
                dateRangeDto: dataRangeDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!);
        } else {
          return Left(Failure(failureMessage: "Request failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "Request failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, AmountPerDateResponse>> getTotalPaidPerDays(DateRangeDto dataRangeDto) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi.getClientDashboardApi().apiClientDashboardPaidPerDayPost(
            dateRangeDto: dataRangeDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!);
        } else {
          return Left(Failure(failureMessage: "get TotalPaidPerDays failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "Request failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, CountPerDateResponse>> getTotalShipmentPerDays(DateRangeDto dataRangeDto) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi.getClientDashboardApi().apiClientDashboardShipmentsPerDayPost(
            dateRangeDto: dataRangeDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!);
        } else {
          return Left(Failure(failureMessage: "get TotalShipmentPerDays failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "Request failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
