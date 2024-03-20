part of 'shipment_specs_bloc.dart';

class ShipmentSpecsState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final ShipmentSpecsEntity? shipmentSpecsEntity;
  final ShipmentSpecsISubmitnfoEntity? shipmentSpecsInfoEntity;

  const ShipmentSpecsState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.autoValidateMode = AutovalidateMode.disabled,
      this.shipmentSpecsEntity,
      this.shipmentSpecsInfoEntity});

  ShipmentSpecsState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    ShipmentSpecsEntity? shipmentSpecsEntity,
    ShipmentSpecsISubmitnfoEntity? shipmentSpecsInfoEntity,
  }) {
    return ShipmentSpecsState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      shipmentSpecsEntity: shipmentSpecsEntity ?? this.shipmentSpecsEntity,
      shipmentSpecsInfoEntity:
          shipmentSpecsInfoEntity ?? this.shipmentSpecsInfoEntity,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        shipmentSpecsEntity,
        shipmentSpecsInfoEntity,
      ];
}
