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
import 'package:saayer/core/API/refresh_token.dart' as _i34;
import 'package:saayer/core/app_config/app_flavor.dart' as _i3;
import 'package:saayer/core/network/network_info.dart' as _i11;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i7;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i8;
import 'package:saayer/core/services/injection/injectable_modules.dart' as _i46;
import 'package:saayer/core/services/local_storage/secure_storage_service.dart'
    as _i13;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i14;
import 'package:saayer/core/services/navigation/navigation_service.dart'
    as _i10;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i25;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i26;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i28;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i27;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i29;
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart'
    as _i43;
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart'
    as _i16;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS.dart'
    as _i21;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS_impl.dart'
    as _i22;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/repositories/business_info_repo_impl.dart'
    as _i24;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/repositories/business_info_repo.dart'
    as _i23;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/use_cases/submit_business_info_usecase.dart'
    as _i35;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart'
    as _i41;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS.dart'
    as _i30;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS_impl.dart'
    as _i31;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/repositories/personal_info_repo_impl.dart'
    as _i33;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/repositories/personal_info_repo.dart'
    as _i32;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/use_cases/submit_personal_info_usecase.dart'
    as _i36;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/bloc/personal_info_bloc.dart'
    as _i44;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart'
    as _i37;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS_impl.dart'
    as _i38;
import 'package:saayer/features/verify_otp/data/repositories/verify_otp_repo_impl.dart'
    as _i40;
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart'
    as _i39;
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart'
    as _i42;
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart'
    as _i45;
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart'
    as _i17;
import 'package:saayer/features/view_page/sub_features/ebills/presentation/bloc/ebills_bloc.dart'
    as _i5;
import 'package:saayer/features/view_page/sub_features/home/presentation/bloc/home_bloc.dart'
    as _i6;
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart'
    as _i9;
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart'
    as _i12;
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart'
    as _i15;

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
    gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc());
    gh.singleton<_i7.LoggedInCheckerService>(_i7.LoggedInCheckerService());
    gh.singleton<_i8.LoggedInService>(_i8.LoggedInService());
    gh.factory<_i9.MoreBloc>(() => _i9.MoreBloc());
    gh.singleton<_i10.NavigationService>(_i10.NavigationService());
    gh.lazySingleton<_i11.NetworkInfo>(() => _i11.NetworkInfoImpl());
    gh.factory<_i12.RequestShipmentBloc>(() => _i12.RequestShipmentBloc());
    gh.singleton<_i13.SecureStorageService>(_i13.SecureStorageService());
    gh.singleton<_i14.SharedPrefService>(_i14.SharedPrefService());
    gh.factory<_i15.ShipmentsBloc>(() => _i15.ShipmentsBloc());
    gh.factory<_i16.UserInfoViewPageBloc>(() => _i16.UserInfoViewPageBloc());
    gh.factory<_i17.ViewPageBloc>(() => _i17.ViewPageBloc());
    gh.lazySingleton<_i18.ApiConsumer>(
        () => _i19.DioConsumer(client: gh<_i4.Dio>()));
    gh.lazySingleton<_i20.AppInterceptors>(
        () => _i20.AppInterceptors(client: gh<_i4.Dio>()));
    gh.factory<_i21.BusinessInfoRDS>(
        () => _i22.BusinessInfoRDSImpl(apiConsumer: gh<_i18.ApiConsumer>()));
    gh.factory<_i23.BusinessInfoRepo>(() => _i24.BusinessInfoRepoImpl(
        businessInfoRDSImpl: gh<_i21.BusinessInfoRDS>()));
    gh.factory<_i25.LogInRDS>(
        () => _i26.LogInRDSImpl(apiConsumer: gh<_i18.ApiConsumer>()));
    gh.factory<_i27.LogInRepo>(
        () => _i28.LogInRepoImpl(logInRDSImpl: gh<_i25.LogInRDS>()));
    gh.factory<_i29.LogInUseCase>(
        () => _i29.LogInUseCase(logInRepoImpl: gh<_i27.LogInRepo>()));
    gh.factory<_i30.PersonalInfoRDS>(
        () => _i31.PersonalInfoRDSImpl(apiConsumer: gh<_i18.ApiConsumer>()));
    gh.factory<_i32.PersonalInfoRepo>(() => _i33.PersonalInfoRepoImpl(
        personalInfoRDSImpl: gh<_i30.PersonalInfoRDS>()));
    gh.factory<_i34.RefreshToken>(
        () => _i34.RefreshToken(apiConsumer: gh<_i18.ApiConsumer>()));
    gh.factory<_i35.SubmitBusinessInfoUseCase>(() =>
        _i35.SubmitBusinessInfoUseCase(
            businessInfoRepoImpl: gh<_i23.BusinessInfoRepo>()));
    gh.factory<_i36.SubmitPersonalInfoUseCase>(() =>
        _i36.SubmitPersonalInfoUseCase(
            personalInfoRepoImpl: gh<_i32.PersonalInfoRepo>()));
    gh.factory<_i37.VerifyOtpRDS>(
        () => _i38.VerifyOtpRDSImpl(apiConsumer: gh<_i18.ApiConsumer>()));
    gh.factory<_i39.VerifyOtpRepo>(() =>
        _i40.VerifyOtpRepoImpl(verifyOtpRDSImpl: gh<_i37.VerifyOtpRDS>()));
    gh.factory<_i41.BusinessInfoBloc>(() => _i41.BusinessInfoBloc(
        submitBusinessInfoUseCase: gh<_i35.SubmitBusinessInfoUseCase>()));
    gh.factory<_i42.ConfirmLogInUseCase>(() =>
        _i42.ConfirmLogInUseCase(verifyOtpRepoImpl: gh<_i39.VerifyOtpRepo>()));
    gh.factory<_i43.LogInBloc>(
        () => _i43.LogInBloc(logInUseCase: gh<_i29.LogInUseCase>()));
    gh.factory<_i44.PersonalInfoBloc>(() => _i44.PersonalInfoBloc(
        submitPersonalInfoUseCase: gh<_i36.SubmitPersonalInfoUseCase>()));
    gh.factory<_i45.VerifyOtpBloc>(() => _i45.VerifyOtpBloc(
          logInUseCase: gh<_i29.LogInUseCase>(),
          confirmLogInUseCase: gh<_i42.ConfirmLogInUseCase>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i46.InjectableModule {}
