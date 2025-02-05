part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class InitHome extends HomeEvent {
  @override
  List<Object> get props => [];
}

class RefreshEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class GetTotalStatusShipmentsCount extends HomeEvent {
  final DateRangeDto dataRangeDto;

  const GetTotalStatusShipmentsCount({required this.dataRangeDto});

  @override
  List<Object> get props => [
        dataRangeDto,
      ];
}

class GetTotalShipmentsPerDays extends HomeEvent {
  final DateRangeDto dataRangeDto;

  const GetTotalShipmentsPerDays({required this.dataRangeDto});

  @override
  List<Object> get props => [
        dataRangeDto,
      ];
}

class GetTotalPaidPerDays extends HomeEvent {
  final DateRangeDto dataRangeDto;

  const GetTotalPaidPerDays({required this.dataRangeDto});

  @override
  List<Object> get props => [
        dataRangeDto,
      ];
}

class GetAdminTotalStatusShipmentsCount extends HomeEvent {
  final DateRangeDto dataRangeDto;

  const GetAdminTotalStatusShipmentsCount({required this.dataRangeDto});

  @override
  List<Object> get props => [
    dataRangeDto,
  ];
}

class GetAdminTotalShipmentsPerDays extends HomeEvent {
  final DateRangeDto dataRangeDto;

  const GetAdminTotalShipmentsPerDays({required this.dataRangeDto});

  @override
  List<Object> get props => [
    dataRangeDto,
  ];
}

class GetAdminTotalPaidPerDays extends HomeEvent {
  final DateRangeDto dataRangeDto;

  const GetAdminTotalPaidPerDays({required this.dataRangeDto});

  @override
  List<Object> get props => [
    dataRangeDto,
  ];
}
