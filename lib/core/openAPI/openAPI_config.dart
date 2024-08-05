import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:saayer/core/API/end_points/builder/end_points_base_url.dart';
import 'package:saayer/core/API/http_overrides.dart';
import 'package:saayer/core/API/interceptors/openapi_interceptors.dart';
import 'package:saayer/core/API/status_code.dart';
import 'package:saayer/core/app_config/app_flavor.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/enums.dart';

@lazySingleton
class OpenAPIConfig {
  final Openapi openapi;

  OpenAPIConfig({
    required this.openapi,
  }) {
    HttpOverrides.global = MyHttpOverrides();
    openapi.dio.options = BaseOptions(
        baseUrl: EndPointsBaseUrl.init().baseUrl,
        validateStatus: (status) {
          return (status == StatusCode.ok) || (status == StatusCode.success);
        },

        ///ConnectionTimeOut in ms
        connectTimeout: const Duration(milliseconds: 20000));
    addAppInterceptors();
  }

  void addAppInterceptors() {
    openapi.dio.interceptors.add(getIt<OpenapiInterceptors>());
    if (getIt<AppFlavor>().appFlavorEntity.flavorType != FlavorType.PROD) {
      openapi.dio.interceptors.addAll([
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
        ),
      ]);
    }
  }
}
