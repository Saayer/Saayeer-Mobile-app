import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'request_shipment_event.dart';
part 'request_shipment_state.dart';

@Injectable()
class RequestShipmentBloc extends Bloc<RequestShipmentEvent, RequestShipmentState> {
  RequestShipmentBloc() : super(RequestShipmentInitial()) {
    on<RequestShipmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
