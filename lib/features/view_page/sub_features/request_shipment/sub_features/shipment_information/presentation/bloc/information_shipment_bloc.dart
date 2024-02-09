import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'information_shipment_event.dart';
part 'information_shipment_state.dart';

@Injectable()
class InformationShipmentBloc extends Bloc<InformationShipmentEvent, InformationShipmentState> {
  InformationShipmentBloc() : super(InformationShipmentInitial()) {
    on<InformationShipmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
