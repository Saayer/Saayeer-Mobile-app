import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'carriers_shipment_event.dart';
part 'carriers_shipment_state.dart';

@Injectable()
class CarriersShipmentBloc extends Bloc<CarriersShipmentEvent, CarriersShipmentState> {
  CarriersShipmentBloc() : super(CarriersShipmentInitial()) {
    on<CarriersShipmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
