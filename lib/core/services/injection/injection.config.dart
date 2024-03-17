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
import 'package:saayer/core/API/api_client.dart' as _i31;
import 'package:saayer/core/API/api_consumer.dart' as _i30;
import 'package:saayer/core/API/interceptors/api_interceptors.dart' as _i32;
import 'package:saayer/core/API/refresh_token.dart' as _i50;
import 'package:saayer/core/app_config/app_flavor.dart' as _i5;
import 'package:saayer/core/network/network_info.dart' as _i17;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i13;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i14;
import 'package:saayer/core/services/injection/injectable_modules.dart' as _i95;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i23;
import 'package:saayer/core/services/navigation/navigation_service.dart'
    as _i16;
import 'package:saayer/features/address/add_address/data/data_sources/remote/add_address_info_RDS.dart'
    as _i71;
import 'package:saayer/features/address/add_address/data/data_sources/remote/add_address_info_RDS_impl.dart'
    as _i72;
import 'package:saayer/features/address/add_address/data/repositories/add_address_info_repo_impl.dart'
    as _i74;
import 'package:saayer/features/address/add_address/domain/repositories/add_address_info_repo.dart'
    as _i73;
import 'package:saayer/features/address/add_address/domain/use_cases/get_cities_info_usecase.dart'
    as _i82;
import 'package:saayer/features/address/add_address/domain/use_cases/submit_address_info_usecase.dart'
    as _i90;
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart'
    as _i93;
import 'package:saayer/features/address/address_details/presentation/bloc/address_details_bloc.dart'
    as _i3;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i41;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i42;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i44;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i43;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i45;
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart'
    as _i86;
import 'package:saayer/features/more_sub_features/addresses_book/data/data_sources/remote/addresses_book_RDS.dart'
    as _i75;
import 'package:saayer/features/more_sub_features/addresses_book/data/data_sources/remote/addresses_book_RDS_impl.dart'
    as _i76;
import 'package:saayer/features/more_sub_features/addresses_book/data/repositories/addresses_book_repo_impl.dart'
    as _i78;
import 'package:saayer/features/more_sub_features/addresses_book/domain/repositories/addresses_book_repo.dart'
    as _i77;
import 'package:saayer/features/more_sub_features/addresses_book/domain/use_cases/get_addresses_usecase.dart'
    as _i81;
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart'
    as _i94;
import 'package:saayer/features/more_sub_features/contact_us/presentation/bloc/contact_us_bloc.dart'
    as _i8;
import 'package:saayer/features/more_sub_features/help/presentation/bloc/help_bloc.dart'
    as _i10;
import 'package:saayer/features/more_sub_features/settings/presentation/bloc/settings_bloc.dart'
    as _i22;
import 'package:saayer/features/more_sub_features/shipping_rates/presentation/bloc/shipping_rates_bloc.dart'
    as _i26;
import 'package:saayer/features/more_sub_features/why_saayer/presentation/bloc/why_saayer_bloc.dart'
    as _i29;
import 'package:saayer/features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i18;
import 'package:saayer/features/profile_sub_features/bills/presentation/bloc/bills_bloc.dart'
    as _i6;
import 'package:saayer/features/profile_sub_features/info/presentation/bloc/info_bloc.dart'
    as _i11;
import 'package:saayer/features/profile_sub_features/reports/presentation/bloc/reports_bloc.dart'
    as _i20;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/data_sources/shipment_providers_rds_impl.dart'
    as _i52;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/data_sources/shipment_prroviders_rds.dart'
    as _i51;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/repositories/shipment_providers_repo_impl.dart'
    as _i54;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/repositories/shipment_providers_repo.dart'
    as _i53;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/use_cases/get_shipment_providers_usecase.dart'
    as _i83;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/blocs/shipment_providers_bloc.dart'
    as _i88;
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/bloc/shipment_details_bloc.dart'
    as _i24;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS.dart'
    as _i62;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS_impl.dart'
    as _i63;
import 'package:saayer/features/user_card/data/repositories/user_card_repo_impl.dart'
    as _i65;
import 'package:saayer/features/user_card/domain/repositories/user_card_repo.dart'
    as _i64;
import 'package:saayer/features/user_card/domain/use_cases/user_card_usecase.dart'
    as _i66;
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart'
    as _i91;
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart'
    as _i27;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS.dart'
    as _i33;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS_impl.dart'
    as _i34;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/repositories/business_info_repo_impl.dart'
    as _i36;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/repositories/business_info_repo.dart'
    as _i35;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/use_cases/submit_business_info_usecase.dart'
    as _i59;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart'
    as _i79;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS.dart'
    as _i46;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS_impl.dart'
    as _i47;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/repositories/personal_info_repo_impl.dart'
    as _i49;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/repositories/personal_info_repo.dart'
    as _i48;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/use_cases/submit_personal_info_usecase.dart'
    as _i60;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/bloc/personal_info_bloc.dart'
    as _i87;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS.dart'
    as _i55;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS_impl.dart'
    as _i56;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/repositories/store_info_repo_impl.dart'
    as _i58;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/repositories/store_info_repo.dart'
    as _i57;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/use_cases/submit_store_info_usecase.dart'
    as _i61;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/presentation/bloc/store_info_bloc.dart'
    as _i89;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart'
    as _i67;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS_impl.dart'
    as _i68;
import 'package:saayer/features/verify_otp/data/repositories/verify_otp_repo_impl.dart'
    as _i70;
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart'
    as _i69;
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart'
    as _i80;
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart'
    as _i92;
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart'
    as _i28;
import 'package:saayer/features/view_page/sub_features/home/data/data_sources/remote/home_RDS.dart'
    as _i37;
import 'package:saayer/features/view_page/sub_features/home/data/data_sources/remote/home_RDS_impl.dart'
    as _i38;
import 'package:saayer/features/view_page/sub_features/home/data/repositories/home_repo_impl.dart'
    as _i40;
import 'package:saayer/features/view_page/sub_features/home/domain/repositories/home_repo.dart'
    as _i39;
import 'package:saayer/features/view_page/sub_features/home/domain/use_cases/get_user_profile_usecase.dart'
    as _i84;
import 'package:saayer/features/view_page/sub_features/home/presentation/bloc/home_bloc.dart'
    as _i85;
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart'
    as _i15;
import 'package:saayer/features/view_page/sub_features/profile/presentation/bloc/profile_bloc.dart'
    as _i19;
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart'
    as _i21;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/presentation/bloc/address_shipment_bloc.dart'
    as _i4;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipment_information/presentation/bloc/information_shipment_bloc.dart'
    as _i12;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipments_cariers_selection/presentation/bloc/carriers_shipment_bloc.dart'
    as _i7;
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart'
    as _i25;

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
    gh.factory<_i4.AddressShipmentBloc>(() => _i4.AddressShipmentBloc());
    gh.singleton<_i5.AppFlavor>(_i5.AppFlavor());
    gh.factory<_i6.BillsBloc>(() => _i6.BillsBloc());
    gh.factory<_i7.CarriersShipmentBloc>(() => _i7.CarriersShipmentBloc());
    gh.factory<_i8.ContactUsBloc>(() => _i8.ContactUsBloc());
    gh.singleton<_i9.Dio>(injectableModule.dio);
    gh.factory<_i10.HelpBloc>(() => _i10.HelpBloc());
    gh.factory<_i11.InfoBloc>(() => _i11.InfoBloc());
    gh.factory<_i12.InformationShipmentBloc>(
        () => _i12.InformationShipmentBloc());
    gh.factory<_i13.LoggedInCheckerService>(
        () => _i13.LoggedInCheckerService());
    gh.singleton<_i14.LoggedInService>(_i14.LoggedInService());
    gh.factory<_i15.MoreBloc>(() => _i15.MoreBloc());
    gh.singleton<_i16.NavigationService>(_i16.NavigationService());
    gh.lazySingleton<_i17.NetworkInfo>(() => _i17.NetworkInfoImpl());
    gh.factory<_i18.NotificationsBloc>(() => _i18.NotificationsBloc());
    gh.factory<_i19.ProfileBloc>(() => _i19.ProfileBloc());
    gh.factory<_i20.ReportsBloc>(() => _i20.ReportsBloc());
    gh.factory<_i21.RequestShipmentBloc>(() => _i21.RequestShipmentBloc());
    gh.factory<_i22.SettingsBloc>(() => _i22.SettingsBloc());
    gh.singleton<_i23.SharedPrefService>(_i23.SharedPrefService());
    gh.factory<_i24.ShipmentDetailsBloc>(() => _i24.ShipmentDetailsBloc());
    gh.factory<_i25.ShipmentsBloc>(() => _i25.ShipmentsBloc());
    gh.factory<_i26.ShippingRatesBloc>(() => _i26.ShippingRatesBloc());
    gh.factory<_i27.UserInfoViewPageBloc>(() => _i27.UserInfoViewPageBloc());
    gh.factory<_i28.ViewPageBloc>(() => _i28.ViewPageBloc());
    gh.factory<_i29.WhySaayerBloc>(() => _i29.WhySaayerBloc());
    gh.lazySingleton<_i30.ApiConsumer>(
        () => _i31.DioConsumer(client: gh<_i9.Dio>()));
    gh.lazySingleton<_i32.AppInterceptors>(
        () => _i32.AppInterceptors(client: gh<_i9.Dio>()));
    gh.factory<_i33.BusinessInfoRDS>(
        () => _i34.BusinessInfoRDSImpl(apiConsumer: gh<_i30.ApiConsumer>()));
    gh.factory<_i35.BusinessInfoRepo>(() => _i36.BusinessInfoRepoImpl(
        businessInfoRDSImpl: gh<_i33.BusinessInfoRDS>()));
    gh.factory<_i37.HomeRDS>(
        () => _i38.HomeRDSImpl(apiConsumer: gh<_i30.ApiConsumer>()));
    gh.factory<_i39.HomeRepo>(
        () => _i40.HomeRepoImpl(homeRDSImpl: gh<_i37.HomeRDS>()));
    gh.factory<_i41.LogInRDS>(
        () => _i42.LogInRDSImpl(apiConsumer: gh<_i30.ApiConsumer>()));
    gh.factory<_i43.LogInRepo>(
        () => _i44.LogInRepoImpl(logInRDSImpl: gh<_i41.LogInRDS>()));
    gh.factory<_i45.LogInUseCase>(
        () => _i45.LogInUseCase(logInRepoImpl: gh<_i43.LogInRepo>()));
    gh.factory<_i46.PersonalInfoRDS>(
        () => _i47.PersonalInfoRDSImpl(apiConsumer: gh<_i30.ApiConsumer>()));
    gh.factory<_i48.PersonalInfoRepo>(() => _i49.PersonalInfoRepoImpl(
        personalInfoRDSImpl: gh<_i46.PersonalInfoRDS>()));
    gh.factory<_i50.RefreshToken>(
        () => _i50.RefreshToken(apiConsumer: gh<_i30.ApiConsumer>()));
    gh.factory<_i51.ShipmentProvidersRDS>(() =>
        _i52.ShipmentProvidersRDSImpl(apiConsumer: gh<_i30.ApiConsumer>()));
    gh.factory<_i53.ShipmentProvidersRepo>(() => _i54.ShipmentProvidersRepoImpl(
        shipmentProvidersRDS: gh<_i51.ShipmentProvidersRDS>()));
    gh.factory<_i55.StoreInfoRDS>(
        () => _i56.StoreInfoRDSImpl(apiConsumer: gh<_i30.ApiConsumer>()));
    gh.factory<_i57.StoreInfoRepo>(() =>
        _i58.StoreInfoRepoImpl(storeInfoRDSImpl: gh<_i55.StoreInfoRDS>()));
    gh.factory<_i59.SubmitBusinessInfoUseCase>(() =>
        _i59.SubmitBusinessInfoUseCase(
            businessInfoRepoImpl: gh<_i35.BusinessInfoRepo>()));
    gh.factory<_i60.SubmitPersonalInfoUseCase>(() =>
        _i60.SubmitPersonalInfoUseCase(
            personalInfoRepoImpl: gh<_i48.PersonalInfoRepo>()));
    gh.factory<_i61.SubmitStoreInfoUseCase>(() => _i61.SubmitStoreInfoUseCase(
        storeInfoRepoImpl: gh<_i57.StoreInfoRepo>()));
    gh.factory<_i62.UserCardRDS>(
        () => _i63.UserCardRDSImpl(apiConsumer: gh<_i30.ApiConsumer>()));
    gh.factory<_i64.UserCardRepo>(
        () => _i65.UserCardRepoImpl(userCardRDSImpl: gh<_i62.UserCardRDS>()));
    gh.factory<_i66.UserCardUseCase>(
        () => _i66.UserCardUseCase(userCardRepoImpl: gh<_i64.UserCardRepo>()));
    gh.factory<_i67.VerifyOtpRDS>(
        () => _i68.VerifyOtpRDSImpl(apiConsumer: gh<_i30.ApiConsumer>()));
    gh.factory<_i69.VerifyOtpRepo>(() =>
        _i70.VerifyOtpRepoImpl(verifyOtpRDSImpl: gh<_i67.VerifyOtpRDS>()));
    gh.factory<_i71.AddAddressInfoRDS>(
        () => _i72.AddAddressInfoRDSImpl(apiConsumer: gh<_i30.ApiConsumer>()));
    gh.factory<_i73.AddAddressInfoRepo>(() => _i74.AddAddressInfoRepoImpl(
        addAddressInfoRDSImpl: gh<_i71.AddAddressInfoRDS>()));
    gh.factory<_i75.AddressesBookRDS>(
        () => _i76.AddressesBookRDSImpl(apiConsumer: gh<_i30.ApiConsumer>()));
    gh.factory<_i77.AddressesBookRepo>(() => _i78.AddressesBookRepoImpl(
        addressesBookRDSImpl: gh<_i75.AddressesBookRDS>()));
    gh.factory<_i79.BusinessInfoBloc>(() => _i79.BusinessInfoBloc(
        submitBusinessInfoUseCase: gh<_i59.SubmitBusinessInfoUseCase>()));
    gh.factory<_i80.ConfirmLogInUseCase>(() =>
        _i80.ConfirmLogInUseCase(verifyOtpRepoImpl: gh<_i69.VerifyOtpRepo>()));
    gh.factory<_i81.GetAddressesUseCase>(() => _i81.GetAddressesUseCase(
        addressesBookRepoImpl: gh<_i77.AddressesBookRepo>()));
    gh.factory<_i82.GetCitiesUseCase>(() => _i82.GetCitiesUseCase(
        addAddressInfoRepoImpl: gh<_i73.AddAddressInfoRepo>()));
    gh.factory<_i83.GetShipmentProvidersUseCase>(() =>
        _i83.GetShipmentProvidersUseCase(
            shipmentProvidersRepo: gh<_i53.ShipmentProvidersRepo>()));
    gh.factory<_i84.GetUserProfileUseCase>(
        () => _i84.GetUserProfileUseCase(homeRepoImpl: gh<_i39.HomeRepo>()));
    gh.factory<_i85.HomeBloc>(() =>
        _i85.HomeBloc(getUserProfileUseCase: gh<_i84.GetUserProfileUseCase>()));
    gh.factory<_i86.LogInBloc>(
        () => _i86.LogInBloc(logInUseCase: gh<_i45.LogInUseCase>()));
    gh.factory<_i87.PersonalInfoBloc>(() => _i87.PersonalInfoBloc(
        submitPersonalInfoUseCase: gh<_i60.SubmitPersonalInfoUseCase>()));
    gh.factory<_i88.ShipmentProvidersBloc>(() => _i88.ShipmentProvidersBloc(
        getShipmentProvidersUseCase: gh<_i83.GetShipmentProvidersUseCase>()));
    gh.factory<_i89.StoreInfoBloc>(() => _i89.StoreInfoBloc(
        submitStoreInfoUseCase: gh<_i61.SubmitStoreInfoUseCase>()));
    gh.factory<_i90.SubmitAddressInfoUseCase>(() =>
        _i90.SubmitAddressInfoUseCase(
            addAddressInfoRepoImpl: gh<_i73.AddAddressInfoRepo>()));
    gh.factory<_i91.UserCardBloc>(
        () => _i91.UserCardBloc(userCardUseCase: gh<_i66.UserCardUseCase>()));
    gh.factory<_i92.VerifyOtpBloc>(() => _i92.VerifyOtpBloc(
          logInUseCase: gh<_i45.LogInUseCase>(),
          confirmLogInUseCase: gh<_i80.ConfirmLogInUseCase>(),
        ));
    gh.factory<_i93.AddAddressBloc>(() => _i93.AddAddressBloc(
          submitAddressInfoUseCase: gh<_i90.SubmitAddressInfoUseCase>(),
          getCitiesUseCase: gh<_i82.GetCitiesUseCase>(),
        ));
    gh.factory<_i94.AddressesBookBloc>(() => _i94.AddressesBookBloc(
        getAddressesUseCase: gh<_i81.GetAddressesUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i95.InjectableModule {}
