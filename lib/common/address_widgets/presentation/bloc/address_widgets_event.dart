part of 'address_widgets_bloc.dart';

abstract class AddressWidgetsEvent extends Equatable {
  const AddressWidgetsEvent();
}

class GetCities extends AddressWidgetsEvent {
  const GetCities();

  @override
  List<Object> get props => [];
}
