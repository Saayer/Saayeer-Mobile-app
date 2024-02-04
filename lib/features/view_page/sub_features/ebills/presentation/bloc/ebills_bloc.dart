import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'ebills_event.dart';
part 'ebills_state.dart';

@Injectable()
class EbillsBloc extends Bloc<EbillsEvent, EbillsState> {
  EbillsBloc() : super(EbillsInitial()) {
    on<EbillsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
