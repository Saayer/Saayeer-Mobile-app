// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i21;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:saayer/core/API/api_client.dart' as _i61;
import 'package:saayer/core/API/api_consumer.dart' as _i60;
import 'package:saayer/core/API/api_interceptors.dart' as _i62;
import 'package:saayer/core/network/network_info.dart' as _i42;
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart'
    as _i39;
import 'package:saayer/core/services/current_user/logged_in_service.dart'
    as _i40;
import 'package:saayer/core/services/deep_link/firebase_deep_link.dart'
    as _i24;
import 'package:saayer/core/services/encryption/encryption.dart' as _i22;
import 'package:saayer/core/services/injection/injectable_modules.dart'
    as _i87;
import 'package:saayer/core/services/local_storage/secure_storage_service.dart'
    as _i47;
import 'package:saayer/core/services/local_storage/shared_pref_service.dart'
    as _i55;
import 'package:saayer/core/services/navigation/navigation_service.dart'
    as _i41;
import 'package:saayer/features/activity/add_activity_details/data/data_sources/add_activity_details_RDS.dart'
    as _i85;
import 'package:saayer/features/activity/add_activity_details/data/data_sources/add_activity_details_RDS_impl.dart'
    as _i86;
import 'package:saayer/features/activity/add_activity_details/data/repositories/add_activity_details_repo_impl.dart'
    as _i4;
import 'package:saayer/features/activity/add_activity_details/domain/repositories/add_activity_details_repo.dart'
    as _i3;
import 'package:saayer/features/activity/add_activity_details/domain/use_cases/create_activity_usecase.dart'
    as _i20;
import 'package:saayer/features/activity/add_activity_details/domain/use_cases/get_activity_format_list_usecase.dart'
    as _i25;
import 'package:saayer/features/circle/circle_answers/data/data_sources/remote/circle_answers_RDS.dart'
    as _i63;
import 'package:saayer/features/circle/circle_answers/data/data_sources/remote/circle_answers_RDS_impl.dart'
    as _i64;
import 'package:saayer/features/circle/circle_answers/data/repositories/circle_answers_repo_impl.dart'
    as _i6;
import 'package:saayer/features/circle/circle_answers/domain/repositories/circle_answers_repo.dart'
    as _i5;
import 'package:saayer/features/circle/circle_answers/domain/use_cases/get_answers_usecase.dart'
    as _i26;
import 'package:saayer/features/circle/circle_memberships/data/data_sources/remote/circle_memberships_RDS.dart'
    as _i67;
import 'package:saayer/features/circle/circle_memberships/data/data_sources/remote/circle_memberships_RDS_impl.dart'
    as _i68;
import 'package:saayer/features/circle/circle_memberships/data/repositories/circle_memberships_repo_impl.dart'
    as _i10;
import 'package:saayer/features/circle/circle_memberships/domain/repositories/circle_memberships_repo.dart'
    as _i9;
import 'package:saayer/features/circle/circle_memberships/domain/use_cases/finish_joining_circle_usecase.dart'
    as _i23;
import 'package:saayer/features/circle/circle_memberships/domain/use_cases/get_circle_memberships_usecase.dart'
    as _i31;
import 'package:saayer/features/circle/circle_memberships/domain/use_cases/select_circle_membership_usecase.dart'
    as _i49;
import 'package:saayer/features/circle/circle_questions/data/data_sources/remote/circle_questions_RDS.dart'
    as _i69;
import 'package:saayer/features/circle/circle_questions/data/data_sources/remote/circle_questions_RDS_impl.dart'
    as _i70;
import 'package:saayer/features/circle/circle_questions/data/repositories/circle_questions_repo_impl.dart'
    as _i12;
import 'package:saayer/features/circle/circle_questions/domain/repositories/circle_questions_repo.dart'
    as _i11;
import 'package:saayer/features/circle/circle_questions/domain/use_cases/submit_answers_usecase.dart'
    as _i57;
import 'package:saayer/features/circle/circle_users/data/data_sources/remote/circle_users_RDS.dart'
    as _i71;
import 'package:saayer/features/circle/circle_users/data/data_sources/remote/circle_users_RDS_impl.dart'
    as _i72;
import 'package:saayer/features/circle/circle_users/data/repositories/circle_users_repo_impl.dart'
    as _i14;
import 'package:saayer/features/circle/circle_users/domain/repositories/circle_users_repo.dart'
    as _i13;
import 'package:saayer/features/circle/circle_users/domain/use_cases/remove_member_usecase.dart'
    as _i45;
import 'package:saayer/features/circle/circle_users/domain/use_cases/respond_to_request_usecase.dart'
    as _i46;
import 'package:saayer/features/circle/circle_users/domain/use_cases/show_circle_user_profile_usecase.dart'
    as _i56;
import 'package:saayer/features/circle/circles/data/data_sources/remote/circles_RDS.dart'
    as _i73;
import 'package:saayer/features/circle/circles/data/data_sources/remote/circles_RDS_impl.dart'
    as _i74;
import 'package:saayer/features/circle/circles/data/repositories/circles_repo_impl.dart'
    as _i16;
import 'package:saayer/features/circle/circles/domain/repositories/circles_repo.dart'
    as _i15;
import 'package:saayer/features/circle/circles/domain/use_cases/get_circles_usecase.dart'
    as _i29;
import 'package:saayer/features/circle/view_circle_details/data/data_sources/remote/circle_details_RDS.dart'
    as _i65;
import 'package:saayer/features/circle/view_circle_details/data/data_sources/remote/circle_details_RDS_impl.dart'
    as _i66;
import 'package:saayer/features/circle/view_circle_details/data/repositories/circle_details_repo_impl.dart'
    as _i8;
import 'package:saayer/features/circle/view_circle_details/domain/repositories/circle_details_repo.dart'
    as _i7;
import 'package:saayer/features/circle/view_circle_details/domain/use_cases/get_circle_details_usecase.dart'
    as _i28;
import 'package:saayer/features/circle/view_circle_details/domain/use_cases/join_circle_action_usecase.dart'
    as _i35;
import 'package:saayer/features/circle/view_circle_details/domain/use_cases/set_circle_action_usecase.dart'
    as _i58;
import 'package:saayer/features/circle/view_circle_details/domain/use_cases/withdraw_circle_request_usecase.dart'
    as _i59;
import 'package:saayer/features/create_account/data/data_sources/remote/create_account_RDS.dart'
    as _i75;
import 'package:saayer/features/create_account/data/data_sources/remote/create_account_RDS_impl.dart'
    as _i76;
import 'package:saayer/features/create_account/data/repositories/create_account_repo_impl.dart'
    as _i18;
import 'package:saayer/features/create_account/domain/repositories/create_account_repo.dart'
    as _i17;
import 'package:saayer/features/create_account/domain/use_cases/create_account_usecase.dart'
    as _i19;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart'
    as _i77;
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS_impl.dart'
    as _i78;
import 'package:saayer/features/log_in/data/repositories/log_in_repo_impl.dart'
    as _i37;
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart'
    as _i36;
import 'package:saayer/features/log_in/domain/use_cases/log_in_usecase.dart'
    as _i38;
import 'package:saayer/features/profile/data/data_sources/remote/profile_RDS.dart'
    as _i79;
import 'package:saayer/features/profile/data/data_sources/remote/profile_RDS_impl.dart'
    as _i80;
import 'package:saayer/features/profile/data/repositories/profile_repo_impl.dart'
    as _i44;
import 'package:saayer/features/profile/domain/repositories/profile_repo.dart'
    as _i43;
import 'package:saayer/features/profile/domain/use_cases/get_profile_usecase.dart'
    as _i32;
import 'package:saayer/features/profile/domain/use_cases/get_user_areas_list_usecase.dart'
    as _i33;
import 'package:saayer/features/profile/domain/use_cases/get_user_interests_list_usecase.dart'
    as _i34;
import 'package:saayer/features/select_your_area/data/data_sources/remote/select_your_area_RDS.dart'
    as _i81;
import 'package:saayer/features/select_your_area/data/data_sources/remote/select_your_area_RDS_impl.dart'
    as _i82;
import 'package:saayer/features/select_your_area/data/repositories/select_your_area_repo_impl.dart'
    as _i52;
import 'package:saayer/features/select_your_area/domain/repositories/select_your_area_repo.dart'
    as _i51;
import 'package:saayer/features/select_your_area/domain/use_cases/get_areas_list_usecase.dart'
    as _i27;
import 'package:saayer/features/select_your_area/domain/use_cases/select_areas_list_usecase.dart'
    as _i48;
import 'package:saayer/features/select_your_interests/data/data_sources/remote/select_your_interest_RDS.dart'
    as _i83;
import 'package:saayer/features/select_your_interests/data/data_sources/remote/select_your_interest_RDS_impl.dart'
    as _i84;
import 'package:saayer/features/select_your_interests/data/repositories/select_your_interest_repo_impl.dart'
    as _i54;
import 'package:saayer/features/select_your_interests/domain/repositories/select_your_interest_repo.dart'
    as _i53;
import 'package:saayer/features/select_your_interests/domain/use_cases/get_interests_list_usecase.dart'
    as _i30;
import 'package:saayer/features/select_your_interests/domain/use_cases/select_interests_list_usecase.dart'
    as _i50;

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
    gh.lazySingleton<_i3.AddActivityDetailsRepo>(
        () => _i4.AddActivityDetailsRepoImpl());
    gh.lazySingleton<_i5.CircleAnswersRepo>(() => _i6.CircleAnswersRepoImpl());
    gh.lazySingleton<_i7.CircleDetailsRepo>(() => _i8.CircleDetailsRepoImpl());
    gh.lazySingleton<_i9.CircleMembershipsRepo>(
        () => _i10.CircleMembershipsRepoImpl());
    gh.lazySingleton<_i11.CircleQuestionsRepo>(
        () => _i12.CircleQuestionsRepoImpl());
    gh.lazySingleton<_i13.CircleUsersRepo>(() => _i14.CircleUsersRepoImpl());
    gh.lazySingleton<_i15.CirclesRepo>(() => _i16.CirclesRepoImpl());
    gh.lazySingleton<_i17.CreateAccountRepo>(
        () => _i18.CreateAccountRepoImpl());
    gh.lazySingleton<_i19.CreateAccountUseCase>(
        () => _i19.CreateAccountUseCase());
    gh.lazySingleton<_i20.CreateActivityUseCase>(
        () => _i20.CreateActivityUseCase());
    gh.singleton<_i21.Dio>(injectableModule.dio);
    gh.singleton<_i22.Encryption>(_i22.Encryption());
    gh.lazySingleton<_i23.FinishJoiningCircleUseCase>(
        () => _i23.FinishJoiningCircleUseCase());
    gh.lazySingleton<_i24.FirebaseDeepLink>(() => _i24.FirebaseDeepLink());
    gh.lazySingleton<_i25.GetActivityFormatListUseCase>(
        () => _i25.GetActivityFormatListUseCase());
    gh.lazySingleton<_i26.GetAnswersUseCase>(() => _i26.GetAnswersUseCase());
    gh.lazySingleton<_i27.GetAreasListUseCase>(
        () => _i27.GetAreasListUseCase());
    gh.lazySingleton<_i28.GetCircleDetailsUseCase>(
        () => _i28.GetCircleDetailsUseCase());
    gh.lazySingleton<_i29.GetCirclesUseCase>(() => _i29.GetCirclesUseCase());
    gh.lazySingleton<_i30.GetInterestsListUseCase>(
        () => _i30.GetInterestsListUseCase());
    gh.lazySingleton<_i31.GetMembershipsUseCase>(
        () => _i31.GetMembershipsUseCase());
    gh.lazySingleton<_i32.GetProfileUseCase>(() => _i32.GetProfileUseCase());
    gh.lazySingleton<_i33.GetUserAreasListUseCase>(
        () => _i33.GetUserAreasListUseCase());
    gh.lazySingleton<_i34.GetUserInterestsListUseCase>(
        () => _i34.GetUserInterestsListUseCase());
    gh.lazySingleton<_i35.JoinCircleUseCase>(() => _i35.JoinCircleUseCase());
    gh.lazySingleton<_i36.LogInRepo>(() => _i37.LogInRepoImpl());
    gh.lazySingleton<_i38.LogInUseCase>(() => _i38.LogInUseCase());
    gh.singleton<_i39.LoggedInCheckerService>(_i39.LoggedInCheckerService());
    gh.singleton<_i40.LoggedInService>(_i40.LoggedInService());
    gh.singleton<_i41.NavigationService>(_i41.NavigationService());
    gh.lazySingleton<_i42.NetworkInfo>(() => _i42.NetworkInfoImpl());
    gh.lazySingleton<_i43.ProfileRepo>(() => _i44.ProfileRepoImpl());
    gh.lazySingleton<_i45.RemoveMemberUseCase>(
        () => _i45.RemoveMemberUseCase());
    gh.lazySingleton<_i46.RespondToRequestUseCase>(
        () => _i46.RespondToRequestUseCase());
    gh.singleton<_i47.SecureStorageService>(_i47.SecureStorageService());
    gh.lazySingleton<_i48.SelectAreasListUseCase>(
        () => _i48.SelectAreasListUseCase());
    gh.lazySingleton<_i49.SelectCircleMembershipUseCase>(
        () => _i49.SelectCircleMembershipUseCase());
    gh.lazySingleton<_i50.SelectInterestsListUseCase>(
        () => _i50.SelectInterestsListUseCase());
    gh.lazySingleton<_i51.SelectYourAreaRepo>(
        () => _i52.SelectYourAreaRepoImpl());
    gh.lazySingleton<_i53.SelectYourInterestRepo>(
        () => _i54.SelectYourInterestRepoImpl());
    gh.singleton<_i55.SharedPrefService>(_i55.SharedPrefService());
    gh.lazySingleton<_i56.ShowCircleUserProfileUseCase>(
        () => _i56.ShowCircleUserProfileUseCase());
    gh.lazySingleton<_i57.SubmitAnswersUseCase>(
        () => _i57.SubmitAnswersUseCase());
    gh.lazySingleton<_i58.UnjoinCircleUseCase>(
        () => _i58.UnjoinCircleUseCase());
    gh.lazySingleton<_i59.WithdrawCircleRequestUseCase>(
        () => _i59.WithdrawCircleRequestUseCase());
    gh.lazySingleton<_i60.ApiConsumer>(
        () => _i61.DioConsumer(client: gh<_i21.Dio>()));
    gh.lazySingleton<_i62.AppInterceptors>(
        () => _i62.AppInterceptors(client: gh<_i21.Dio>()));
    gh.lazySingleton<_i63.CircleAnswersRDS>(
        () => _i64.CircleAnswersRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    gh.lazySingleton<_i65.CircleDetailsRDS>(
        () => _i66.CircleDetailsRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    gh.lazySingleton<_i67.CircleMembershipsRDS>(() =>
        _i68.CircleMembershipsRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    gh.lazySingleton<_i69.CircleQuestionsRDS>(
        () => _i70.CircleQuestionsRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    gh.lazySingleton<_i71.CircleUsersRDS>(
        () => _i72.CircleUsersRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    gh.lazySingleton<_i73.CirclesRDS>(
        () => _i74.CirclesRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    gh.lazySingleton<_i75.CreateAccountRDS>(
        () => _i76.CreateAccountRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    gh.lazySingleton<_i77.LogInRDS>(
        () => _i78.LogInRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    gh.lazySingleton<_i79.ProfileRDS>(
        () => _i80.ProfileRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    gh.lazySingleton<_i81.SelectYourAreaRDS>(
        () => _i82.SelectYourAreaRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    gh.lazySingleton<_i83.SelectYourInterestRDS>(() =>
        _i84.SelectYourInterestRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    gh.lazySingleton<_i85.AddActivityDetailsRDS>(() =>
        _i86.AddActivityDetailsRDSImpl(apiConsumer: gh<_i60.ApiConsumer>()));
    return this;
  }
}

class _$InjectableModule extends _i87.InjectableModule {}
