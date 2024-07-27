part of 'add_address_bloc.dart';

abstract class AddAddressEvent extends Equatable {
  const AddAddressEvent();
}

class InitAddAddress extends AddAddressEvent {
  final bool isEnglish;
  final bool isAddShipmentRequest;

  const InitAddAddress({
    required this.isEnglish,
    required this.isAddShipmentRequest,
  });

  @override
  List<Object?> get props => [isEnglish];
}

class OnTextChange extends AddAddressEvent {
  final TextEditingController? textEditingController;
  final String? str;
  final PhoneNumber? phoneNumber;
  final PhoneNumber? alternativePhoneNumber;
  final AddAddressFieldsTypes addAddressFieldsType;

  const OnTextChange({this.textEditingController, this.str, required this.addAddressFieldsType, this.phoneNumber, this.alternativePhoneNumber})
      : assert(addAddressFieldsType == AddAddressFieldsTypes.MOBILE ? phoneNumber != null : phoneNumber == null);

  @override
  List<Object?> get props => [textEditingController, str, addAddressFieldsType];
}

class OnItemSelectedFromDropDown<T> extends AddAddressEvent {
  final T item;
  final AddAddressFieldsTypes addAddressFieldsType;

  const OnItemSelectedFromDropDown({required this.item, required this.addAddressFieldsType});

  @override
  List<Object?> get props => [addAddressFieldsType];
}

class SubmitAddressData extends AddAddressEvent {
  @override
  List<Object?> get props => [];
}

class ToggleAutoValidate extends AddAddressEvent {
  @override
  List<Object?> get props => [];
}

class GetCountries extends AddAddressEvent {
  const GetCountries();

  @override
  List<Object> get props => [];
}

class GetCities extends AddAddressEvent {
  const GetCities();

  @override
  List<Object> get props => [];
}

class GetGovernorates extends AddAddressEvent {
  const GetGovernorates();

  @override
  List<Object> get props => [];
}

class GetAreas extends AddAddressEvent {
  const GetAreas();

  @override
  List<Object> get props => [];
}
