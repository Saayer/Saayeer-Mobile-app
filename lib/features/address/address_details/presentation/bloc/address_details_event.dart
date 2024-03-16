part of 'address_details_bloc.dart';

abstract class AddressDetailsEvent extends Equatable {
  const AddressDetailsEvent();
}

class InitAddressDetails extends AddressDetailsEvent {
  final AddressInfoEntity addressInfoEntity;

  const InitAddressDetails({required this.addressInfoEntity});

  @override
  List<Object> get props => [addressInfoEntity];
}
