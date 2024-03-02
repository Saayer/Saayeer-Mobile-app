// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:saayer/core/API/api_client.dart' as _i30;
import 'package:saayer/core/API/api_consumer.dart' as _i29;
import 'package:saayer/core/API/interceptors/api_interceptors.dart' as _i31;
import 'package:saayer/core/API/refresh_token.dart' as _i45;
import 'package:saayer/core/app_config/app_flavor.dart' as _i5;
import 'package:saayer/core/network/network_info.dart' as _i18;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i14;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i15;
import 'package:saayer/core/services/injection/injectable_modules.dart' as _i69;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i23;
import 'package:saayer/core/services/navigation/navigation_service.dart'
    as _i17;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i36;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i37;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i39;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i38;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i40;
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart'
    as _i64;
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart'
    as _i4;
import 'package:saayer/features/more_sub_features/contact_us/presentation/bloc/contact_us_bloc.dart'
    as _i8;
import 'package:saayer/features/more_sub_features/help/presentation/bloc/help_bloc.dart'
    as _i10;
import 'package:saayer/features/more_sub_features/settings/presentation/bloc/settings_bloc.dart'
    as _i22;
import 'package:saayer/features/more_sub_features/shipping_rates/presentation/bloc/shipping_rates_bloc.dart'
    as _i25;
import 'package:saayer/features/more_sub_features/why_saayer/presentation/bloc/why_saayer_bloc.dart'
    as _i28;
import 'package:saayer/features/profile_sub_features/bills/presentation/bloc/bills_bloc.dart'
    as _i6;
import 'package:saayer/features/profile_sub_features/info/presentation/bloc/info_bloc.dart'
    as _i12;
import 'package:saayer/features/profile_sub_features/reports/presentation/bloc/reports_bloc.dart'
    as _i20;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS.dart'
    as _i53;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS_impl.dart'
    as _i54;
import 'package:saayer/features/user_card/data/repositories/user_card_repo_impl.dart'
    as _i56;
import 'package:saayer/features/user_card/domain/repositories/user_card_repo.dart'
    as _i55;
import 'package:saayer/features/user_card/domain/use_cases/user_card_usecase.dart'
    as _i57;
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart'
    as _i67;
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart'
    as _i26;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS.dart'
    as _i32;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS_impl.dart'
    as _i33;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/repositories/business_info_repo_impl.dart'
    as _i35;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/repositories/business_info_repo.dart'
    as _i34;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/use_cases/submit_business_info_usecase.dart'
    as _i50;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart'
    as _i62;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS.dart'
    as _i41;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS_impl.dart'
    as _i42;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/repositories/personal_info_repo_impl.dart'
    as _i44;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/repositories/personal_info_repo.dart'
    as _i43;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/use_cases/submit_personal_info_usecase.dart'
    as _i51;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/bloc/personal_info_bloc.dart'
    as _i65;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS.dart'
    as _i46;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS_impl.dart'
    as _i47;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/repositories/store_info_repo_impl.dart'
    as _i49;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/repositories/store_info_repo.dart'
    as _i48;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/use_cases/submit_store_info_usecase.dart'
    as _i52;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/presentation/bloc/store_info_bloc.dart'
    as _i66;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart'
    as _i58;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS_impl.dart'
    as _i59;
import 'package:saayer/features/verify_otp/data/repositories/verify_otp_repo_impl.dart'
    as _i61;
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart'
    as _i60;
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart'
    as _i63;
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart'
    as _i68;
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart'
    as _i27;
import 'package:saayer/features/view_page/sub_features/home/presentation/bloc/home_bloc.dart'
    as _i11;
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart'
    as _i16;
import 'package:saayer/features/view_page/sub_features/profile/presentation/bloc/profile_bloc.dart'
    as _i19;
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart'
    as _i21;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/presentation/bloc/address_shipment_bloc.dart'
    as _i3;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipment_information/presentation/bloc/information_shipment_bloc.dart'
    as _i13;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipments_cariers_selection/presentation/bloc/carriers_shipment_bloc.dart'
    as _i7;
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart'
    as _i24;

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
    gh.factory<_i4.AddressesBookBloc>(() => _i4.AddressesBookBloc());
    gh.singleton<_i5.AppFlavor>(_i5.AppFlavor());
    gh.factory<_i6.BillsBloc>(() => _i6.BillsBloc());
    gh.factory<_i7.CarriersShipmentBloc>(() => _i7.CarriersShipmentBloc());
    gh.factory<_i8.ContactUsBloc>(() => _i8.ContactUsBloc());
    gh.singleton<_i9.Dio>(injectableModule.dio);
    gh.factory<_i10.HelpBloc>(() => _i10.HelpBloc());
    gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc());
    gh.factory<_i12.InfoBloc>(() => _i12.InfoBloc());
    gh.factory<_i13.InformationShipmentBloc>(
        () => _i13.InformationShipmentBloc());
    gh.factory<_i14.LoggedInCheckerService>(
        () => _i14.LoggedInCheckerService());
    gh.singleton<_i15.LoggedInService>(_i15.LoggedInService());
    gh.factory<_i16.MoreBloc>(() => _i16.MoreBloc());
    gh.singleton<_i17.NavigationService>(_i17.NavigationService());
    gh.lazySingleton<_i18.NetworkInfo>(() => _i18.NetworkInfoImpl());
    gh.factory<_i19.ProfileBloc>(() => _i19.ProfileBloc());
    gh.factory<_i20.ReportsBloc>(() => _i20.ReportsBloc());
    gh.factory<_i21.RequestShipmentBloc>(() => _i21.RequestShipmentBloc());
    gh.factory<_i22.SettingsBloc>(() => _i22.SettingsBloc());
    gh.singleton<_i23.SharedPrefService>(_i23.SharedPrefService());
    gh.factory<_i24.ShipmentsBloc>(() => _i24.ShipmentsBloc());
    gh.factory<_i25.ShippingRatesBloc>(() => _i25.ShippingRatesBloc());
    gh.factory<_i26.UserInfoViewPageBloc>(() => _i26.UserInfoViewPageBloc());
    gh.factory<_i27.ViewPageBloc>(() => _i27.ViewPageBloc());
    gh.factory<_i28.WhySaayerBloc>(() => _i28.WhySaayerBloc());
    gh.lazySingleton<_i29.ApiConsumer>(
        () => _i30.DioConsumer(client: gh<_i9.Dio>()));
    gh.lazySingleton<_i31.AppInterceptors>(
        () => _i31.AppInterceptors(client: gh<_i9.Dio>()));
    gh.factory<_i32.BusinessInfoRDS>(
        () => _i33.BusinessInfoRDSImpl(apiConsumer: gh<_i29.ApiConsumer>()));
    gh.factory<_i34.BusinessInfoRepo>(() => _i35.BusinessInfoRepoImpl(
        businessInfoRDSImpl: gh<_i32.BusinessInfoRDS>()));
    gh.factory<_i36.LogInRDS>(
        () => _i37.LogInRDSImpl(apiConsumer: gh<_i29.ApiConsumer>()));
    gh.factory<_i38.LogInRepo>(
        () => _i39.LogInRepoImpl(logInRDSImpl: gh<_i36.LogInRDS>()));
    gh.factory<_i40.LogInUseCase>(
        () => _i40.LogInUseCase(logInRepoImpl: gh<_i38.LogInRepo>()));
    gh.factory<_i41.PersonalInfoRDS>(
        () => _i42.PersonalInfoRDSImpl(apiConsumer: gh<_i29.ApiConsumer>()));
    gh.factory<_i43.PersonalInfoRepo>(() => _i44.PersonalInfoRepoImpl(
        personalInfoRDSImpl: gh<_i41.PersonalInfoRDS>()));
    gh.factory<_i45.RefreshToken>(
        () => _i45.RefreshToken(apiConsumer: gh<_i29.ApiConsumer>()));
    gh.factory<_i46.StoreInfoRDS>(
        () => _i47.StoreInfoRDSImpl(apiConsumer: gh<_i29.ApiConsumer>()));
    gh.factory<_i48.StoreInfoRepo>(() =>
        _i49.StoreInfoRepoImpl(storeInfoRDSImpl: gh<_i46.StoreInfoRDS>()));
    gh.factory<_i50.SubmitBusinessInfoUseCase>(() =>
        _i50.SubmitBusinessInfoUseCase(
            businessInfoRepoImpl: gh<_i34.BusinessInfoRepo>()));
    gh.factory<_i51.SubmitPersonalInfoUseCase>(() =>
        _i51.SubmitPersonalInfoUseCase(
            personalInfoRepoImpl: gh<_i43.PersonalInfoRepo>()));
    gh.factory<_i52.SubmitStoreInfoUseCase>(() => _i52.SubmitStoreInfoUseCase(
        storeInfoRepoImpl: gh<_i48.StoreInfoRepo>()));
    gh.factory<_i53.UserCardRDS>(
        () => _i54.UserCardRDSImpl(apiConsumer: gh<_i29.ApiConsumer>()));
    gh.factory<_i55.UserCardRepo>(
        () => _i56.UserCardRepoImpl(userCardRDSImpl: gh<_i53.UserCardRDS>()));
    gh.factory<_i57.UserCardUseCase>(
        () => _i57.UserCardUseCase(userCardRepoImpl: gh<_i55.UserCardRepo>()));
    gh.factory<_i58.VerifyOtpRDS>(
        () => _i59.VerifyOtpRDSImpl(apiConsumer: gh<_i29.ApiConsumer>()));
    gh.factory<_i60.VerifyOtpRepo>(() =>
        _i61.VerifyOtpRepoImpl(verifyOtpRDSImpl: gh<_i58.VerifyOtpRDS>()));
    gh.factory<_i62.BusinessInfoBloc>(() => _i62.BusinessInfoBloc(
        submitBusinessInfoUseCase: gh<_i50.SubmitBusinessInfoUseCase>()));
    gh.factory<_i63.ConfirmLogInUseCase>(() =>
        _i63.ConfirmLogInUseCase(verifyOtpRepoImpl: gh<_i60.VerifyOtpRepo>()));
    gh.factory<_i64.LogInBloc>(
        () => _i64.LogInBloc(logInUseCase: gh<_i40.LogInUseCase>()));
    gh.factory<_i65.PersonalInfoBloc>(() => _i65.PersonalInfoBloc(
        submitPersonalInfoUseCase: gh<_i51.SubmitPersonalInfoUseCase>()));
    gh.factory<_i66.StoreInfoBloc>(() => _i66.StoreInfoBloc(
        submitStoreInfoUseCase: gh<_i52.SubmitStoreInfoUseCase>()));
    gh.factory<_i67.UserCardBloc>(
        () => _i67.UserCardBloc(userCardUseCase: gh<_i57.UserCardUseCase>()));
    gh.factory<_i68.VerifyOtpBloc>(() => _i68.VerifyOtpBloc(
          logInUseCase: gh<_i40.LogInUseCase>(),
          confirmLogInUseCase: gh<_i63.ConfirmLogInUseCase>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i69.InjectableModule {}
