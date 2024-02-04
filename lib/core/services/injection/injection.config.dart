// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:saayer/core/API/api_client.dart' as _i13;
import 'package:saayer/core/API/api_consumer.dart' as _i12;
import 'package:saayer/core/API/interceptors/api_interceptors.dart' as _i14;
import 'package:saayer/core/API/refresh_token.dart' as _i20;
import 'package:saayer/core/app_config/app_flavor.dart' as _i3;
import 'package:saayer/core/network/network_info.dart' as _i9;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i6;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i7;
import 'package:saayer/core/services/encryption/encryption.dart' as _i5;
import 'package:saayer/core/services/injection/injectable_modules.dart' as _i28;
import 'package:saayer/core/services/local_storage/secure_storage_service.dart'
    as _i10;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i11;
import 'package:saayer/core/services/navigation/navigation_service.dart' as _i8;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i15;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i16;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i18;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i17;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i19;
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart'
    as _i26;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart'
    as _i21;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS_impl.dart'
    as _i22;
import 'package:saayer/features/verify_otp/data/repositories/verify_otp_repo_impl.dart'
    as _i24;
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart'
    as _i23;
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart'
    as _i25;
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart'
    as _i27;

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
    gh.singleton<_i3.AppFlavor>(_i3.AppFlavor());
    gh.singleton<_i4.Dio>(injectableModule.dio);
    gh.singleton<_i5.Encryption>(_i5.Encryption());
    gh.singleton<_i6.LoggedInCheckerService>(_i6.LoggedInCheckerService());
    gh.singleton<_i7.LoggedInService>(_i7.LoggedInService());
    gh.singleton<_i8.NavigationService>(_i8.NavigationService());
    gh.lazySingleton<_i9.NetworkInfo>(() => _i9.NetworkInfoImpl());
    gh.singleton<_i10.SecureStorageService>(_i10.SecureStorageService());
    gh.singleton<_i11.SharedPrefService>(_i11.SharedPrefService());
    gh.lazySingleton<_i12.ApiConsumer>(
        () => _i13.DioConsumer(client: gh<_i4.Dio>()));
    gh.lazySingleton<_i14.AppInterceptors>(
        () => _i14.AppInterceptors(client: gh<_i4.Dio>()));
    gh.factory<_i15.LogInRDS>(
        () => _i16.LogInRDSImpl(apiConsumer: gh<_i12.ApiConsumer>()));
    gh.factory<_i17.LogInRepo>(
        () => _i18.LogInRepoImpl(logInRDSImpl: gh<_i15.LogInRDS>()));
    gh.factory<_i19.LogInUseCase>(
        () => _i19.LogInUseCase(logInRepoImpl: gh<_i17.LogInRepo>()));
    gh.factory<_i20.RefreshToken>(
        () => _i20.RefreshToken(apiConsumer: gh<_i12.ApiConsumer>()));
    gh.factory<_i21.VerifyOtpRDS>(
        () => _i22.VerifyOtpRDSImpl(apiConsumer: gh<_i12.ApiConsumer>()));
    gh.factory<_i23.VerifyOtpRepo>(() =>
        _i24.VerifyOtpRepoImpl(verifyOtpRDSImpl: gh<_i21.VerifyOtpRDS>()));
    gh.factory<_i25.ConfirmLogInUseCase>(() =>
        _i25.ConfirmLogInUseCase(verifyOtpRepoImpl: gh<_i23.VerifyOtpRepo>()));
    gh.factory<_i26.LogInBloc>(
        () => _i26.LogInBloc(logInUseCase: gh<_i19.LogInUseCase>()));
    gh.factory<_i27.VerifyOtpBloc>(() => _i27.VerifyOtpBloc(
          logInUseCase: gh<_i19.LogInUseCase>(),
          confirmLogInUseCase: gh<_i25.ConfirmLogInUseCase>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i28.InjectableModule {}
