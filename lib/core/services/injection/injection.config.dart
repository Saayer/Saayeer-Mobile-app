// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:saayer/core/API/api_client.dart' as _i22;
import 'package:saayer/core/API/api_consumer.dart' as _i21;
import 'package:saayer/core/API/interceptors/api_interceptors.dart' as _i23;
import 'package:saayer/core/API/refresh_token.dart' as _i37;
import 'package:saayer/core/app_config/app_flavor.dart' as _i4;
import 'package:saayer/core/network/network_info.dart' as _i13;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i9;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i10;
import 'package:saayer/core/services/injection/injectable_modules.dart' as _i61;
import 'package:saayer/core/services/local_storage/secure_storage_service.dart'
    as _i16;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i17;
import 'package:saayer/core/services/navigation/navigation_service.dart'
    as _i12;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i28;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i29;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i31;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i30;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i32;
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart'
    as _i56;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS.dart'
    as _i45;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS_impl.dart'
    as _i46;
import 'package:saayer/features/user_card/data/repositories/user_card_repo_impl.dart'
    as _i48;
import 'package:saayer/features/user_card/domain/repositories/user_card_repo.dart'
    as _i47;
import 'package:saayer/features/user_card/domain/use_cases/user_card_usecase.dart'
    as _i49;
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart'
    as _i59;
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart'
    as _i19;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS.dart'
    as _i24;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS_impl.dart'
    as _i25;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/repositories/business_info_repo_impl.dart'
    as _i27;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/repositories/business_info_repo.dart'
    as _i26;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/use_cases/submit_business_info_usecase.dart'
    as _i42;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart'
    as _i54;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS.dart'
    as _i33;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS_impl.dart'
    as _i34;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/repositories/personal_info_repo_impl.dart'
    as _i36;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/repositories/personal_info_repo.dart'
    as _i35;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/use_cases/submit_personal_info_usecase.dart'
    as _i43;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/bloc/personal_info_bloc.dart'
    as _i57;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS.dart'
    as _i38;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS_impl.dart'
    as _i39;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/repositories/store_info_repo_impl.dart'
    as _i41;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/repositories/store_info_repo.dart'
    as _i40;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/use_cases/submit_store_info_usecase.dart'
    as _i44;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/presentation/bloc/store_info_bloc.dart'
    as _i58;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart'
    as _i50;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS_impl.dart'
    as _i51;
import 'package:saayer/features/verify_otp/data/repositories/verify_otp_repo_impl.dart'
    as _i53;
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart'
    as _i52;
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart'
    as _i55;
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart'
    as _i60;
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart'
    as _i20;
import 'package:saayer/features/view_page/sub_features/home/presentation/bloc/home_bloc.dart'
    as _i7;
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart'
    as _i11;
import 'package:saayer/features/view_page/sub_features/profile/presentation/bloc/profile_bloc.dart'
    as _i14;
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart'
    as _i15;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/presentation/bloc/address_shipment_bloc.dart'
    as _i3;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipment_information/presentation/bloc/information_shipment_bloc.dart'
    as _i8;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipments_cariers_selection/presentation/bloc/carriers_shipment_bloc.dart'
    as _i5;
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart'
    as _i18;

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
    gh.factory<_i3.AddressShipmentBloc>(() => _i3.AddressShipmentBloc());
    gh.singleton<_i4.AppFlavor>(_i4.AppFlavor());
    gh.factory<_i5.CarriersShipmentBloc>(() => _i5.CarriersShipmentBloc());
    gh.singleton<_i6.Dio>(injectableModule.dio);
    gh.factory<_i7.HomeBloc>(() => _i7.HomeBloc());
    gh.factory<_i8.InformationShipmentBloc>(
        () => _i8.InformationShipmentBloc());
    gh.factory<_i9.LoggedInCheckerService>(() => _i9.LoggedInCheckerService());
    gh.singleton<_i10.LoggedInService>(_i10.LoggedInService());
    gh.factory<_i11.MoreBloc>(() => _i11.MoreBloc());
    gh.singleton<_i12.NavigationService>(_i12.NavigationService());
    gh.lazySingleton<_i13.NetworkInfo>(() => _i13.NetworkInfoImpl());
    gh.factory<_i14.ProfileBloc>(() => _i14.ProfileBloc());
    gh.factory<_i15.RequestShipmentBloc>(() => _i15.RequestShipmentBloc());
    gh.singleton<_i16.SecureStorageService>(_i16.SecureStorageService());
    gh.singleton<_i17.SharedPrefService>(_i17.SharedPrefService());
    gh.factory<_i18.ShipmentsBloc>(() => _i18.ShipmentsBloc());
    gh.factory<_i19.UserInfoViewPageBloc>(() => _i19.UserInfoViewPageBloc());
    gh.factory<_i20.ViewPageBloc>(() => _i20.ViewPageBloc());
    gh.lazySingleton<_i21.ApiConsumer>(
        () => _i22.DioConsumer(client: gh<_i6.Dio>()));
    gh.lazySingleton<_i23.AppInterceptors>(
        () => _i23.AppInterceptors(client: gh<_i6.Dio>()));
    gh.factory<_i24.BusinessInfoRDS>(
        () => _i25.BusinessInfoRDSImpl(apiConsumer: gh<_i21.ApiConsumer>()));
    gh.factory<_i26.BusinessInfoRepo>(() => _i27.BusinessInfoRepoImpl(
        businessInfoRDSImpl: gh<_i24.BusinessInfoRDS>()));
    gh.factory<_i28.LogInRDS>(
        () => _i29.LogInRDSImpl(apiConsumer: gh<_i21.ApiConsumer>()));
    gh.factory<_i30.LogInRepo>(
        () => _i31.LogInRepoImpl(logInRDSImpl: gh<_i28.LogInRDS>()));
    gh.factory<_i32.LogInUseCase>(
        () => _i32.LogInUseCase(logInRepoImpl: gh<_i30.LogInRepo>()));
    gh.factory<_i33.PersonalInfoRDS>(
        () => _i34.PersonalInfoRDSImpl(apiConsumer: gh<_i21.ApiConsumer>()));
    gh.factory<_i35.PersonalInfoRepo>(() => _i36.PersonalInfoRepoImpl(
        personalInfoRDSImpl: gh<_i33.PersonalInfoRDS>()));
    gh.factory<_i37.RefreshToken>(
        () => _i37.RefreshToken(apiConsumer: gh<_i21.ApiConsumer>()));
    gh.factory<_i38.StoreInfoRDS>(
        () => _i39.StoreInfoRDSImpl(apiConsumer: gh<_i21.ApiConsumer>()));
    gh.factory<_i40.StoreInfoRepo>(() =>
        _i41.StoreInfoRepoImpl(storeInfoRDSImpl: gh<_i38.StoreInfoRDS>()));
    gh.factory<_i42.SubmitBusinessInfoUseCase>(() =>
        _i42.SubmitBusinessInfoUseCase(
            businessInfoRepoImpl: gh<_i26.BusinessInfoRepo>()));
    gh.factory<_i43.SubmitPersonalInfoUseCase>(() =>
        _i43.SubmitPersonalInfoUseCase(
            personalInfoRepoImpl: gh<_i35.PersonalInfoRepo>()));
    gh.factory<_i44.SubmitStoreInfoUseCase>(() => _i44.SubmitStoreInfoUseCase(
        storeInfoRepoImpl: gh<_i40.StoreInfoRepo>()));
    gh.factory<_i45.UserCardRDS>(
        () => _i46.UserCardRDSImpl(apiConsumer: gh<_i21.ApiConsumer>()));
    gh.factory<_i47.UserCardRepo>(
        () => _i48.UserCardRepoImpl(userCardRDSImpl: gh<_i45.UserCardRDS>()));
    gh.factory<_i49.UserCardUseCase>(
        () => _i49.UserCardUseCase(userCardRepoImpl: gh<_i47.UserCardRepo>()));
    gh.factory<_i50.VerifyOtpRDS>(
        () => _i51.VerifyOtpRDSImpl(apiConsumer: gh<_i21.ApiConsumer>()));
    gh.factory<_i52.VerifyOtpRepo>(() =>
        _i53.VerifyOtpRepoImpl(verifyOtpRDSImpl: gh<_i50.VerifyOtpRDS>()));
    gh.factory<_i54.BusinessInfoBloc>(() => _i54.BusinessInfoBloc(
        submitBusinessInfoUseCase: gh<_i42.SubmitBusinessInfoUseCase>()));
    gh.factory<_i55.ConfirmLogInUseCase>(() =>
        _i55.ConfirmLogInUseCase(verifyOtpRepoImpl: gh<_i52.VerifyOtpRepo>()));
    gh.factory<_i56.LogInBloc>(
        () => _i56.LogInBloc(logInUseCase: gh<_i32.LogInUseCase>()));
    gh.factory<_i57.PersonalInfoBloc>(() => _i57.PersonalInfoBloc(
        submitPersonalInfoUseCase: gh<_i43.SubmitPersonalInfoUseCase>()));
    gh.factory<_i58.StoreInfoBloc>(() => _i58.StoreInfoBloc(
        submitStoreInfoUseCase: gh<_i44.SubmitStoreInfoUseCase>()));
    gh.factory<_i59.UserCardBloc>(
        () => _i59.UserCardBloc(userCardUseCase: gh<_i49.UserCardUseCase>()));
    gh.factory<_i60.VerifyOtpBloc>(() => _i60.VerifyOtpBloc(
          logInUseCase: gh<_i32.LogInUseCase>(),
          confirmLogInUseCase: gh<_i55.ConfirmLogInUseCase>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i61.InjectableModule {}
