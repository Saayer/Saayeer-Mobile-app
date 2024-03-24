part of 'add_address_bloc.dart';

@immutable
class AddAddressState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final AddressInfoEntity? addressInfoEntity;
  final SubmitAddressInfoEntity? submitAddressInfoEntity;
  final bool? isAddShipmentRequest;

  const AddAddressState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.autoValidateMode = AutovalidateMode.disabled,
    this.addressInfoEntity,
    this.submitAddressInfoEntity,
    this.isAddShipmentRequest,
  });

  AddAddressState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    AddressInfoEntity? addressInfoEntity,
    SubmitAddressInfoEntity? submitAddressInfoEntity,
    bool? isAddShipmentRequest,
  }) {
    return AddAddressState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      addressInfoEntity: addressInfoEntity ?? this.addressInfoEntity,
      submitAddressInfoEntity:
          submitAddressInfoEntity ?? this.submitAddressInfoEntity,
      isAddShipmentRequest: isAddShipmentRequest ?? this.isAddShipmentRequest,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        addressInfoEntity,
        submitAddressInfoEntity,
        isAddShipmentRequest,
      ];
}
