part of 'shipment_payment_bloc.dart';

@immutable
class ShipmentPaymentState extends Equatable {
  final StateHelper stateHelper;
  final ShipmentGetDto? shipmentGetDto;

  const ShipmentPaymentState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
    this.shipmentGetDto,
  });

  ShipmentPaymentState copyWith({
    StateHelper? stateHelper,
    ShipmentGetDto? shipmentGetDto,
  }) {
    return ShipmentPaymentState(
      stateHelper: stateHelper ?? this.stateHelper,
      shipmentGetDto: shipmentGetDto ?? this.shipmentGetDto,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        shipmentGetDto,
      ];
}
