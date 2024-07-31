part of 'add_edit_address_bloc.dart';

@immutable
class AddEditAddressState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final CustomerAddDto? addressInfoEntity;
  final CustomerGetDto? submitAddressInfoEntity;
  final bool? isAddShipmentRequest;
  final AddEditAddressType? addEditAddressType;
  final int? countryId;
  final int? governorateId;
  final int? cityId;
  final int? customerId;

  const AddEditAddressState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.addEditAddressType,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.addressInfoEntity,
      this.submitAddressInfoEntity,
      this.isAddShipmentRequest,
      this.countryId,
      this.governorateId,
      this.customerId,
      this.cityId});

  AddEditAddressState copyWith(
      {StateHelper? stateHelper,
      AddEditAddressType? addEditAddressType,
      AutovalidateMode? autoValidateMode,
      CustomerAddDto? addressInfoEntity,
      CustomerGetDto? submitAddressInfoEntity,
      bool? isAddShipmentRequest,
      int? countryId,
      int? governorateId,
      int? customerId,
      int? cityId}) {
    return AddEditAddressState(
        stateHelper: stateHelper ?? this.stateHelper,
        addEditAddressType: addEditAddressType ?? this.addEditAddressType,
        autoValidateMode: autoValidateMode ?? this.autoValidateMode,
        addressInfoEntity: addressInfoEntity ?? this.addressInfoEntity,
        submitAddressInfoEntity: submitAddressInfoEntity ?? this.submitAddressInfoEntity,
        isAddShipmentRequest: isAddShipmentRequest ?? this.isAddShipmentRequest,
        countryId: countryId ?? this.countryId,
        governorateId: governorateId ?? this.governorateId,
        customerId: customerId ?? this.customerId,
        cityId: cityId ?? this.cityId);
  }

  @override
  List<Object?> get props => [
        stateHelper,
        addEditAddressType,
        autoValidateMode,
        addressInfoEntity,
        submitAddressInfoEntity,
        isAddShipmentRequest,
        countryId,
        governorateId,
        cityId,
        customerId,
      ];
}
