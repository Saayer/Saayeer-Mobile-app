import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moyasar/moyasar.dart';
import 'package:moyasar/src/models/payment_type.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/features/request_new_shipment/data/core/utils/state_helper/state_helper.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/domain/use_cases/create_payment_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/domain/use_cases/get_shipment_usecase.dart';

part 'shipment_payment_event.dart';

part 'shipment_payment_state.dart';

@Injectable()
class ShipmentPaymentBloc extends Bloc<ShipmentPaymentEvent, ShipmentPaymentState> {
  final CreatePaymentUseCase createPaymentUseCase;
  final GetShipmentUseCase getShipmentUseCase;

  ShipmentPaymentBloc({
    required this.createPaymentUseCase,
    required this.getShipmentUseCase,
  }) : super(const ShipmentPaymentState()) {
    on<CreatePayment>(_createPayment);
    on<CreateWebPayment>(_createWebPayment);
    on<HandleWebCallbackResponse>(_handleWebCallbackResponse);
    on<GetShipmentById>(_getShipmentById);
  }

  FutureOr<void> _createPayment(CreatePayment event, Emitter<ShipmentPaymentState> emit) async {
    emit(state.copyWith(
        stateHelper: const PaymentStateHelper(requestState: PaymentRequestState.PAYMENTLOADING),
        paymentAddDto: PaymentAddDto((b) => b
          ..shipmentId = event.shipmentId
          ..transactionId = event.transactionId
          ..amount = event.amount
          ..fee = event.fee
          ..currency = event.currency
          ..status = event.status
          ..sourceCompany = event.sourceCompany
          ..sourceGatewayId = event.sourceGatewayId
          ..sourceMessage = event.sourceMessage
          ..sourceName = event.sourceName
          ..sourceNumber = event.sourceNumber
          ..sourceType = event.sourceType
          ..sourceReferenceNumber = event.sourceReferenceNumber
          ..createdAt = DateTimeUtil.toUtcDateTime(DateTimeUtil.dMyString(DateTime.now())))));

    final Either<Failure, CreatePaymentResponse?> result = await createPaymentUseCase(state.paymentAddDto!);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left CreatePayment $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: PaymentRequestState.PAYMENTERROR,
        errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_PAYMENT,
        errorMessage: 'create_payment_failed',
      )));
    } else {
      final CreatePaymentResponse? rightResult = (result as Right).value;
      log("right CreatePayment $rightResult");
      if (rightResult != null) {
        ///
        if (rightResult.hasError ?? false) {
          emit(state.copyWith(
              stateHelper: state.stateHelper.copyWith(
                  requestState: PaymentRequestState.PAYMENTERROR,
                  errorMessage: rightResult.errorMessages?.first.message ?? 'create_payment_failed',
                  errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_PAYMENT)));
        } else {
          emit(state.copyWith(
            stateHelper: const PaymentStateHelper(requestState: PaymentRequestState.PAYMENTSUCCESS, loadingMessage: ""),
            createPaymentResponse: rightResult,
          ));
        }
      } else {
        log("", name: "SubmitPersonalInfoEvent error");
        emit(state.copyWith(
          stateHelper: const PaymentStateHelper(
            requestState: PaymentRequestState.PAYMENTERROR,
            errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_PAYMENT,
            errorMessage: 'create_payment_failed',
          ),
        ));
      }
    }
  }

  FutureOr<void> _createWebPayment(CreateWebPayment event, Emitter<ShipmentPaymentState> emit) async {
    emit(state.copyWith(
      stateHelper: const PaymentStateHelper(requestState: PaymentRequestState.WEBLOADING),
    ));

    final Either<Failure, CreatePaymentResponse?> result = await createPaymentUseCase(event.paymentAddDto!);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left CreatePayment $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: PaymentRequestState.WEBERROR,
              errorMessage: 'create_payment_failed',
              errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_WEB_PAYMENT)));
    } else {
      final CreatePaymentResponse? rightResult = (result as Right).value;
      log("right CreatePayment $rightResult");
      if (rightResult != null) {
        ///
        if (rightResult.hasError ?? false) {
          if (rightResult.errorMessages?.first.code == ErrorCodes.paymentAlreadyExist &&
              rightResult.shipment?.labelURL == null) {
            /// work around for duplicated [createPayment] call twice .. it's happen in Safari browser
            /// todo: need another solution
            add(GetShipmentById(shipmentId: rightResult.shipment?.shipmentId ?? 0));
          } else if (rightResult.errorMessages?.first.code == ErrorCodes.paymentAlreadyExist &&
              rightResult.shipment?.labelURL != null) {
            emit(state.copyWith(
              stateHelper: const PaymentStateHelper(requestState: PaymentRequestState.WEBSUCCESS, loadingMessage: ""),
              createPaymentResponse: rightResult,
            ));
          } else {
            emit(state.copyWith(
                stateHelper: state.stateHelper.copyWith(
                    requestState: PaymentRequestState.WEBERROR,
                    errorMessage: rightResult.errorMessages?.first.message ?? 'create_payment_failed',
                    errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_WEB_PAYMENT)));
          }
        } else {
          emit(state.copyWith(
            stateHelper: const PaymentStateHelper(requestState: PaymentRequestState.WEBSUCCESS, loadingMessage: ""),
            createPaymentResponse: rightResult,
          ));
        }
      } else {
        log("", name: "SubmitPersonalInfoEvent error");
        emit(state.copyWith(
          stateHelper: const PaymentStateHelper(
              requestState: PaymentRequestState.WEBERROR,
              errorMessage: 'create_payment_failed',
              errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_WEB_PAYMENT),
        ));
      }
    }
  }

  FutureOr<void> _handleWebCallbackResponse(HandleWebCallbackResponse event, Emitter<ShipmentPaymentState> emit) async {
    emit(state.copyWith(
      stateHelper: const PaymentStateHelper(requestState: PaymentRequestState.WEBLOADING),
    ));
    if (event.status == PaymentStatus.paid.name) {
      event.paymentResponse!.status = PaymentStatus.paid;
      (event.paymentResponse!.source as CardPaymentResponseSource).message = event.message;
    } else if (event.status == PaymentStatus.authorized.name) {
      event.paymentResponse!.status = PaymentStatus.authorized;
      (event.paymentResponse!.source as CardPaymentResponseSource).message = event.message;
    } else {
      event.paymentResponse!.status = PaymentStatus.failed;
      (event.paymentResponse!.source as CardPaymentResponseSource).message = event.message;
    }
    switch (event.paymentResponse!.status) {
      case PaymentStatus.paid:

        ///
        add(CreateWebPayment(
            paymentAddDto: PaymentAddDto((b) => b
              ..shipmentId = event.shipmentId
              ..transactionId = event.paymentResponse!.id
              ..amount = double.parse((event.paymentResponse!.amountFormat.replaceAll('SAR', '').trim()))
              ..fee = double.parse((event.paymentResponse!.feeFormat.replaceAll('SAR', '').trim()).toString())
              ..currency = event.paymentResponse!.currency
              ..status = event.paymentResponse!.status.name
              ..sourceCompany = (event.paymentResponse!.source.company as CardCompany).name
              ..sourceGatewayId = event.paymentResponse!.source.gatewayId
              ..sourceMessage = event.paymentResponse!.source.message
              ..sourceName = event.paymentResponse!.source.name
              ..sourceNumber = event.paymentResponse!.source.number
              ..sourceType = (event.paymentResponse!.source.type as PaymentType).name
              ..sourceReferenceNumber = event.paymentResponse!.source.referenceNumber ?? ''
              ..createdAt = DateTimeUtil.toUtcDateTime(DateTimeUtil.dMyString(DateTime.now())))));
        break;
      case PaymentStatus.failed:
        emit(state.copyWith(
          stateHelper: PaymentStateHelper(
              requestState: PaymentRequestState.WEBERROR,
              errorMessage: (event.paymentResponse!.source as CardPaymentResponseSource).message ?? 'payment_failed',
              errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_WEB_PAYMENT),
        ));
        break;
      case PaymentStatus.authorized:
        emit(state.copyWith(
          stateHelper: const PaymentStateHelper(
              requestState: PaymentRequestState.WEBERROR,
              errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_WEB_PAYMENT),
        ));
        break;
      default:
    }
  }

  FutureOr<void> _getShipmentById(GetShipmentById event, Emitter<ShipmentPaymentState> emit) async {
    emit(state.copyWith(
      stateHelper: const PaymentStateHelper(requestState: PaymentRequestState.WEBLOADING),
    ));

    await Future.delayed(
      const Duration(seconds: 15),
      () async {
        final Either<Failure, ShipmentGetDto?> result = await getShipmentUseCase(event.shipmentId);
        if (result.isLeft()) {
          final Failure leftResult = (result as Left).value;
          log("left CreatePayment $leftResult");
          emit(state.copyWith(
              stateHelper: state.stateHelper.copyWith(
                  requestState: PaymentRequestState.WEBERROR,
                  errorMessage: 'create_payment_failed',
                  errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_WEB_PAYMENT)));
        } else {
          final ShipmentGetDto? rightResult = (result as Right).value;
          log("right CreatePayment $rightResult");
          if (rightResult != null) {
            ///
            if (rightResult.labelURL == null) {
              add(GetShipmentById(shipmentId: rightResult.shipmentId ?? 0));
            } else {
              emit(state.copyWith(
                stateHelper: const PaymentStateHelper(requestState: PaymentRequestState.WEBSUCCESS, loadingMessage: ""),
                createPaymentResponse: CreatePaymentResponse((b) => b
                  ..shipment.labelURL = rightResult.labelURL
                  ..shipment.shipmentId = rightResult.shipmentId),
              ));
            }
          } else {
            log("", name: "SubmitPersonalInfoEvent error");
            emit(state.copyWith(
              stateHelper: const PaymentStateHelper(
                  requestState: PaymentRequestState.WEBERROR,
                  errorMessage: 'create_payment_failed',
                  errorStatus: ShipmentPaymentErrorStatus.ERROR_CREATE_WEB_PAYMENT),
            ));
          }
        }
      },
    );
  }
}
