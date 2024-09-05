import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/domain/use_cases/create_payment_usecase.dart';

part 'shipment_payment_event.dart';

part 'shipment_payment_state.dart';

@Injectable()
class ShipmentPaymentBloc extends Bloc<ShipmentPaymentEvent, ShipmentPaymentState> {
  final CreatePaymentUseCase createPaymentUseCase;

  ShipmentPaymentBloc({required this.createPaymentUseCase}) : super(const ShipmentPaymentState()) {
    on<CreatePayment>(_createPayment);
  }

  FutureOr<void> _createPayment(CreatePayment event, Emitter<ShipmentPaymentState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        paymentAddDto: PaymentAddDto((b) => b
          ..shipmentId = event.shipmentId
          ..transactionId = event.transactionId
          ..amount = event.amount
          ..fee = event.fee
          ..currency = event.currency)));

    final Either<Failure, CreatePaymentResponse?> result = await createPaymentUseCase(state.paymentAddDto!);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left CreatePayment $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR, errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_PAYMENT)));
    } else {
      final CreatePaymentResponse? rightResult = (result as Right).value;
      log("right CreatePayment $rightResult");
      if (rightResult != null) {
          ///
          emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: ""),
            createPaymentResponse: rightResult,
          ));
      } else {
        log("", name: "SubmitPersonalInfoEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_PAYMENT),
        ));
      }
    }
  }
}
