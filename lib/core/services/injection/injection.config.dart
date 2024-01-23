// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:saayer/core/API/api_client.dart' as _i15;
import 'package:saayer/core/API/api_consumer.dart' as _i14;
import 'package:saayer/core/API/api_interceptors.dart' as _i16;
import 'package:saayer/core/API/refresh_token.dart' as _i19;
import 'package:saayer/core/network/network_info.dart' as _i11;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i8;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i9;
import 'package:saayer/core/services/encryption/encryption.dart' as _i4;
import 'package:saayer/core/services/injection/injectable_modules.dart' as _i20;
import 'package:saayer/core/services/local_storage/secure_storage_service.dart'
    as _i12;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i13;
import 'package:saayer/core/services/navigation/navigation_service.dart'
    as _i10;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i17;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i18;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i6;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i5;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.singleton<_i3.Dio>(injectableModule.dio);
    gh.singleton<_i4.Encryption>(_i4.Encryption());
    gh.lazySingleton<_i5.LogInRepo>(() => _i6.LogInRepoImpl());
    gh.lazySingleton<_i7.LogInUseCase>(() => _i7.LogInUseCase());
    gh.singleton<_i8.LoggedInCheckerService>(_i8.LoggedInCheckerService());
    gh.singleton<_i9.LoggedInService>(_i9.LoggedInService());
    gh.singleton<_i10.NavigationService>(_i10.NavigationService());
    gh.lazySingleton<_i11.NetworkInfo>(() => _i11.NetworkInfoImpl());
    gh.singleton<_i12.SecureStorageService>(_i12.SecureStorageService());
    gh.singleton<_i13.SharedPrefService>(_i13.SharedPrefService());
    gh.lazySingleton<_i14.ApiConsumer>(
        () => _i15.DioConsumer(client: gh<_i3.Dio>()));
    gh.lazySingleton<_i16.AppInterceptors>(
        () => _i16.AppInterceptors(client: gh<_i3.Dio>()));
    gh.lazySingleton<_i17.LogInRDS>(
        () => _i18.LogInRDSImpl(apiConsumer: gh<_i14.ApiConsumer>()));
    gh.factory<_i19.RefreshToken>(
        () => _i19.RefreshToken(apiConsumer: gh<_i14.ApiConsumer>()));
    return this;
  }
}

class _$InjectableModule extends _i20.InjectableModule {}
