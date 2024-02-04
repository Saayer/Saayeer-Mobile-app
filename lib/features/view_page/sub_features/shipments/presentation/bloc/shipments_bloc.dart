import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'shipments_event.dart';
part 'shipments_state.dart';

@Injectable()
class ShipmentsBloc extends Bloc<ShipmentsEvent, ShipmentsState> {
  ShipmentsBloc() : super(ShipmentsInitial()) {
    on<ShipmentsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
