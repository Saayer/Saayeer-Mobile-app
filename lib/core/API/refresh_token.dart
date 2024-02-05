import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/auth_end_points.dart';

@injectable
class RefreshToken {
  final ApiConsumer apiConsumer;

  RefreshToken({required this.apiConsumer});

  Future<void> refreshToken() async {
     await apiConsumer.post(AuthEndPoints.entry);
  }

  Future retryRequest(RequestOptions requestOptions) async {
    return apiConsumer.retry(requestOptions);
  }
}
