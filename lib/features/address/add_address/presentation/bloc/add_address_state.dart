part of 'add_address_bloc.dart';

@immutable
class AddAddressState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final CustomerAddDto? addressInfoEntity;
  final CustomerGetDto? submitAddressInfoEntity;
  final bool? isAddShipmentRequest;
  final int? countryId;
  final int? governorateId;
  final int? cityId;

  const AddAddressState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.autoValidateMode = AutovalidateMode.disabled,
      this.addressInfoEntity,
      this.submitAddressInfoEntity,
      this.isAddShipmentRequest,
      this.countryId,
      this.governorateId,
      this.cityId});

  AddAddressState copyWith(
      {StateHelper? stateHelper,
      AutovalidateMode? autoValidateMode,
      CustomerAddDto? addressInfoEntity,
      CustomerGetDto? submitAddressInfoEntity,
      bool? isAddShipmentRequest,
      int? countryId,
      int? governorateId,
      int? cityId}) {
    return AddAddressState(
        stateHelper: stateHelper ?? this.stateHelper,
        autoValidateMode: autoValidateMode ?? this.autoValidateMode,
        addressInfoEntity: addressInfoEntity ?? this.addressInfoEntity,
        submitAddressInfoEntity: submitAddressInfoEntity ?? this.submitAddressInfoEntity,
        isAddShipmentRequest: isAddShipmentRequest ?? this.isAddShipmentRequest,
        countryId: countryId ?? this.countryId,
        governorateId: governorateId ?? this.governorateId,
        cityId: cityId ?? this.cityId);
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        addressInfoEntity,
        submitAddressInfoEntity,
        isAddShipmentRequest,
        countryId,
        governorateId,
        cityId,
      ];
}
