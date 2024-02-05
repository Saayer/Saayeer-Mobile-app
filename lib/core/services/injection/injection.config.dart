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
import 'package:saayer/core/API/api_client.dart' as _i19;
import 'package:saayer/core/API/api_consumer.dart' as _i18;
import 'package:saayer/core/API/interceptors/api_interceptors.dart' as _i20;
import 'package:saayer/core/API/refresh_token.dart' as _i26;
import 'package:saayer/core/app_config/app_flavor.dart' as _i3;
import 'package:saayer/core/network/network_info.dart' as _i12;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i8;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i9;
import 'package:saayer/core/services/encryption/encryption.dart' as _i6;
import 'package:saayer/core/services/injection/injectable_modules.dart' as _i34;
import 'package:saayer/core/services/local_storage/secure_storage_service.dart'
    as _i14;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i15;
import 'package:saayer/core/services/navigation/navigation_service.dart'
    as _i11;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i21;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i22;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i24;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i23;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i25;
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart'
    as _i32;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart'
    as _i27;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS_impl.dart'
    as _i28;
import 'package:saayer/features/verify_otp/data/repositories/verify_otp_repo_impl.dart'
    as _i30;
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart'
    as _i29;
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart'
    as _i31;
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart'
    as _i33;
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart'
    as _i17;
import 'package:saayer/features/view_page/sub_features/ebills/presentation/bloc/ebills_bloc.dart'
    as _i5;
import 'package:saayer/features/view_page/sub_features/home/presentation/bloc/home_bloc.dart'
    as _i7;
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart'
    as _i10;
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart'
    as _i13;
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart'
    as _i16;

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
    gh.factory<_i5.EbillsBloc>(() => _i5.EbillsBloc());
    gh.singleton<_i6.Encryption>(_i6.Encryption());
    gh.factory<_i7.HomeBloc>(() => _i7.HomeBloc());
    gh.singleton<_i8.LoggedInCheckerService>(_i8.LoggedInCheckerService());
    gh.singleton<_i9.LoggedInService>(_i9.LoggedInService());
    gh.factory<_i10.MoreBloc>(() => _i10.MoreBloc());
    gh.singleton<_i11.NavigationService>(_i11.NavigationService());
    gh.lazySingleton<_i12.NetworkInfo>(() => _i12.NetworkInfoImpl());
    gh.factory<_i13.RequestShipmentBloc>(() => _i13.RequestShipmentBloc());
    gh.singleton<_i14.SecureStorageService>(_i14.SecureStorageService());
    gh.singleton<_i15.SharedPrefService>(_i15.SharedPrefService());
    gh.factory<_i16.ShipmentsBloc>(() => _i16.ShipmentsBloc());
    gh.factory<_i17.ViewPageBloc>(() => _i17.ViewPageBloc());
    gh.lazySingleton<_i18.ApiConsumer>(
        () => _i19.DioConsumer(client: gh<_i4.Dio>()));
    gh.lazySingleton<_i20.AppInterceptors>(
        () => _i20.AppInterceptors(client: gh<_i4.Dio>()));
    gh.factory<_i21.LogInRDS>(
        () => _i22.LogInRDSImpl(apiConsumer: gh<_i18.ApiConsumer>()));
    gh.factory<_i23.LogInRepo>(
        () => _i24.LogInRepoImpl(logInRDSImpl: gh<_i21.LogInRDS>()));
    gh.factory<_i25.LogInUseCase>(
        () => _i25.LogInUseCase(logInRepoImpl: gh<_i23.LogInRepo>()));
    gh.factory<_i26.RefreshToken>(
        () => _i26.RefreshToken(apiConsumer: gh<_i18.ApiConsumer>()));
    gh.factory<_i27.VerifyOtpRDS>(
        () => _i28.VerifyOtpRDSImpl(apiConsumer: gh<_i18.ApiConsumer>()));
    gh.factory<_i29.VerifyOtpRepo>(() =>
        _i30.VerifyOtpRepoImpl(verifyOtpRDSImpl: gh<_i27.VerifyOtpRDS>()));
    gh.factory<_i31.ConfirmLogInUseCase>(() =>
        _i31.ConfirmLogInUseCase(verifyOtpRepoImpl: gh<_i29.VerifyOtpRepo>()));
    gh.factory<_i32.LogInBloc>(
        () => _i32.LogInBloc(logInUseCase: gh<_i25.LogInUseCase>()));
    gh.factory<_i33.VerifyOtpBloc>(() => _i33.VerifyOtpBloc(
          logInUseCase: gh<_i25.LogInUseCase>(),
          confirmLogInUseCase: gh<_i31.ConfirmLogInUseCase>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i34.InjectableModule {}
