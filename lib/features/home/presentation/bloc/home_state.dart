part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final StateHelper stateHelper;
  final ClientGetDto? clientDto;
  final ShipmentsCountResponse? shipmentsCountResponse;
  final CountPerDateResponse? totalShipmentsPerDaysList;
  final AmountPerDateResponse? totalPaidPerDaysList;

  const HomeState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
    this.clientDto,
    this.shipmentsCountResponse,
    this.totalShipmentsPerDaysList,
    this.totalPaidPerDaysList,
  });

  HomeState copyWith({
    StateHelper? stateHelper,
    ClientGetDto? clientDto,
    ShipmentsCountResponse? shipmentsCountResponse,
    CountPerDateResponse? totalShipmentsPerDaysList,
    AmountPerDateResponse? totalPaidPerDaysList,
  }) {
    return HomeState(
      stateHelper: stateHelper ?? this.stateHelper,
      clientDto: clientDto ?? this.clientDto,
      shipmentsCountResponse: shipmentsCountResponse ?? this.shipmentsCountResponse,
      totalShipmentsPerDaysList: totalShipmentsPerDaysList ?? this.totalShipmentsPerDaysList,
      totalPaidPerDaysList: totalPaidPerDaysList ?? this.totalPaidPerDaysList,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        clientDto,
        shipmentsCountResponse,
        totalShipmentsPerDaysList,
        totalPaidPerDaysList,
      ];
}
