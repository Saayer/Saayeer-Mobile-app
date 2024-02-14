part of 'shipping_rates_bloc.dart';

@immutable
class ShippingRatesState extends Equatable {
  final StateHelper stateHelper;

  const ShippingRatesState(
      {this.stateHelper =
          const StateHelper(requestState: RequestState.LOADING)});

  ShippingRatesState copyWith({
    StateHelper? stateHelper,
  }) {
    return ShippingRatesState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object> get props => [stateHelper];
}
