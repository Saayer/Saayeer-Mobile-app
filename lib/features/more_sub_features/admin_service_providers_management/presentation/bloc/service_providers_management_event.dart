part of 'service_providers_management_bloc.dart';

abstract class ServiceProvidersManagementEvent extends Equatable {
  const ServiceProvidersManagementEvent();
}

class GetServiceProvidersList extends ServiceProvidersManagementEvent {
  const GetServiceProvidersList();

  @override
  List<Object> get props => [];
}

class UpdateServiceProvider extends ServiceProvidersManagementEvent {
  final LogisticServicePostDto logisticServicePostDto;

  const UpdateServiceProvider({required this.logisticServicePostDto});

  @override
  List<Object> get props => [
        logisticServicePostDto,
      ];
}
