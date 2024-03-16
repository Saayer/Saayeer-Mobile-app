part of 'addresses_book_bloc.dart';

abstract class AddressesBookEvent extends Equatable {
  const AddressesBookEvent();
}

class GetAddresses extends AddressesBookEvent {
  const GetAddresses();

  @override
  List<Object> get props => [];
}
