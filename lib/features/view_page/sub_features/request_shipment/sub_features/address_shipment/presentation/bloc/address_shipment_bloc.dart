import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'address_shipment_event.dart';

part 'address_shipment_state.dart';

@Injectable()
class AddressShipmentBloc
    extends Bloc<AddressShipmentEvent, AddressShipmentState> {
  AddressShipmentBloc() : super(AddressShipmentInitial()) {
    on<AddressShipmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
