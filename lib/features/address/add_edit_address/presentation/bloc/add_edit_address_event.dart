part of 'add_edit_address_bloc.dart';

abstract class AddEditAddressEvent extends Equatable {
  const AddEditAddressEvent();
}

class InitAddAddress extends AddEditAddressEvent {
  final bool isEnglish;
  final bool isAddShipmentRequest;
  final AddEditAddressType addEditAddressType;

  const InitAddAddress({
    required this.isEnglish,
    required this.isAddShipmentRequest,
    required this.addEditAddressType,
  });

  @override
  List<Object?> get props => [isEnglish, addEditAddressType];
}

class OnTextChange extends AddEditAddressEvent {
  final TextEditingController? textEditingController;
  final String? str;
  final PhoneNumber? phoneNumber;
  final PhoneNumber? alternativePhoneNumber;
  final AddAddressFieldsTypes addAddressFieldsType;

  const OnTextChange(
      {this.textEditingController,
      this.str,
      required this.addAddressFieldsType,
      this.phoneNumber,
      this.alternativePhoneNumber})
      : assert(addAddressFieldsType == AddAddressFieldsTypes.MOBILE ? phoneNumber != null : phoneNumber == null);

  @override
  List<Object?> get props => [textEditingController, str, addAddressFieldsType];
}

class OnItemSelectedFromDropDown<T> extends AddEditAddressEvent {
  final T item;
  final AddAddressFieldsTypes addAddressFieldsType;

  const OnItemSelectedFromDropDown({required this.item, required this.addAddressFieldsType});

  @override
  List<Object?> get props => [addAddressFieldsType];
}

class SubmitAddressData extends AddEditAddressEvent {
  @override
  List<Object?> get props => [];
}

class ToggleAutoValidate extends AddEditAddressEvent {
  @override
  List<Object?> get props => [];
}

class GetCountries extends AddEditAddressEvent {
  const GetCountries();

  @override
  List<Object> get props => [];
}

class GetCities extends AddEditAddressEvent {
  const GetCities();

  @override
  List<Object> get props => [];
}

class GetGovernorates extends AddEditAddressEvent {
  const GetGovernorates();

  @override
  List<Object> get props => [];
}

class SetUpdateValues extends AddEditAddressEvent {
  final CustomerGetDto customerModel;

  const SetUpdateValues({required this.customerModel});

  @override
  List<Object> get props => [customerModel];
}

class OnUpdateAddress extends AddEditAddressEvent {
  const OnUpdateAddress();

  @override
  List<Object> get props => [];
}
