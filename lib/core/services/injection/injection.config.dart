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
import 'package:saayer/core/API/api_client.dart' as _i28;
import 'package:saayer/core/API/api_consumer.dart' as _i27;
import 'package:saayer/core/API/interceptors/api_interceptors.dart' as _i29;
import 'package:saayer/core/API/refresh_token.dart' as _i47;
import 'package:saayer/core/app_config/app_flavor.dart' as _i4;
import 'package:saayer/core/network/network_info.dart' as _i14;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i10;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i11;
import 'package:saayer/core/services/injection/injectable_modules.dart' as _i86;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i20;
import 'package:saayer/core/services/navigation/navigation_service.dart'
    as _i13;
import 'package:saayer/features/address/add_address/data/data_sources/remote/add_address_info_RDS.dart'
    as _i64;
import 'package:saayer/features/address/add_address/data/data_sources/remote/add_address_info_RDS_impl.dart'
    as _i65;
import 'package:saayer/features/address/add_address/data/repositories/add_address_info_repo_impl.dart'
    as _i67;
import 'package:saayer/features/address/add_address/domain/repositories/add_address_info_repo.dart'
    as _i66;
import 'package:saayer/features/address/add_address/domain/use_cases/get_cities_info_usecase.dart'
    as _i75;
import 'package:saayer/features/address/add_address/domain/use_cases/submit_address_info_usecase.dart'
    as _i81;
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart'
    as _i84;
import 'package:saayer/features/address/address_details/presentation/bloc/address_details_bloc.dart'
    as _i3;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i38;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i39;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i41;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i40;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i42;
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart'
    as _i78;
import 'package:saayer/features/more_sub_features/addresses_book/data/data_sources/remote/addresses_book_RDS.dart'
    as _i68;
import 'package:saayer/features/more_sub_features/addresses_book/data/data_sources/remote/addresses_book_RDS_impl.dart'
    as _i69;
import 'package:saayer/features/more_sub_features/addresses_book/data/repositories/addresses_book_repo_impl.dart'
    as _i71;
import 'package:saayer/features/more_sub_features/addresses_book/domain/repositories/addresses_book_repo.dart'
    as _i70;
import 'package:saayer/features/more_sub_features/addresses_book/domain/use_cases/get_addresses_usecase.dart'
    as _i74;
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart'
    as _i85;
import 'package:saayer/features/more_sub_features/contact_us/presentation/bloc/contact_us_bloc.dart'
    as _i6;
import 'package:saayer/features/more_sub_features/help/presentation/bloc/help_bloc.dart'
    as _i8;
import 'package:saayer/features/more_sub_features/settings/presentation/bloc/settings_bloc.dart'
    as _i19;
import 'package:saayer/features/more_sub_features/shipping_rates/presentation/bloc/shipping_rates_bloc.dart'
    as _i23;
import 'package:saayer/features/more_sub_features/why_saayer/presentation/bloc/why_saayer_bloc.dart'
    as _i26;
import 'package:saayer/features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i15;
import 'package:saayer/features/profile_sub_features/bills/presentation/bloc/bills_bloc.dart'
    as _i5;
import 'package:saayer/features/profile_sub_features/info/presentation/bloc/info_bloc.dart'
    as _i9;
import 'package:saayer/features/profile_sub_features/reports/presentation/bloc/reports_bloc.dart'
    as _i17;
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/bloc/shipment_details_bloc.dart'
    as _i21;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS.dart'
    as _i55;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS_impl.dart'
    as _i56;
import 'package:saayer/features/user_card/data/repositories/user_card_repo_impl.dart'
    as _i58;
import 'package:saayer/features/user_card/domain/repositories/user_card_repo.dart'
    as _i57;
import 'package:saayer/features/user_card/domain/use_cases/user_card_usecase.dart'
    as _i59;
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart'
    as _i82;
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart'
    as _i24;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS.dart'
    as _i30;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS_impl.dart'
    as _i31;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/repositories/business_info_repo_impl.dart'
    as _i33;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/repositories/business_info_repo.dart'
    as _i32;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/use_cases/submit_business_info_usecase.dart'
    as _i52;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart'
    as _i72;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS.dart'
    as _i43;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS_impl.dart'
    as _i44;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/repositories/personal_info_repo_impl.dart'
    as _i46;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/repositories/personal_info_repo.dart'
    as _i45;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/use_cases/submit_personal_info_usecase.dart'
    as _i53;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/bloc/personal_info_bloc.dart'
    as _i79;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS.dart'
    as _i48;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS_impl.dart'
    as _i49;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/repositories/store_info_repo_impl.dart'
    as _i51;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/repositories/store_info_repo.dart'
    as _i50;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/use_cases/submit_store_info_usecase.dart'
    as _i54;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/presentation/bloc/store_info_bloc.dart'
    as _i80;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart'
    as _i60;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS_impl.dart'
    as _i61;
import 'package:saayer/features/verify_otp/data/repositories/verify_otp_repo_impl.dart'
    as _i63;
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart'
    as _i62;
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart'
    as _i73;
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart'
    as _i83;
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart'
    as _i25;
import 'package:saayer/features/view_page/sub_features/home/data/data_sources/remote/home_RDS.dart'
    as _i34;
import 'package:saayer/features/view_page/sub_features/home/data/data_sources/remote/home_RDS_impl.dart'
    as _i35;
import 'package:saayer/features/view_page/sub_features/home/data/repositories/home_repo_impl.dart'
    as _i37;
import 'package:saayer/features/view_page/sub_features/home/domain/repositories/home_repo.dart'
    as _i36;
import 'package:saayer/features/view_page/sub_features/home/domain/use_cases/get_user_profile_usecase.dart'
    as _i76;
import 'package:saayer/features/view_page/sub_features/home/presentation/bloc/home_bloc.dart'
    as _i77;
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart'
    as _i12;
import 'package:saayer/features/view_page/sub_features/profile/presentation/bloc/profile_bloc.dart'
    as _i16;
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart'
    as _i18;
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart'
    as _i22;

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
    gh.factory<_i3.AddressDetailsBloc>(() => _i3.AddressDetailsBloc());
    gh.singleton<_i4.AppFlavor>(_i4.AppFlavor());
    gh.factory<_i5.BillsBloc>(() => _i5.BillsBloc());
    gh.factory<_i6.ContactUsBloc>(() => _i6.ContactUsBloc());
    gh.singleton<_i7.Dio>(injectableModule.dio);
    gh.factory<_i8.HelpBloc>(() => _i8.HelpBloc());
    gh.factory<_i9.InfoBloc>(() => _i9.InfoBloc());
    gh.factory<_i10.LoggedInCheckerService>(
        () => _i10.LoggedInCheckerService());
    gh.singleton<_i11.LoggedInService>(_i11.LoggedInService());
    gh.factory<_i12.MoreBloc>(() => _i12.MoreBloc());
    gh.singleton<_i13.NavigationService>(_i13.NavigationService());
    gh.lazySingleton<_i14.NetworkInfo>(() => _i14.NetworkInfoImpl());
    gh.factory<_i15.NotificationsBloc>(() => _i15.NotificationsBloc());
    gh.factory<_i16.ProfileBloc>(() => _i16.ProfileBloc());
    gh.factory<_i17.ReportsBloc>(() => _i17.ReportsBloc());
    gh.factory<_i18.RequestShipmentBloc>(() => _i18.RequestShipmentBloc());
    gh.factory<_i19.SettingsBloc>(() => _i19.SettingsBloc());
    gh.singleton<_i20.SharedPrefService>(_i20.SharedPrefService());
    gh.factory<_i21.ShipmentDetailsBloc>(() => _i21.ShipmentDetailsBloc());
    gh.factory<_i22.ShipmentsBloc>(() => _i22.ShipmentsBloc());
    gh.factory<_i23.ShippingRatesBloc>(() => _i23.ShippingRatesBloc());
    gh.factory<_i24.UserInfoViewPageBloc>(() => _i24.UserInfoViewPageBloc());
    gh.factory<_i25.ViewPageBloc>(() => _i25.ViewPageBloc());
    gh.factory<_i26.WhySaayerBloc>(() => _i26.WhySaayerBloc());
    gh.lazySingleton<_i27.ApiConsumer>(
        () => _i28.DioConsumer(client: gh<_i7.Dio>()));
    gh.lazySingleton<_i29.AppInterceptors>(
        () => _i29.AppInterceptors(client: gh<_i7.Dio>()));
    gh.factory<_i30.BusinessInfoRDS>(
        () => _i31.BusinessInfoRDSImpl(apiConsumer: gh<_i27.ApiConsumer>()));
    gh.factory<_i32.BusinessInfoRepo>(() => _i33.BusinessInfoRepoImpl(
        businessInfoRDSImpl: gh<_i30.BusinessInfoRDS>()));
    gh.factory<_i34.HomeRDS>(
        () => _i35.HomeRDSImpl(apiConsumer: gh<_i27.ApiConsumer>()));
    gh.factory<_i36.HomeRepo>(
        () => _i37.HomeRepoImpl(homeRDSImpl: gh<_i34.HomeRDS>()));
    gh.factory<_i38.LogInRDS>(
        () => _i39.LogInRDSImpl(apiConsumer: gh<_i27.ApiConsumer>()));
    gh.factory<_i40.LogInRepo>(
        () => _i41.LogInRepoImpl(logInRDSImpl: gh<_i38.LogInRDS>()));
    gh.factory<_i42.LogInUseCase>(
        () => _i42.LogInUseCase(logInRepoImpl: gh<_i40.LogInRepo>()));
    gh.factory<_i43.PersonalInfoRDS>(
        () => _i44.PersonalInfoRDSImpl(apiConsumer: gh<_i27.ApiConsumer>()));
    gh.factory<_i45.PersonalInfoRepo>(() => _i46.PersonalInfoRepoImpl(
        personalInfoRDSImpl: gh<_i43.PersonalInfoRDS>()));
    gh.factory<_i47.RefreshToken>(
        () => _i47.RefreshToken(apiConsumer: gh<_i27.ApiConsumer>()));
    gh.factory<_i48.StoreInfoRDS>(
        () => _i49.StoreInfoRDSImpl(apiConsumer: gh<_i27.ApiConsumer>()));
    gh.factory<_i50.StoreInfoRepo>(() =>
        _i51.StoreInfoRepoImpl(storeInfoRDSImpl: gh<_i48.StoreInfoRDS>()));
    gh.factory<_i52.SubmitBusinessInfoUseCase>(() =>
        _i52.SubmitBusinessInfoUseCase(
            businessInfoRepoImpl: gh<_i32.BusinessInfoRepo>()));
    gh.factory<_i53.SubmitPersonalInfoUseCase>(() =>
        _i53.SubmitPersonalInfoUseCase(
            personalInfoRepoImpl: gh<_i45.PersonalInfoRepo>()));
    gh.factory<_i54.SubmitStoreInfoUseCase>(() => _i54.SubmitStoreInfoUseCase(
        storeInfoRepoImpl: gh<_i50.StoreInfoRepo>()));
    gh.factory<_i55.UserCardRDS>(
        () => _i56.UserCardRDSImpl(apiConsumer: gh<_i27.ApiConsumer>()));
    gh.factory<_i57.UserCardRepo>(
        () => _i58.UserCardRepoImpl(userCardRDSImpl: gh<_i55.UserCardRDS>()));
    gh.factory<_i59.UserCardUseCase>(
        () => _i59.UserCardUseCase(userCardRepoImpl: gh<_i57.UserCardRepo>()));
    gh.factory<_i60.VerifyOtpRDS>(
        () => _i61.VerifyOtpRDSImpl(apiConsumer: gh<_i27.ApiConsumer>()));
    gh.factory<_i62.VerifyOtpRepo>(() =>
        _i63.VerifyOtpRepoImpl(verifyOtpRDSImpl: gh<_i60.VerifyOtpRDS>()));
    gh.factory<_i64.AddAddressInfoRDS>(
        () => _i65.AddAddressInfoRDSImpl(apiConsumer: gh<_i27.ApiConsumer>()));
    gh.factory<_i66.AddAddressInfoRepo>(() => _i67.AddAddressInfoRepoImpl(
        addAddressInfoRDSImpl: gh<_i64.AddAddressInfoRDS>()));
    gh.factory<_i68.AddressesBookRDS>(
        () => _i69.AddressesBookRDSImpl(apiConsumer: gh<_i27.ApiConsumer>()));
    gh.factory<_i70.AddressesBookRepo>(() => _i71.AddressesBookRepoImpl(
        addressesBookRDSImpl: gh<_i68.AddressesBookRDS>()));
    gh.factory<_i72.BusinessInfoBloc>(() => _i72.BusinessInfoBloc(
        submitBusinessInfoUseCase: gh<_i52.SubmitBusinessInfoUseCase>()));
    gh.factory<_i73.ConfirmLogInUseCase>(() =>
        _i73.ConfirmLogInUseCase(verifyOtpRepoImpl: gh<_i62.VerifyOtpRepo>()));
    gh.factory<_i74.GetAddressesUseCase>(() => _i74.GetAddressesUseCase(
        addressesBookRepoImpl: gh<_i70.AddressesBookRepo>()));
    gh.factory<_i75.GetCitiesUseCase>(() => _i75.GetCitiesUseCase(
        addAddressInfoRepoImpl: gh<_i66.AddAddressInfoRepo>()));
    gh.factory<_i76.GetUserProfileUseCase>(
        () => _i76.GetUserProfileUseCase(homeRepoImpl: gh<_i36.HomeRepo>()));
    gh.factory<_i77.HomeBloc>(() =>
        _i77.HomeBloc(getUserProfileUseCase: gh<_i76.GetUserProfileUseCase>()));
    gh.factory<_i78.LogInBloc>(
        () => _i78.LogInBloc(logInUseCase: gh<_i42.LogInUseCase>()));
    gh.factory<_i79.PersonalInfoBloc>(() => _i79.PersonalInfoBloc(
        submitPersonalInfoUseCase: gh<_i53.SubmitPersonalInfoUseCase>()));
    gh.factory<_i80.StoreInfoBloc>(() => _i80.StoreInfoBloc(
        submitStoreInfoUseCase: gh<_i54.SubmitStoreInfoUseCase>()));
    gh.factory<_i81.SubmitAddressInfoUseCase>(() =>
        _i81.SubmitAddressInfoUseCase(
            addAddressInfoRepoImpl: gh<_i66.AddAddressInfoRepo>()));
    gh.factory<_i82.UserCardBloc>(
        () => _i82.UserCardBloc(userCardUseCase: gh<_i59.UserCardUseCase>()));
    gh.factory<_i83.VerifyOtpBloc>(() => _i83.VerifyOtpBloc(
          logInUseCase: gh<_i42.LogInUseCase>(),
          confirmLogInUseCase: gh<_i73.ConfirmLogInUseCase>(),
        ));
    gh.factory<_i84.AddAddressBloc>(() => _i84.AddAddressBloc(
          submitAddressInfoUseCase: gh<_i81.SubmitAddressInfoUseCase>(),
          getCitiesUseCase: gh<_i75.GetCitiesUseCase>(),
        ));
    gh.factory<_i85.AddressesBookBloc>(() => _i85.AddressesBookBloc(
        getAddressesUseCase: gh<_i74.GetAddressesUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i86.InjectableModule {}
