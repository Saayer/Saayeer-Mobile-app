import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/domain/usecases/get_service_providers_list_usecase.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/domain/usecases/update_service_provider_usecase.dart';

part 'service_providers_management_event.dart';

part 'service_providers_management_state.dart';

@Injectable()
class ServiceProvidersManagementBloc extends Bloc<ServiceProvidersManagementEvent, ServiceProvidersManagementState> {
  final GetServiceProvidersListUseCase getServiceProvidersListUseCase;
  final UpdateServiceProviderUsecase updateServiceProviderUsecase;

  ServiceProvidersManagementBloc({
    required this.getServiceProvidersListUseCase,
    required this.updateServiceProviderUsecase,
  }) : super(const ServiceProvidersManagementState()) {
    on<GetServiceProvidersList>(_getServiceProvidersList);
    on<UpdateServiceProvider>(_updateServiceProvider);
  }

  ///
  List<LogisticServiceGetDto> serviceProvidersList = [];

  Future<void> _getServiceProvidersList(
      GetServiceProvidersList event, Emitter<ServiceProvidersManagementState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await getServiceProvidersListUseCase(const NoParameters()).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper.copyWith(
                requestState: RequestState.ERROR,
                errorStatus: ServiceProvidersManagementErrorStatus.ERROR_GET_SERVICE_PROVIDERS)));
      } else {
        final List<LogisticServiceGetDto>? rightResult = (result as Right).value;

        if (rightResult != null) {
          emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: "")));

          serviceProvidersList = rightResult;
          emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
            serviceProvidersList: serviceProvidersList,
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR,
                errorStatus: ServiceProvidersManagementErrorStatus.ERROR_GET_SERVICE_PROVIDERS),
          ));
        }
      }
    });
  }

  FutureOr<void> _updateServiceProvider(
      UpdateServiceProvider event, Emitter<ServiceProvidersManagementState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await updateServiceProviderUsecase(event.logisticServicePostDto).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper.copyWith(
                requestState: RequestState.ERROR,
                errorStatus: ServiceProvidersManagementErrorStatus.ERROR_UPDATE_SERVICE_PROVIDER)));
      } else {
        emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: "")));
        add(const GetServiceProvidersList());
      }
    });
  }
}
