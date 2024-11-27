part of 'shipping_partners_bloc.dart';

@immutable
class ShippingPartnersState extends Equatable {
  final StateHelper stateHelper;
  final List<LogisticsServiceBase>? shippingPartnersList;

  const ShippingPartnersState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
    this.shippingPartnersList,
  });

  ShippingPartnersState copyWith({
    StateHelper? stateHelper,
    List<LogisticsServiceBase>? shippingPartnersList,
  }) {
    return ShippingPartnersState(
      stateHelper: stateHelper ?? this.stateHelper,
      shippingPartnersList: shippingPartnersList ?? this.shippingPartnersList,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        shippingPartnersList,
      ];
}
