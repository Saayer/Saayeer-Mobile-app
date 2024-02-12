part of 'address_shipment_bloc.dart';

class AddressShipmentState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final AddressShipmenEntity? addressShipmenEntity;
  final SubmitAddressShipmentsEntity? submitAddressShipmentsEntity;

  const AddressShipmentState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.autoValidateMode = AutovalidateMode.disabled,
    this.addressShipmenEntity,
    this.submitAddressShipmentsEntity,
  });

  AddressShipmentState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    AddressShipmenEntity? addressShipmenEntity,
  }) {
    return AddressShipmentState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      addressShipmenEntity: addressShipmenEntity ?? this.addressShipmenEntity,
      submitAddressShipmentsEntity:
          submitAddressShipmentsEntity ?? this.submitAddressShipmentsEntity,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        addressShipmenEntity,
        submitAddressShipmentsEntity,
      ];
}

// class AddressShipmentInitial extends AddressShipmentState {
//   @override
//   List<Object> get props => [];
// }
