// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:openapi/openapi.dart' as _i711;
import 'package:saayer/common/address_widgets/data/data_sources/remote/address_widgets_RDS.dart'
    as _i369;
import 'package:saayer/common/address_widgets/data/data_sources/remote/address_widgets_RDS_impl.dart'
    as _i254;
import 'package:saayer/common/address_widgets/data/repositories/address_widgets_repo_impl.dart'
    as _i572;
import 'package:saayer/common/address_widgets/domain/repositories/address_widgets_repo.dart'
    as _i1030;
import 'package:saayer/common/address_widgets/presentation/bloc/address_widgets_bloc.dart'
    as _i191;
import 'package:saayer/core/API/api_client.dart' as _i9;
import 'package:saayer/core/API/api_consumer.dart' as _i151;
import 'package:saayer/core/API/interceptors/api_interceptors.dart' as _i1059;
import 'package:saayer/core/API/interceptors/openapi_interceptors.dart'
    as _i970;
import 'package:saayer/core/API/refresh_token.dart' as _i927;
import 'package:saayer/core/app_config/app_flavor.dart' as _i552;
import 'package:saayer/core/network/network_info.dart' as _i919;
import 'package:saayer/core/openAPI/openAPI_config.dart' as _i801;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i317;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i275;
import 'package:saayer/core/services/injection/injectable_modules.dart'
    as _i847;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i502;
import 'package:saayer/core/services/navigation/navigation_service.dart'
    as _i355;
import 'package:saayer/features/address/add_edit_address/data/data_sources/remote/add_address_info_RDS.dart'
    as _i173;
import 'package:saayer/features/address/add_edit_address/data/data_sources/remote/add_address_info_RDS_impl.dart'
    as _i500;
import 'package:saayer/features/address/add_edit_address/data/repositories/add_edit_address_info_repo_impl.dart'
    as _i419;
import 'package:saayer/features/address/add_edit_address/domain/repositories/add_edit_address_info_repo.dart'
    as _i335;
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_areas_usecase.dart'
    as _i254;
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_cities_usecase.dart'
    as _i555;
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_countries_usecase.dart'
    as _i133;
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_governorate_usecase.dart'
    as _i402;
import 'package:saayer/features/address/add_edit_address/domain/use_cases/submit_address_info_usecase.dart'
    as _i787;
import 'package:saayer/features/address/add_edit_address/domain/use_cases/update_address_usecase.dart'
    as _i648;
import 'package:saayer/features/address/add_edit_address/presentation/bloc/add_edit_address_bloc.dart'
    as _i73;
import 'package:saayer/features/address/address_details/presentation/bloc/address_details_bloc.dart'
    as _i925;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i400;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i211;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i681;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i735;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i356;
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart'
    as _i22;
import 'package:saayer/features/more_sub_features/addresses_book/data/data_sources/remote/addresses_book_RDS.dart'
    as _i211;
import 'package:saayer/features/more_sub_features/addresses_book/data/data_sources/remote/addresses_book_RDS_impl.dart'
    as _i788;
import 'package:saayer/features/more_sub_features/addresses_book/data/repositories/addresses_book_repo_impl.dart'
    as _i292;
import 'package:saayer/features/more_sub_features/addresses_book/domain/repositories/addresses_book_repo.dart'
    as _i29;
import 'package:saayer/features/more_sub_features/addresses_book/domain/use_cases/delete_address_usecase.dart'
    as _i180;
import 'package:saayer/features/more_sub_features/addresses_book/domain/use_cases/edit_address_usecase.dart'
    as _i401;
import 'package:saayer/features/more_sub_features/addresses_book/domain/use_cases/get_addresses_usecase.dart'
    as _i44;
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart'
    as _i138;
import 'package:saayer/features/more_sub_features/contact_us/presentation/bloc/contact_us_bloc.dart'
    as _i206;
import 'package:saayer/features/more_sub_features/help/presentation/bloc/help_bloc.dart'
    as _i609;
import 'package:saayer/features/more_sub_features/settings/presentation/bloc/settings_bloc.dart'
    as _i212;
import 'package:saayer/features/more_sub_features/shipping_rates/presentation/bloc/shipping_rates_bloc.dart'
    as _i360;
import 'package:saayer/features/more_sub_features/why_saayer/presentation/bloc/why_saayer_bloc.dart'
    as _i900;
import 'package:saayer/features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i110;
import 'package:saayer/features/profile_sub_features/bills/presentation/bloc/bills_bloc.dart'
    as _i386;
import 'package:saayer/features/profile_sub_features/info/presentation/bloc/info_bloc.dart'
    as _i79;
import 'package:saayer/features/profile_sub_features/reports/presentation/bloc/reports_bloc.dart'
    as _i1028;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/data_sources/shipment_providers_rds_impl.dart'
    as _i638;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/data_sources/shipment_prroviders_rds.dart'
    as _i35;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/repositories/shipment_providers_repo_impl.dart'
    as _i995;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/repositories/shipment_providers_repo.dart'
    as _i377;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/use_cases/get_shipment_providers_usecase.dart'
    as _i897;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/blocs/shipment_providers_bloc.dart'
    as _i135;
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/presentation/bloc/shipment_specs_bloc.dart'
    as _i740;
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/bloc/shipment_details_bloc.dart'
    as _i671;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS.dart'
    as _i609;
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS_impl.dart'
    as _i64;
import 'package:saayer/features/user_card/data/repositories/user_card_repo_impl.dart'
    as _i671;
import 'package:saayer/features/user_card/domain/repositories/user_card_repo.dart'
    as _i68;
import 'package:saayer/features/user_card/domain/use_cases/user_card_usecase.dart'
    as _i736;
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart'
    as _i260;
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart'
    as _i1037;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS.dart'
    as _i785;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/data_sources/remote/business_info_RDS_impl.dart'
    as _i882;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/data/repositories/business_info_repo_impl.dart'
    as _i655;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/repositories/business_info_repo.dart'
    as _i192;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/use_cases/submit_business_info_usecase.dart'
    as _i396;
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart'
    as _i684;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS.dart'
    as _i635;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS_impl.dart'
    as _i119;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/repositories/personal_info_repo_impl.dart'
    as _i34;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/repositories/personal_info_repo.dart'
    as _i934;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/use_cases/submit_personal_info_usecase.dart'
    as _i32;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/bloc/personal_info_bloc.dart'
    as _i410;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS.dart'
    as _i618;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS_impl.dart'
    as _i764;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/repositories/store_info_repo_impl.dart'
    as _i656;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/repositories/store_info_repo.dart'
    as _i599;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/use_cases/submit_store_info_usecase.dart'
    as _i736;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/presentation/bloc/store_info_bloc.dart'
    as _i620;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart'
    as _i389;
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS_impl.dart'
    as _i23;
import 'package:saayer/features/verify_otp/data/repositories/verify_otp_repo_impl.dart'
    as _i408;
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart'
    as _i689;
import 'package:saayer/features/verify_otp/domain/use_cases/confirm_log_in_usecase.dart'
    as _i233;
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart'
    as _i613;
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart'
    as _i870;
import 'package:saayer/features/view_page/sub_features/home/data/data_sources/remote/home_RDS.dart'
    as _i99;
import 'package:saayer/features/view_page/sub_features/home/data/data_sources/remote/home_RDS_impl.dart'
    as _i322;
import 'package:saayer/features/view_page/sub_features/home/data/repositories/home_repo_impl.dart'
    as _i168;
import 'package:saayer/features/view_page/sub_features/home/domain/repositories/home_repo.dart'
    as _i586;
import 'package:saayer/features/view_page/sub_features/home/domain/use_cases/get_user_profile_usecase.dart'
    as _i689;
import 'package:saayer/features/view_page/sub_features/home/presentation/bloc/home_bloc.dart'
    as _i248;
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart'
    as _i778;
import 'package:saayer/features/view_page/sub_features/profile/presentation/bloc/profile_bloc.dart'
    as _i199;
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart'
    as _i304;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/presentation/bloc/address_shipment_bloc.dart'
    as _i526;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipment_information/presentation/bloc/information_shipment_bloc.dart'
    as _i1055;
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipments_cariers_selection/presentation/bloc/carriers_shipment_bloc.dart'
    as _i509;
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart'
    as _i217;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.factory<_i317.LoggedInCheckerService>(
        () => _i317.LoggedInCheckerService());
    gh.factory<_i212.SettingsBloc>(() => _i212.SettingsBloc());
    gh.factory<_i900.WhySaayerBloc>(() => _i900.WhySaayerBloc());
    gh.factory<_i206.ContactUsBloc>(() => _i206.ContactUsBloc());
    gh.factory<_i360.ShippingRatesBloc>(() => _i360.ShippingRatesBloc());
    gh.factory<_i609.HelpBloc>(() => _i609.HelpBloc());
    gh.factory<_i1037.UserInfoViewPageBloc>(
        () => _i1037.UserInfoViewPageBloc());
    gh.factory<_i671.ShipmentDetailsBloc>(() => _i671.ShipmentDetailsBloc());
    gh.factory<_i79.InfoBloc>(() => _i79.InfoBloc());
    gh.factory<_i386.BillsBloc>(() => _i386.BillsBloc());
    gh.factory<_i1028.ReportsBloc>(() => _i1028.ReportsBloc());
    gh.factory<_i740.ShipmentSpecsBloc>(() => _i740.ShipmentSpecsBloc());
    gh.factory<_i217.ShipmentsBloc>(() => _i217.ShipmentsBloc());
    gh.factory<_i509.CarriersShipmentBloc>(() => _i509.CarriersShipmentBloc());
    gh.factory<_i526.AddressShipmentBloc>(() => _i526.AddressShipmentBloc());
    gh.factory<_i1055.InformationShipmentBloc>(
        () => _i1055.InformationShipmentBloc());
    gh.factory<_i304.RequestShipmentBloc>(() => _i304.RequestShipmentBloc());
    gh.factory<_i778.MoreBloc>(() => _i778.MoreBloc());
    gh.factory<_i199.ProfileBloc>(() => _i199.ProfileBloc());
    gh.factory<_i870.ViewPageBloc>(() => _i870.ViewPageBloc());
    gh.factory<_i925.AddressDetailsBloc>(() => _i925.AddressDetailsBloc());
    gh.factory<_i110.NotificationsBloc>(() => _i110.NotificationsBloc());
    gh.singleton<_i552.AppFlavor>(() => _i552.AppFlavor());
    gh.singleton<_i502.SharedPrefService>(() => _i502.SharedPrefService());
    gh.singleton<_i275.LoggedInService>(() => _i275.LoggedInService());
    gh.singleton<_i355.NavigationService>(() => _i355.NavigationService());
    gh.singleton<_i361.Dio>(() => injectableModule.dio);
    gh.singleton<_i711.Openapi>(() => injectableModule.openapi);
    gh.lazySingleton<_i801.SayeerOpenAPIConfig>(
        () => _i801.SayeerOpenAPIConfig(sayeerOpenapi: gh<_i711.Openapi>()));
    gh.lazySingleton<_i801.OpenAPIConfig>(
        () => _i801.OpenAPIConfig(openapi: gh<_i711.Openapi>()));
    gh.factory<_i335.AddEditAddressInfoRepo>(() => _i419.AddEditAddressInfoRepoImpl());
    gh.lazySingleton<_i919.NetworkInfo>(() => _i919.NetworkInfoImpl());
    gh.lazySingleton<_i151.ApiConsumer>(
        () => _i9.DioConsumer(client: gh<_i361.Dio>()));
    gh.lazySingleton<_i970.OpenapiInterceptors>(
        () => _i970.OpenapiInterceptors(client: gh<_i361.Dio>()));
    gh.lazySingleton<_i1059.AppInterceptors>(
        () => _i1059.AppInterceptors(client: gh<_i361.Dio>()));
    gh.factory<_i173.AddAddressInfoRDS>(() =>
        _i500.AddAddressInfoRDSImpl(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i389.VerifyOtpRDS>(
        () => _i23.VerifyOtpRDSImpl(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i211.AddressesBookRDS>(
        () => _i788.AddressesBookRDSImpl(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i927.RefreshToken>(
        () => _i927.RefreshToken(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i618.StoreInfoRDS>(
        () => _i764.StoreInfoRDSImpl(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i689.VerifyOtpRepo>(() => _i408.VerifyOtpRepoImpl(
          verifyOtpRDSImpl: gh<_i389.VerifyOtpRDS>(),
          openAPIConfig: gh<_i801.OpenAPIConfig>(),
        ));
    gh.factory<_i400.LogInRDS>(
        () => _i211.LogInRDSImpl(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i787.SubmitAddressInfoUseCase>(() =>
        _i787.SubmitAddressInfoUseCase(
            addAddressInfoRepoImpl: gh<_i335.AddEditAddressInfoRepo>()));
    gh.factory<_i254.GetAreasUseCase>(() => _i254.GetAreasUseCase(
        addAddressInfoRepoImpl: gh<_i335.AddEditAddressInfoRepo>()));
    gh.factory<_i402.GetGovernoratesUseCase>(() => _i402.GetGovernoratesUseCase(
        addAddressInfoRepoImpl: gh<_i335.AddEditAddressInfoRepo>()));
    gh.factory<_i133.GetCountriesUseCase>(() => _i133.GetCountriesUseCase(
        addAddressInfoRepoImpl: gh<_i335.AddEditAddressInfoRepo>()));
    gh.factory<_i555.GetCitiesUseCase>(() => _i555.GetCitiesUseCase(
        addAddressInfoRepoImpl: gh<_i335.AddEditAddressInfoRepo>()));
    gh.factory<_i648.UpdateAddressUseCase>(() => _i648.UpdateAddressUseCase(
        addAddressInfoRepoImpl: gh<_i335.AddEditAddressInfoRepo>()));
    gh.factory<_i785.BusinessInfoRDS>(
        () => _i882.BusinessInfoRDSImpl(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i635.PersonalInfoRDS>(
        () => _i119.PersonalInfoRDSImpl(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i735.LogInRepo>(() => _i681.LogInRepoImpl(
          logInRDSImpl: gh<_i400.LogInRDS>(),
          openAPIConfig: gh<_i801.OpenAPIConfig>(),
        ));
    gh.factory<_i356.LogInUseCase>(
        () => _i356.LogInUseCase(logInRepoImpl: gh<_i735.LogInRepo>()));
    gh.factory<_i35.ShipmentProvidersRDS>(() =>
        _i638.ShipmentProvidersRDSImpl(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i369.AddressWidgetsRDS>(() =>
        _i254.AddressWidgetsRDSImpl(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i609.UserCardRDS>(
        () => _i64.UserCardRDSImpl(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i191.AddressWidgetsBloc>(() => _i191.AddressWidgetsBloc(
          getCitiesUseCase: gh<_i555.GetCitiesUseCase>(),
          getCountriesUseCase: gh<_i133.GetCountriesUseCase>(),
          getGovernoratesUseCase: gh<_i402.GetGovernoratesUseCase>(),
          getAreasUseCase: gh<_i254.GetAreasUseCase>(),
        ));
    gh.factory<_i29.AddressesBookRepo>(() => _i292.AddressesBookRepoImpl(
        addressesBookRDSImpl: gh<_i211.AddressesBookRDS>()));
    gh.factory<_i192.BusinessInfoRepo>(() => _i655.BusinessInfoRepoImpl(
        businessInfoRDSImpl: gh<_i785.BusinessInfoRDS>()));
    gh.factory<_i99.HomeRDS>(
        () => _i322.HomeRDSImpl(apiConsumer: gh<_i151.ApiConsumer>()));
    gh.factory<_i586.HomeRepo>(
        () => _i168.HomeRepoImpl(homeRDSImpl: gh<_i99.HomeRDS>()));
    gh.factory<_i73.AddEditAddressBloc>(() => _i73.AddEditAddressBloc(
          submitAddressInfoUseCase: gh<_i787.SubmitAddressInfoUseCase>(),
          getCountriesUseCase: gh<_i133.GetCountriesUseCase>(),
          getGovernoratesUseCase: gh<_i402.GetGovernoratesUseCase>(),
          getCitiesUseCase: gh<_i555.GetCitiesUseCase>(),
          updateAddressUseCase: gh<_i648.UpdateAddressUseCase>(),
          getAreasUseCase: gh<_i254.GetAreasUseCase>(),
        ));
    gh.factory<_i233.ConfirmLogInUseCase>(() => _i233.ConfirmLogInUseCase(
        verifyOtpRepoImpl: gh<_i689.VerifyOtpRepo>()));
    gh.factory<_i599.StoreInfoRepo>(() =>
        _i656.StoreInfoRepoImpl(storeInfoRDSImpl: gh<_i618.StoreInfoRDS>()));
    gh.factory<_i68.UserCardRepo>(
        () => _i671.UserCardRepoImpl(userCardRDSImpl: gh<_i609.UserCardRDS>()));
    gh.factory<_i736.UserCardUseCase>(
        () => _i736.UserCardUseCase(userCardRepoImpl: gh<_i68.UserCardRepo>()));
    gh.factory<_i934.PersonalInfoRepo>(() => _i34.PersonalInfoRepoImpl(
        personalInfoRDSImpl: gh<_i635.PersonalInfoRDS>()));
    gh.factory<_i32.SubmitPersonalInfoUseCase>(() =>
        _i32.SubmitPersonalInfoUseCase(
            personalInfoRepoImpl: gh<_i934.PersonalInfoRepo>()));
    gh.factory<_i260.UserCardBloc>(
        () => _i260.UserCardBloc(userCardUseCase: gh<_i736.UserCardUseCase>()));
    gh.factory<_i22.LogInBloc>(
        () => _i22.LogInBloc(logInUseCase: gh<_i356.LogInUseCase>()));
    gh.factory<_i410.PersonalInfoBloc>(() => _i410.PersonalInfoBloc(
        submitPersonalInfoUseCase: gh<_i32.SubmitPersonalInfoUseCase>()));
    gh.factory<_i613.VerifyOtpBloc>(() => _i613.VerifyOtpBloc(
          logInUseCase: gh<_i356.LogInUseCase>(),
          confirmLogInUseCase: gh<_i233.ConfirmLogInUseCase>(),
        ));
    gh.factory<_i1030.AddressWidgetsRepo>(() => _i572.AddressWidgetsRepoImpl(
        addressWidgetsRDSImpl: gh<_i369.AddressWidgetsRDS>()));
    gh.factory<_i44.GetAddressesUseCase>(() => _i44.GetAddressesUseCase(
        addressesBookRepoImpl: gh<_i29.AddressesBookRepo>()));
    gh.factory<_i401.EditAddressesUseCase>(() => _i401.EditAddressesUseCase(
        addressesBookRepoImpl: gh<_i29.AddressesBookRepo>()));
    gh.factory<_i180.DeleteAddressesUseCase>(() => _i180.DeleteAddressesUseCase(
        addressesBookRepoImpl: gh<_i29.AddressesBookRepo>()));
    gh.factory<_i396.SubmitBusinessInfoUseCase>(() =>
        _i396.SubmitBusinessInfoUseCase(
            businessInfoRepoImpl: gh<_i192.BusinessInfoRepo>()));
    gh.factory<_i736.SubmitStoreInfoUseCase>(() => _i736.SubmitStoreInfoUseCase(
        storeInfoRepoImpl: gh<_i599.StoreInfoRepo>()));
    gh.factory<_i377.ShipmentProvidersRepo>(() =>
        _i995.ShipmentProvidersRepoImpl(
            shipmentProvidersRDS: gh<_i35.ShipmentProvidersRDS>()));
    gh.factory<_i684.BusinessInfoBloc>(() => _i684.BusinessInfoBloc(
        submitBusinessInfoUseCase: gh<_i396.SubmitBusinessInfoUseCase>()));
    gh.factory<_i689.GetUserProfileUseCase>(
        () => _i689.GetUserProfileUseCase(homeRepoImpl: gh<_i586.HomeRepo>()));
    gh.factory<_i620.StoreInfoBloc>(() => _i620.StoreInfoBloc(
        submitStoreInfoUseCase: gh<_i736.SubmitStoreInfoUseCase>()));
    gh.factory<_i248.HomeBloc>(() => _i248.HomeBloc(
        getUserProfileUseCase: gh<_i689.GetUserProfileUseCase>()));
    gh.factory<_i138.AddressesBookBloc>(() => _i138.AddressesBookBloc(
          getAddressesUseCase: gh<_i44.GetAddressesUseCase>(),
          getCountriesUseCase: gh<_i133.GetCountriesUseCase>(),
          getGovernoratesUseCase: gh<_i402.GetGovernoratesUseCase>(),
          getCitiesUseCase: gh<_i555.GetCitiesUseCase>(),
          editAddressesUseCase: gh<_i401.EditAddressesUseCase>(),
          deleteAddressesUseCase: gh<_i180.DeleteAddressesUseCase>(),
        ));
    gh.factory<_i897.GetShipmentProvidersUseCase>(() =>
        _i897.GetShipmentProvidersUseCase(
            shipmentProvidersRepo: gh<_i377.ShipmentProvidersRepo>()));
    gh.factory<_i135.ShipmentProvidersBloc>(() => _i135.ShipmentProvidersBloc(
        getShipmentProvidersUseCase: gh<_i897.GetShipmentProvidersUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i847.InjectableModule {}
