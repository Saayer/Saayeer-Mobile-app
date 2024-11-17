part of 'shipping_partners_bloc.dart';

abstract class ShippingPartnersEvent extends Equatable {
  const ShippingPartnersEvent();
}

class GetShippingPartners extends ShippingPartnersEvent {
  const GetShippingPartners();

  @override
  List<Object> get props => [];
}
