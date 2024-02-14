// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:saayer/core/API/api_client.dart' as _i27;
import 'package:saayer/core/API/api_consumer.dart' as _i26;
import 'package:saayer/core/API/interceptors/api_interceptors.dart' as _i28;
import 'package:saayer/core/API/refresh_token.dart' as _i42;
import 'package:saayer/core/app_config/app_flavor.dart' as _i4;
import 'package:saayer/core/network/network_info.dart' as _i15;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i11;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i12;
import 'package:saayer/core/services/injection/injectable_modules.dart' as _i66;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i20;
import 'package:saayer/core/services/navigation/navigation_service.dart'
    as _i14;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i33;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i34;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i36;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i35;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i37;
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart'
    as _i61;
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart'
    as _i3;
import 'package:saayer/features/more_sub_features/contact_us/presentation/bloc/contact_us_bloc.dart'
    as _i6;
import 'package:saayer/features/more_sub_features/help/presentation/bloc/help_bloc.dart'
    as _i8;
import 'package:saayer/features/more_sub_features/settings/presentation/bloc/settings_bloc.dart'
    as _i19;
import 'package:saayer/features/more_sub_features/shipping_rates/presentation/bloc/shipping_rates_bloc.dart'
    as _i22;
import 'package:saayer/features/more_sub_features/why_saayer/presentation/bloc/why_saayer_bloc.dart'
    as _i25;
import 'package:saayer/features/profile_sub_features/bills/presentation/bloc/bills_bloc.dart'
    as _i5;
import 'package:saayer/features/profile_sub_features/info/presentation/bloc/info_bloc.dart'
    as _i10;
import 'package:saayer/features/profile_sub_features/reports/presentation/bloc/reports_bloc.dart'
    as _i17;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS.dart'
    as _i50;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS_impl.dart'
    as _i51;
import 'package:saayer/features/user_card/data/repositories/user_card_repo_impl.dart'
    as _i53;
import 'package:saayer/features/user_card/domain/repositories/user_card_repo.dart'
    as _i52;
import 'package:saayer/features/user_card/domain/use_cases/user_card_usecase.dart'
    as _i54;
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart'
    as _i64;
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart'
    as _i23;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS.dart'
    as _i29;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS_impl.dart'
    as _i30;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/repositories/business_info_repo_impl.dart'
    as _i32;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/repositories/business_info_repo.dart'
    as _i31;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/use_cases/submit_business_info_usecase.dart'
    as _i47;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart'
    as _i59;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS.dart'
    as _i38;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS_impl.dart'
    as _i39;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/repositories/personal_info_repo_impl.dart'
    as _i41;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/repositories/personal_info_repo.dart'
    as _i40;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/use_cases/submit_personal_info_usecase.dart'
    as _i48;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/bloc/personal_info_bloc.dart'
    as _i62;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS.dart'
    as _i43;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS_impl.dart'
    as _i44;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/repositories/store_info_repo_impl.dart'
    as _i46;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/repositories/store_info_repo.dart'
    as _i45;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/use_cases/submit_store_info_usecase.dart'
    as _i49;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/presentation/bloc/store_info_bloc.dart'
    as _i63;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart'
    as _i55;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS_impl.dart'
    as _i56;
import 'package:saayer/features/verify_otp/data/repositories/verify_otp_repo_impl.dart'
    as _i58;
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart'
    as _i57;
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart'
    as _i60;
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart'
    as _i65;
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart'
    as _i24;
import 'package:saayer/features/view_page/sub_features/home/presentation/bloc/home_bloc.dart'
    as _i9;
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart'
    as _i13;
import 'package:saayer/features/view_page/sub_features/profile/presentation/bloc/profile_bloc.dart'
    as _i16;
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart'
    as _i18;
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart'
    as _i21;

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
    gh.factory<_i3.AddressesBookBloc>(() => _i3.AddressesBookBloc());
    gh.singleton<_i4.AppFlavor>(_i4.AppFlavor());
    gh.factory<_i5.BillsBloc>(() => _i5.BillsBloc());
    gh.factory<_i6.ContactUsBloc>(() => _i6.ContactUsBloc());
    gh.singleton<_i7.Dio>(injectableModule.dio);
    gh.factory<_i8.HelpBloc>(() => _i8.HelpBloc());
    gh.factory<_i9.HomeBloc>(() => _i9.HomeBloc());
    gh.factory<_i10.InfoBloc>(() => _i10.InfoBloc());
    gh.factory<_i11.LoggedInCheckerService>(
        () => _i11.LoggedInCheckerService());
    gh.singleton<_i12.LoggedInService>(_i12.LoggedInService());
    gh.factory<_i13.MoreBloc>(() => _i13.MoreBloc());
    gh.singleton<_i14.NavigationService>(_i14.NavigationService());
    gh.lazySingleton<_i15.NetworkInfo>(() => _i15.NetworkInfoImpl());
    gh.factory<_i16.ProfileBloc>(() => _i16.ProfileBloc());
    gh.factory<_i17.ReportsBloc>(() => _i17.ReportsBloc());
    gh.factory<_i18.RequestShipmentBloc>(() => _i18.RequestShipmentBloc());
    gh.factory<_i19.SettingsBloc>(() => _i19.SettingsBloc());
    gh.singleton<_i20.SharedPrefService>(_i20.SharedPrefService());
    gh.factory<_i21.ShipmentsBloc>(() => _i21.ShipmentsBloc());
    gh.factory<_i22.ShippingRatesBloc>(() => _i22.ShippingRatesBloc());
    gh.factory<_i23.UserInfoViewPageBloc>(() => _i23.UserInfoViewPageBloc());
    gh.factory<_i24.ViewPageBloc>(() => _i24.ViewPageBloc());
    gh.factory<_i25.WhySaayerBloc>(() => _i25.WhySaayerBloc());
    gh.lazySingleton<_i26.ApiConsumer>(
        () => _i27.DioConsumer(client: gh<_i7.Dio>()));
    gh.lazySingleton<_i28.AppInterceptors>(
        () => _i28.AppInterceptors(client: gh<_i7.Dio>()));
    gh.factory<_i29.BusinessInfoRDS>(
        () => _i30.BusinessInfoRDSImpl(apiConsumer: gh<_i26.ApiConsumer>()));
    gh.factory<_i31.BusinessInfoRepo>(() => _i32.BusinessInfoRepoImpl(
        businessInfoRDSImpl: gh<_i29.BusinessInfoRDS>()));
    gh.factory<_i33.LogInRDS>(
        () => _i34.LogInRDSImpl(apiConsumer: gh<_i26.ApiConsumer>()));
    gh.factory<_i35.LogInRepo>(
        () => _i36.LogInRepoImpl(logInRDSImpl: gh<_i33.LogInRDS>()));
    gh.factory<_i37.LogInUseCase>(
        () => _i37.LogInUseCase(logInRepoImpl: gh<_i35.LogInRepo>()));
    gh.factory<_i38.PersonalInfoRDS>(
        () => _i39.PersonalInfoRDSImpl(apiConsumer: gh<_i26.ApiConsumer>()));
    gh.factory<_i40.PersonalInfoRepo>(() => _i41.PersonalInfoRepoImpl(
        personalInfoRDSImpl: gh<_i38.PersonalInfoRDS>()));
    gh.factory<_i42.RefreshToken>(
        () => _i42.RefreshToken(apiConsumer: gh<_i26.ApiConsumer>()));
    gh.factory<_i43.StoreInfoRDS>(
        () => _i44.StoreInfoRDSImpl(apiConsumer: gh<_i26.ApiConsumer>()));
    gh.factory<_i45.StoreInfoRepo>(() =>
        _i46.StoreInfoRepoImpl(storeInfoRDSImpl: gh<_i43.StoreInfoRDS>()));
    gh.factory<_i47.SubmitBusinessInfoUseCase>(() =>
        _i47.SubmitBusinessInfoUseCase(
            businessInfoRepoImpl: gh<_i31.BusinessInfoRepo>()));
    gh.factory<_i48.SubmitPersonalInfoUseCase>(() =>
        _i48.SubmitPersonalInfoUseCase(
            personalInfoRepoImpl: gh<_i40.PersonalInfoRepo>()));
    gh.factory<_i49.SubmitStoreInfoUseCase>(() => _i49.SubmitStoreInfoUseCase(
        storeInfoRepoImpl: gh<_i45.StoreInfoRepo>()));
    gh.factory<_i50.UserCardRDS>(
        () => _i51.UserCardRDSImpl(apiConsumer: gh<_i26.ApiConsumer>()));
    gh.factory<_i52.UserCardRepo>(
        () => _i53.UserCardRepoImpl(userCardRDSImpl: gh<_i50.UserCardRDS>()));
    gh.factory<_i54.UserCardUseCase>(
        () => _i54.UserCardUseCase(userCardRepoImpl: gh<_i52.UserCardRepo>()));
    gh.factory<_i55.VerifyOtpRDS>(
        () => _i56.VerifyOtpRDSImpl(apiConsumer: gh<_i26.ApiConsumer>()));
    gh.factory<_i57.VerifyOtpRepo>(() =>
        _i58.VerifyOtpRepoImpl(verifyOtpRDSImpl: gh<_i55.VerifyOtpRDS>()));
    gh.factory<_i59.BusinessInfoBloc>(() => _i59.BusinessInfoBloc(
        submitBusinessInfoUseCase: gh<_i47.SubmitBusinessInfoUseCase>()));
    gh.factory<_i60.ConfirmLogInUseCase>(() =>
        _i60.ConfirmLogInUseCase(verifyOtpRepoImpl: gh<_i57.VerifyOtpRepo>()));
    gh.factory<_i61.LogInBloc>(
        () => _i61.LogInBloc(logInUseCase: gh<_i37.LogInUseCase>()));
    gh.factory<_i62.PersonalInfoBloc>(() => _i62.PersonalInfoBloc(
        submitPersonalInfoUseCase: gh<_i48.SubmitPersonalInfoUseCase>()));
    gh.factory<_i63.StoreInfoBloc>(() => _i63.StoreInfoBloc(
        submitStoreInfoUseCase: gh<_i49.SubmitStoreInfoUseCase>()));
    gh.factory<_i64.UserCardBloc>(
        () => _i64.UserCardBloc(userCardUseCase: gh<_i54.UserCardUseCase>()));
    gh.factory<_i65.VerifyOtpBloc>(() => _i65.VerifyOtpBloc(
          logInUseCase: gh<_i37.LogInUseCase>(),
          confirmLogInUseCase: gh<_i60.ConfirmLogInUseCase>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i66.InjectableModule {}
