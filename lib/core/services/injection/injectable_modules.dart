import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';

@module
abstract class InjectableModule {
  @singleton
  Dio get dio => Dio();
  @singleton
  Openapi get openapi => Openapi();
}
