part of 'service_providers_management_bloc.dart';

@immutable
class ServiceProvidersManagementState extends Equatable {
  final StateHelper stateHelper;
  final List<LogisticServiceGetDto>? serviceProvidersList;

  const ServiceProvidersManagementState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.serviceProvidersList,
  });

  ServiceProvidersManagementState copyWith({
    StateHelper? stateHelper,
    List<LogisticServiceGetDto>? serviceProvidersList,
  }) {
    return ServiceProvidersManagementState(
      stateHelper: stateHelper ?? this.stateHelper,
      serviceProvidersList: serviceProvidersList ?? this.serviceProvidersList,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        serviceProvidersList,
      ];
}
