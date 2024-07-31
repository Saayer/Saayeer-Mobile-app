part of 'addresses_book_bloc.dart';

abstract class AddressesBookEvent extends Equatable {
  const AddressesBookEvent();
}

class GetAddresses extends AddressesBookEvent {
  const GetAddresses();

  @override
  List<Object> get props => [];
}

class GetCountries extends AddressesBookEvent {
  const GetCountries();

  @override
  List<Object> get props => [];
}

class GetCities extends AddressesBookEvent {
  const GetCities();

  @override
  List<Object> get props => [];
}

class GetGovernorates extends AddressesBookEvent {
  const GetGovernorates();

  @override
  List<Object> get props => [];
}

class OnFilterTextChange extends AddressesBookEvent {
  final TextEditingController? textEditingController;
  final String? str;
  final PhoneNumber? phoneNumber;
  final AddAddressFieldsTypes addAddressFieldsType;

  const OnFilterTextChange({this.textEditingController, this.str, required this.addAddressFieldsType, this.phoneNumber})
      : assert(addAddressFieldsType == AddAddressFieldsTypes.MOBILE ? phoneNumber != null : phoneNumber == null);

  @override
  List<Object?> get props => [textEditingController, str, addAddressFieldsType];
}

class OnItemSelectedFromDropDown<T> extends AddressesBookEvent {
  final T item;
  final AddAddressFieldsTypes addAddressFieldsType;

  const OnItemSelectedFromDropDown({required this.item, required this.addAddressFieldsType});

  @override
  List<Object?> get props => [addAddressFieldsType];
}

class OnAddressDelete extends AddressesBookEvent {
  final CustomerGetDto deleteAddress;

  const OnAddressDelete({required this.deleteAddress});

  @override
  List<Object?> get props => [deleteAddress];
}

class OnScrollPagination extends AddressesBookEvent {
  const OnScrollPagination();

  @override
  List<Object?> get props => [];
}

class ResetList extends AddressesBookEvent {
  const ResetList();

  @override
  List<Object?> get props => [];
}
