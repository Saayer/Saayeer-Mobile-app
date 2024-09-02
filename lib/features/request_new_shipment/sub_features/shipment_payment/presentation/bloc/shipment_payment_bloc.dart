import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/domain/use_cases/add_new_shipment_usecase.dart';

part 'shipment_payment_event.dart';

part 'shipment_payment_state.dart';

@Injectable()
class ShipmentPaymentBloc extends Bloc<ShipmentPaymentEvent, ShipmentPaymentState>{
  final AddNewShipmentUseCase addNewShipmentUseCase;
  ShipmentPaymentBloc(
      {required this.addNewShipmentUseCase})
      : super(const ShipmentPaymentState()) {
  }

}