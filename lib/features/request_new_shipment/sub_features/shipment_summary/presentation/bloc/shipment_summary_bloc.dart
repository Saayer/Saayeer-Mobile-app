import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/data/core/state_helper/state_helper.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/domain/use_cases/add_new_shipment_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/domain/use_cases/get_customer_details_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/domain/use_cases/get_store_details_usecase.dart';

part 'shipment_summary_event.dart';

part 'shipment_summary_state.dart';

@Injectable()
class ShipmentSummaryBloc extends Bloc<ShipmentSummaryEvent, ShipmentSummaryState> {
  final GetStoreDetailsUseCase getStoreDetailsUseCase;
  final GetCustomerDetailsUseCase getCustomerDetailsUseCase;
  final AddNewShipmentUseCase addNewShipmentUseCase;

  ShipmentSummaryBloc({
    required this.getStoreDetailsUseCase,
    required this.getCustomerDetailsUseCase,
    required this.addNewShipmentUseCase,
  }) : super(const ShipmentSummaryState()) {
    on<GetSenderStoreDetailsById>(_getSenderStoreDetailsById);
    on<GetSenderCustomerDetailsById>(_getSenderCustomerDetailsById);
    on<GetReceiverStoreDetailsById>(_getReceiverStoreDetailsById);
    on<GetReceiverCustomerDetailsById>(_getReceiverCustomerDetailsById);
    on<AddNewShipment>(_addNewShipment);
  }

  ///

  FutureOr<void> _getSenderStoreDetailsById(GetSenderStoreDetailsById event, Emitter<ShipmentSummaryState> emit) async {
    emit(state.copyWith(
        stateHelper: const ShipmentSummaryStateHelper(requestState: ShipmentSummaryRequestState.LOADING_SENDER)));

    final Either<Failure, StoreGetDto> result = await getStoreDetailsUseCase(event.storeId ?? 0);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: ShipmentSummaryRequestState.ERROR_SENDER,
        errorStatus: ShipmentSummaryErrorStatus.GET_STORES_ERROR,
      )));
    } else {
      final StoreGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        emit(state.copyWith(
          stateHelper: const ShipmentSummaryStateHelper(
            requestState: ShipmentSummaryRequestState.LOADED_SENDER,
          ),
          senderStoreDto: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const ShipmentSummaryStateHelper(
            requestState: ShipmentSummaryRequestState.ERROR_SENDER,
            errorStatus: ShipmentSummaryErrorStatus.GET_STORES_ERROR,
          ),
        ));
      }
    }
  }

  FutureOr<void> _getSenderCustomerDetailsById(
      GetSenderCustomerDetailsById event, Emitter<ShipmentSummaryState> emit) async {
    emit(state.copyWith(
        stateHelper: const ShipmentSummaryStateHelper(requestState: ShipmentSummaryRequestState.LOADING_SENDER)));

    final Either<Failure, CustomerGetDto> result = await getCustomerDetailsUseCase(event.customerId ?? 0);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: ShipmentSummaryRequestState.ERROR_SENDER,
        errorStatus: ShipmentSummaryErrorStatus.GET_CUSTOMERS_ERROR,
      )));
    } else {
      final CustomerGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        emit(state.copyWith(
          stateHelper: const ShipmentSummaryStateHelper(
            requestState: ShipmentSummaryRequestState.LOADED_SENDER,
          ),
          senderCustomerDto: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const ShipmentSummaryStateHelper(
            requestState: ShipmentSummaryRequestState.ERROR_SENDER,
            errorStatus: ShipmentSummaryErrorStatus.GET_CUSTOMERS_ERROR,
          ),
        ));
      }
    }
  }

  Future<FutureOr<void>> _getReceiverStoreDetailsById(
      GetReceiverStoreDetailsById event, Emitter<ShipmentSummaryState> emit) async {
    emit(state.copyWith(
        stateHelper: const ShipmentSummaryStateHelper(requestState: ShipmentSummaryRequestState.LOADING_RECEIVER)));

    final Either<Failure, StoreGetDto> result = await getStoreDetailsUseCase(event.storeId ?? 0);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: ShipmentSummaryRequestState.ERROR_RECEIVER,
        errorStatus: ShipmentSummaryErrorStatus.GET_STORES_ERROR,
      )));
    } else {
      final StoreGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        emit(state.copyWith(
          stateHelper: const ShipmentSummaryStateHelper(
              requestState: ShipmentSummaryRequestState.LOADED_RECEIVER, loadingMessage: ""),
          receiverStoreDto: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const ShipmentSummaryStateHelper(
            requestState: ShipmentSummaryRequestState.ERROR_RECEIVER,
            errorStatus: ShipmentSummaryErrorStatus.GET_STORES_ERROR,
          ),
        ));
      }
    }
  }

  FutureOr<void> _getReceiverCustomerDetailsById(
      GetReceiverCustomerDetailsById event, Emitter<ShipmentSummaryState> emit) async {
    emit(state.copyWith(
        stateHelper: const ShipmentSummaryStateHelper(requestState: ShipmentSummaryRequestState.LOADING_RECEIVER)));

    final Either<Failure, CustomerGetDto> result = await getCustomerDetailsUseCase(event.customerId ?? 0);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: ShipmentSummaryRequestState.ERROR_RECEIVER,
        errorStatus: ShipmentSummaryErrorStatus.GET_CUSTOMERS_ERROR,
      )));
    } else {
      final CustomerGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        emit(state.copyWith(
          stateHelper: const ShipmentSummaryStateHelper(
              requestState: ShipmentSummaryRequestState.LOADED_RECEIVER, loadingMessage: ""),
          receiverCustomerDto: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const ShipmentSummaryStateHelper(
            requestState: ShipmentSummaryRequestState.ERROR_RECEIVER,
            errorStatus: ShipmentSummaryErrorStatus.GET_CUSTOMERS_ERROR,
          ),
        ));
      }
    }
  }

  FutureOr<void> _addNewShipment(AddNewShipment event, Emitter<ShipmentSummaryState> emit) async {
    emit(state.copyWith(
        stateHelper: const ShipmentSummaryStateHelper(requestState: ShipmentSummaryRequestState.LOADING_ADD_SHIPMENT)));
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
      ..cost = event.selectedServiceProvider?.logisticCost
      ..logisticServiceName = event.selectedServiceProvider?.logisticService?.serviceName);

    final Either<Failure, ShipmentGetDto> result = await addNewShipmentUseCase(shipmentDto);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: ShipmentSummaryRequestState.ERROR_ADD_SHIPMENT,
        errorStatus: ShipmentSummaryErrorStatus.ADD_SHIPMENT_ERROR,
      )));
    } else {
      final ShipmentGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        if (rightResult.senderStoreId != null) {
          ///Save Last sender store id used in last new request shipment
          getIt<SharedPrefService>().setLastStoreAddedId(rightResult.senderStoreId!);
        }

        emit(state.copyWith(
          stateHelper: const ShipmentSummaryStateHelper(
              requestState: ShipmentSummaryRequestState.SUCCESS_ADD_SHIPMENT, loadingMessage: ""),
          shipmentGetDto: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const ShipmentSummaryStateHelper(
            requestState: ShipmentSummaryRequestState.ERROR_ADD_SHIPMENT,
            errorStatus: ShipmentSummaryErrorStatus.ADD_SHIPMENT_ERROR,
          ),
        ));
      }
    }
  }
}
