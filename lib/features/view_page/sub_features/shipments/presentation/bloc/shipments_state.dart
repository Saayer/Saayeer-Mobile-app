part of 'shipments_bloc.dart';

class ShipmentsState extends Equatable {
  final StateHelper stateHelper;
  final ShipmentsTypes shipmentsType;

  const ShipmentsState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.shipmentsType = ShipmentsTypes.INBOUND});

  ShipmentsState copyWith(
      {StateHelper? stateHelper, ShipmentsTypes? shipmentsType}) {
    return ShipmentsState(
        stateHelper: stateHelper ?? this.stateHelper,
        shipmentsType: shipmentsType ?? this.shipmentsType);
  }

  @override
  List<Object> get props => [stateHelper, shipmentsType];
}
