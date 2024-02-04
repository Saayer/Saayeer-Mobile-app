import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/services/current_user/logged_in_service.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/core/entities/logged_in_user_entity.dart';

@Singleton()
class LoggedInCheckerService {
  Future<bool> isLoggedIn() async {
    final bool? isLoggedIn = await getIt<SecureStorageService>().getIsLoggedIn();
    return isLoggedIn ?? false;
  }

  void initLoggedUser() async {
    final LoggedInUserEntity? loggedInUserEntity =
        await getIt<SecureStorageService>().getLoggedInUser();
    getIt<LoggedInService>().setLoggedInUserEntity(loggedInUserEntity!);
  }

  Future<void> logOut() async {
    await getIt<SecureStorageService>().clearStorage();
    getIt<LoggedInService>().setLoggedInUserEntity(null);
  }
}