part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final StateHelper stateHelper;
  final HomeStateHelper shipmentsCountStateHelper;
  final HomeStateHelper shipmentsChartStateHelper;
  final HomeStateHelper paidAmountsChartStateHelper;
  final ClientGetDto? clientDto;
  final ShipmentsCountResponse? shipmentsCountResponse;
  final CountPerDateResponse? totalShipmentsPerDaysList;
  final AmountPerDateResponse? totalPaidPerDaysList;
  final ShipmentsCountResponseLAdmin? adminShipmentsCountResponse;

  const HomeState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
    this.shipmentsCountStateHelper = const HomeStateHelper(requestState: HomeRequestState.LOADING_SHIPMENTS_COUNT),
    this.shipmentsChartStateHelper =
        const HomeStateHelper(requestState: HomeRequestState.LOADING_SHIPMENTS_COUNT_PER_DAY),
    this.paidAmountsChartStateHelper = const HomeStateHelper(requestState: HomeRequestState.LOADING_PAID_COUNT_PER_DAY),
    this.clientDto,
    this.shipmentsCountResponse,
    this.totalShipmentsPerDaysList,
    this.totalPaidPerDaysList,
    this.adminShipmentsCountResponse,
  });

  HomeState copyWith({
    StateHelper? stateHelper,
    HomeStateHelper? shipmentsCountStateHelper,
    HomeStateHelper? shipmentsChartStateHelper,
    HomeStateHelper? paidAmountsChartStateHelper,
    ClientGetDto? clientDto,
    ShipmentsCountResponse? shipmentsCountResponse,
    CountPerDateResponse? totalShipmentsPerDaysList,
    AmountPerDateResponse? totalPaidPerDaysList,
    ShipmentsCountResponseLAdmin? adminShipmentsCountResponse,
  }) {
    return HomeState(
      stateHelper: stateHelper ?? this.stateHelper,
      shipmentsCountStateHelper: shipmentsCountStateHelper ?? this.shipmentsCountStateHelper,
      shipmentsChartStateHelper: shipmentsChartStateHelper ?? this.shipmentsChartStateHelper,
      paidAmountsChartStateHelper: paidAmountsChartStateHelper ?? this.paidAmountsChartStateHelper,
      clientDto: clientDto ?? this.clientDto,
      shipmentsCountResponse: shipmentsCountResponse ?? this.shipmentsCountResponse,
      totalShipmentsPerDaysList: totalShipmentsPerDaysList ?? this.totalShipmentsPerDaysList,
      totalPaidPerDaysList: totalPaidPerDaysList ?? this.totalPaidPerDaysList,
      adminShipmentsCountResponse: adminShipmentsCountResponse ?? this.adminShipmentsCountResponse,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        shipmentsCountStateHelper,
        shipmentsChartStateHelper,
        paidAmountsChartStateHelper,
        clientDto,
        shipmentsCountResponse,
        totalShipmentsPerDaysList,
        totalPaidPerDaysList,
        adminShipmentsCountResponse,
      ];
}
