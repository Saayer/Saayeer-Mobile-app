import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/address/add_edit_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/address/addresses_book/domain/use_cases/get_addresses_usecase.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/domain/usecases/get_stores_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/domain/entities/shipment_specs_entity.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/data/core/utils/enums.dart';

part 'request_shipment_event.dart';

part 'request_shipment_state.dart';

@Injectable()
class RequestShipmentBloc extends Bloc<RequestShipmentEvent, RequestShipmentState> {
  final GetAddressesUseCase getCustomersAddressesUseCase;
  final GetStoresUseCase getStoresUseCase;

  RequestShipmentBloc({
    required this.getCustomersAddressesUseCase,
    required this.getStoresUseCase,
  }) : super(const RequestShipmentState()) {
    on<InitRequestShipmentViewPageEvent>(_initRequestShipmentViewPageEvent);
    on<GoToNextPageEvent>(_goToNextPageEvent);
    on<GoToPreviousPage>(_goToPreviousPage);
    on<AddAddressInfoEvent>(_addAddressInfoEvent);
    on<AddShipmentSpecsEvent>(_addShipmentSpecsEvent);
    on<GetCustomersAddresses>(_getCustomerAddresses);
    on<GetStoresAddresses>(_getStoresAddresses);
    on<OnScrollCustomersPagination>(_onScrollCustomersPagination);
    on<OnSenderSelectedFromDropDown>(_onSenderSelectedFromDropDown);
  }

  ///
  final ScrollController scrollController = ScrollController();

  ///pagination util
  final _pageSize = 10;

  ///
  List<CustomerGetDto> senderCustomersList = [];
  List<StoreGetDto> senderStoresList = [];

  ///
  CustomerGetDto? selectedSenderCustomerAddress;
  StoreGetDto? selectedSenderStoreAddress;

  FutureOr<void> _initRequestShipmentViewPageEvent(
      InitRequestShipmentViewPageEvent event, Emitter<RequestShipmentState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), currentPage: event.currentPage));
  }

  FutureOr<void> _goToNextPageEvent(GoToNextPageEvent event, Emitter<RequestShipmentState> emit) async {
    print('_goToNextPageEvent_goToNextPageEvent_goToNextPageEvent_goToNextPageEvent');
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    if (state.currentPage + 1 < 5) {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADED), currentPage: state.currentPage + 1));
    } else {
      emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.SUCCESS),
      ));
    }
  }

  Future<FutureOr<void>> _goToPreviousPage(GoToPreviousPage event, Emitter<RequestShipmentState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    //await Future.delayed(Duration(seconds: 1));
    if (state.currentPage + 1 > 1) {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADED), currentPage: state.currentPage - 1));
    } else {
      getIt<NavigationService>().pop();
      emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.SUCCESS),
      ));
    }
  }

  Future<FutureOr<void>> _getCustomerAddresses(GetCustomersAddresses event, Emitter<RequestShipmentState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        customerQuery: CustomerQuery((b) => b
          ..skip = senderCustomersList.length
          ..take = _pageSize)));

    await getCustomersAddressesUseCase(state.customerQuery).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper.copyWith(
                requestState: RequestState.ERROR, errorStatus: RequestShipmentErrorStatus.ERROR_GET_ADDRESSES)));
      } else {
        final List<CustomerGetDto>? rightResult = (result as Right).value;

        if (rightResult != null) {
          if (rightResult.length < _pageSize) {
            emit(state.copyWith(
                stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: ""),
                hasNextPage: false));
          } else {
            emit(state.copyWith(
                stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: ""),
                hasNextPage: true));
          }
          for (var item in rightResult) {
            senderCustomersList.putIfAbsent(item);
          }
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              customersAddresses: senderCustomersList));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: RequestShipmentErrorStatus.ERROR_GET_ADDRESSES),
          ));
        }
      }
    });
  }

  Future<FutureOr<void>> _getStoresAddresses(GetStoresAddresses event, Emitter<RequestShipmentState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await getStoresUseCase(const NoParameters()).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper
                .copyWith(requestState: RequestState.ERROR, errorStatus: RequestShipmentErrorStatus.ERROR_GET_STORES)));
      } else {
        final List<StoreGetDto>? rightResult = (result as Right).value;

        if (rightResult != null) {
          emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: "")));

          for (var item in rightResult) {
            senderStoresList.putIfAbsent(item);
          }

          /// to show autoSelected last store added
          var storeId = getIt<SharedPrefService>().getLastStoreAddedId();
          if (storeId != null) {
            selectedSenderStoreAddress = senderStoresList.firstWhere((store) => store.storeId == storeId);
          } else {
            selectedSenderStoreAddress = senderStoresList.first;
          }

          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              storesList: senderStoresList));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: RequestShipmentErrorStatus.ERROR_GET_STORES),
          ));
        }
      }
    });
  }

  FutureOr<void> _onScrollCustomersPagination(OnScrollCustomersPagination event, Emitter<RequestShipmentState> emit) {
    if (!scrollController.hasClients) return null;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      if (state.hasNextPage ?? false) {
        add(const GetCustomersAddresses());
      }
    }
  }

  FutureOr<void> _onSenderSelectedFromDropDown(OnSenderSelectedFromDropDown event, Emitter<RequestShipmentState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    if (event.senderType == SenderReceiverType.store) {
      selectedSenderStoreAddress = event.item;
    } else if (event.senderType == SenderReceiverType.customer) {
      selectedSenderCustomerAddress = event.item;
    }
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _addAddressInfoEvent(AddAddressInfoEvent event, Emitter<RequestShipmentState> emit) async {
    emit(
      state.copyWith(
        stateHelper: const StateHelper(
          requestState: RequestState.LOADING,
        ),
        addressInfoEntity: event.addressInfoEntity,
      ),
    );

    print('state.addressInfoEntity.name');
    print(state.addressInfoEntity!.name);
    print(state.currentPage);

    await _goToNextPageEvent(GoToNextPageEvent(), emit);

    print(state.currentPage);
  }

  FutureOr<void> _addShipmentSpecsEvent(AddShipmentSpecsEvent event, Emitter<RequestShipmentState> emit) {
    print('_addAddressInfoEvent');
    emit(
      state.copyWith(
        stateHelper: const StateHelper(
          requestState: RequestState.LOADING,
        ),
        shipmentSpecsEntity: event.shipmentSpecsEntity,
      ),
    );

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), currentPage: state.currentPage + 1));

    print('state.addressInfoEntity.name');
    print(state.addressInfoEntity!.name);
    print(state.currentPage);
  }
}
