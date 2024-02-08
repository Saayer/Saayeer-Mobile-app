import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/utils/enums/enums.dart';

part 'shipments_event.dart';
part 'shipments_state.dart';

@Injectable()
class ShipmentsBloc extends Bloc<ShipmentsEvent, ShipmentsState> {
  ShipmentsBloc() : super(const ShipmentsState()) {
    on<ShipmentsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  //final TabController tabController = TabController();
}
