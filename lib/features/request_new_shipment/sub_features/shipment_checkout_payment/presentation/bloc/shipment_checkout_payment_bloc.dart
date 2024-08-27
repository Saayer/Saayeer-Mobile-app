import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_checkout_payment/domain/use_cases/add_new_shipment_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_checkout_payment/domain/use_cases/get_customer_details_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_checkout_payment/domain/use_cases/get_store_details_usecase.dart';

part 'shipment_checkout_payment_event.dart';

part 'shipment_checkout_payment_state.dart';

@Injectable()
class ShipmentCheckoutPaymentBloc extends Bloc<ShipmentCheckoutPaymentEvent, ShipmentCheckoutPaymentState> {
  final GetStoreDetailsUseCase getStoreDetailsUseCase;
  final GetCustomerDetailsUseCase getCustomerDetailsUseCase;
  final AddNewShipmentUseCase addNewShipmentUseCase;

  ShipmentCheckoutPaymentBloc(
      {required this.getStoreDetailsUseCase,
      required this.getCustomerDetailsUseCase,
      required this.addNewShipmentUseCase})
      : super(const ShipmentCheckoutPaymentState()) {
    on<GetSenderStoreDetailsById>(_getSenderStoreDetailsById);
    on<GetSenderCustomerDetailsById>(_getSenderCustomerDetailsById);
    on<GetReceiverStoreDetailsById>(_getReceiverStoreDetailsById);
    on<GetReceiverCustomerDetailsById>(_getReceiverCustomerDetailsById);
    on<AddNewShipment>(_addNewShipment);
  }

  FutureOr<void> _getSenderStoreDetailsById(
      GetSenderStoreDetailsById event, Emitter<ShipmentCheckoutPaymentState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, StoreGetDto> result = await getStoreDetailsUseCase(event.storeId ?? 0);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: RequestState.ERROR,
      )));
    } else {
      final StoreGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        emit(state.copyWith(
          senderStoreDto: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const StateHelper(
            requestState: RequestState.ERROR,
          ),
        ));
      }
    }
  }

  FutureOr<void> _getSenderCustomerDetailsById(
      GetSenderCustomerDetailsById event, Emitter<ShipmentCheckoutPaymentState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, CustomerGetDto> result = await getCustomerDetailsUseCase(event.customerId ?? 0);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: RequestState.ERROR,
      )));
    } else {
      final CustomerGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        emit(state.copyWith(
          senderCustomerDto: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const StateHelper(
            requestState: RequestState.ERROR,
          ),
        ));
      }
    }
  }

  Future<FutureOr<void>> _getReceiverStoreDetailsById(
      GetReceiverStoreDetailsById event, Emitter<ShipmentCheckoutPaymentState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, StoreGetDto> result = await getStoreDetailsUseCase(event.storeId ?? 0);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: RequestState.ERROR,
      )));
    } else {
      final StoreGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          receiverStoreDto: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const StateHelper(
            requestState: RequestState.ERROR,
          ),
        ));
      }
    }
  }

  FutureOr<void> _getReceiverCustomerDetailsById(
      GetReceiverCustomerDetailsById event, Emitter<ShipmentCheckoutPaymentState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, CustomerGetDto> result = await getCustomerDetailsUseCase(event.customerId ?? 0);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: RequestState.ERROR,
      )));
    } else {
      final CustomerGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          receiverCustomerDto: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const StateHelper(
            requestState: RequestState.ERROR,
          ),
        ));
      }
    }
  }

  FutureOr<void> _addNewShipment(AddNewShipment event, Emitter<ShipmentCheckoutPaymentState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final ShipmentAddDto shipmentDto = ShipmentAddDto((b) => b
      ..length = event.shipmentAddDto?.length
      ..height = event.shipmentAddDto?.height
      ..width = event.shipmentAddDto?.width
      ..weight = event.shipmentAddDto?.weight
      ..contentDesc = event.shipmentAddDto?.contentDesc
      ..contentValue = event.shipmentAddDto?.contentValue
      ..senderCustomerId = event.senderCustomerId
      ..receiverCustomerId = event.receiverCustomerId
      ..senderStoreId = event.senderStoreId
      ..receiverStoreId = event.receiverStoreId
      ..cost = event.selectedServiceProvider?.cost
      ..logisticServiceName = event.selectedServiceProvider?.name);

    final Either<Failure, ShipmentGetDto> result = await addNewShipmentUseCase(shipmentDto);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: RequestState.ERROR,
      )));
    } else {
      final ShipmentGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: ""),
          shipmentGetDto: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const StateHelper(
            requestState: RequestState.ERROR,
          ),
        ));
      }
    }
  }
}
