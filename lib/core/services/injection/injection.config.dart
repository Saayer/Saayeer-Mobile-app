// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:saayer/core/API/api_client.dart' as _i20;
import 'package:saayer/core/API/api_consumer.dart' as _i19;
import 'package:saayer/core/API/interceptors/api_interceptors.dart' as _i21;
import 'package:saayer/core/API/refresh_token.dart' as _i31;
import 'package:saayer/core/app_config/app_flavor.dart' as _i3;
import 'package:saayer/core/network/network_info.dart' as _i12;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i8;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i9;
import 'package:saayer/core/services/injection/injectable_modules.dart' as _i41;
import 'package:saayer/core/services/local_storage/secure_storage_service.dart'
    as _i14;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i15;
import 'package:saayer/core/services/navigation/navigation_service.dart'
    as _i11;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i22;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i23;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i25;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i24;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i26;
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart'
    as _i38;
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart'
    as _i17;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart'
    as _i4;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS.dart'
    as _i27;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS_impl.dart'
    as _i28;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/repositories/personal_info_repo_impl.dart'
    as _i30;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/repositories/personal_info_repo.dart'
    as _i29;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/use_cases/submit_personal_info_usecase.dart'
    as _i32;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/bloc/personal_info_bloc.dart'
    as _i39;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart'
    as _i33;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS_impl.dart'
    as _i34;
import 'package:saayer/features/verify_otp/data/repositories/verify_otp_repo_impl.dart'
    as _i36;
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart'
    as _i35;
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart'
    as _i37;
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart'
    as _i40;
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart'
    as _i18;
import 'package:saayer/features/view_page/sub_features/ebills/presentation/bloc/ebills_bloc.dart'
    as _i6;
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
    gh.factory<_i4.BusinessInfoBloc>(() => _i4.BusinessInfoBloc());
    gh.singleton<_i5.Dio>(injectableModule.dio);
    gh.factory<_i6.EbillsBloc>(() => _i6.EbillsBloc());
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
    gh.factory<_i17.UserInfoViewPageBloc>(() => _i17.UserInfoViewPageBloc());
    gh.factory<_i18.ViewPageBloc>(() => _i18.ViewPageBloc());
    gh.lazySingleton<_i19.ApiConsumer>(
        () => _i20.DioConsumer(client: gh<_i5.Dio>()));
    gh.lazySingleton<_i21.AppInterceptors>(
        () => _i21.AppInterceptors(client: gh<_i5.Dio>()));
    gh.factory<_i22.LogInRDS>(
        () => _i23.LogInRDSImpl(apiConsumer: gh<_i19.ApiConsumer>()));
    gh.factory<_i24.LogInRepo>(
        () => _i25.LogInRepoImpl(logInRDSImpl: gh<_i22.LogInRDS>()));
    gh.factory<_i26.LogInUseCase>(
        () => _i26.LogInUseCase(logInRepoImpl: gh<_i24.LogInRepo>()));
    gh.factory<_i27.PersonalInfoRDS>(
        () => _i28.PersonalInfoRDSImpl(apiConsumer: gh<_i19.ApiConsumer>()));
    gh.factory<_i29.PersonalInfoRepo>(() => _i30.PersonalInfoRepoImpl(
        personalInfoRDSImpl: gh<_i27.PersonalInfoRDS>()));
    gh.factory<_i31.RefreshToken>(
        () => _i31.RefreshToken(apiConsumer: gh<_i19.ApiConsumer>()));
    gh.factory<_i32.SubmitPersonalInfoUseCase>(() =>
        _i32.SubmitPersonalInfoUseCase(
            personalInfoRepoImpl: gh<_i29.PersonalInfoRepo>()));
    gh.factory<_i33.VerifyOtpRDS>(
        () => _i34.VerifyOtpRDSImpl(apiConsumer: gh<_i19.ApiConsumer>()));
    gh.factory<_i35.VerifyOtpRepo>(() =>
        _i36.VerifyOtpRepoImpl(verifyOtpRDSImpl: gh<_i33.VerifyOtpRDS>()));
    gh.factory<_i37.ConfirmLogInUseCase>(() =>
        _i37.ConfirmLogInUseCase(verifyOtpRepoImpl: gh<_i35.VerifyOtpRepo>()));
    gh.factory<_i38.LogInBloc>(
        () => _i38.LogInBloc(logInUseCase: gh<_i26.LogInUseCase>()));
    gh.factory<_i39.PersonalInfoBloc>(() => _i39.PersonalInfoBloc(
        submitPersonalInfoUseCase: gh<_i32.SubmitPersonalInfoUseCase>()));
    gh.factory<_i40.VerifyOtpBloc>(() => _i40.VerifyOtpBloc(
          logInUseCase: gh<_i26.LogInUseCase>(),
          confirmLogInUseCase: gh<_i37.ConfirmLogInUseCase>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i41.InjectableModule {}
