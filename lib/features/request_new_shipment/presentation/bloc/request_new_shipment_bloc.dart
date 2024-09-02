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
import 'package:saayer/features/request_new_shipment/data/core/utils/enums.dart';

part 'request_new_shipment_event.dart';

part 'request_new_shipment_state.dart';

@Injectable()
class RequestNewShipmentBloc extends Bloc<RequestNewShipmentEvent, RequestNewShipmentState> {
  final GetAddressesUseCase getCustomersAddressesUseCase;
  final GetStoresUseCase getStoresUseCase;

  RequestNewShipmentBloc({
    required this.getCustomersAddressesUseCase,
    required this.getStoresUseCase,
  }) : super(const RequestNewShipmentState()) {
    on<InitRequestShipmentViewPageEvent>(_initRequestShipmentViewPageEvent);
    on<GoToNextPageEvent>(_goToNextPageEvent);
    on<GoToPreviousPage>(_goToPreviousPage);
    on<ToggleAutoValidate>(_toggleAutoValidate);
    on<SetSelectedServiceProvider>(_setSelectedServiceProvider);
    on<GoToServiceProvidersPage>(_goToServiceProvidersPage);
    on<GetCustomersAddresses>(_getCustomerAddresses);
    on<GetStoresAddresses>(_getStoresAddresses);
    on<OnScrollSenderCustomersPagination>(_onScrollSenderCustomersPagination);
    on<OnScrollReceiverCustomersPagination>(_onScrollReceiverCustomersPagination);
    on<OnSenderSelectedFromDropDown>(_onSenderSelectedFromDropDown);
    on<OnReceiverSelectedFromDropDown>(_onReceiverSelectedFromDropDown);
    on<OnSetSenderAddress>(_onSetSenderAddress);
    on<OnSetReceiverAddress>(_onSetReceiverAddress);
    on<SetShipmentId>(_setShipmentId);
  }

  ///
  SenderReceiverType? senderType = SenderReceiverType.store;
  SenderReceiverType? receiverType = SenderReceiverType.store;

  ///
  final ScrollController senderCustomersScrollController = ScrollController();
  final ScrollController receiverCustomersScrollController = ScrollController();

  /// shipment details text controller
  final formKey = GlobalKey<FormState>();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController contentDescriptionController = TextEditingController();
  final TextEditingController contentValueController = TextEditingController();

  ///pagination util
  final _senderCustomersPageSize = 10;
  final _receiverCustomersPageSize = 10;

  ///
  List<CustomerGetDto> senderCustomersList = [];
  List<StoreGetDto> senderStoresList = [];
  List<CustomerGetDto> receiverCustomersList = [];
  List<StoreGetDto> receiverStoresList = [];

  ///
  CustomerGetDto? selectedSenderCustomerAddress;
  StoreGetDto? selectedSenderStoreAddress;
  CustomerGetDto? selectedReceiverCustomerAddress;
  StoreGetDto? selectedReceiverStoreAddress;

  FutureOr<void> _initRequestShipmentViewPageEvent(
      InitRequestShipmentViewPageEvent event, Emitter<RequestNewShipmentState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), currentPage: event.currentPage));
  }

  FutureOr<void> _goToNextPageEvent(GoToNextPageEvent event, Emitter<RequestNewShipmentState> emit) async {
    print('_goToNextPageEvent_goToNextPageEvent_goToNextPageEvent_goToNextPageEvent');
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    if (state.currentPage + 1 < 6) {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADED), currentPage: state.currentPage + 1));
    } else {
      emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.SUCCESS),
      ));
    }
  }

  Future<FutureOr<void>> _goToPreviousPage(GoToPreviousPage event, Emitter<RequestNewShipmentState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

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

  Future<FutureOr<void>> _getCustomerAddresses(
      GetCustomersAddresses event, Emitter<RequestNewShipmentState> emit) async {
    if (event.requestShipmentTypes == RequestShipmentTypes.sender) {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADING),
          senderCustomerQuery: CustomerQuery((b) => b
            ..skip = senderCustomersList.length
            ..take = _senderCustomersPageSize)));
    } else {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADING),
          receiverCustomerQuery: CustomerQuery((b) => b
            ..skip = receiverCustomersList.length
            ..take = _receiverCustomersPageSize)));
    }

    await getCustomersAddressesUseCase(event.requestShipmentTypes == RequestShipmentTypes.sender
            ? state.senderCustomerQuery
            : state.receiverCustomerQuery)
        .then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper.copyWith(
                requestState: RequestState.ERROR, errorStatus: RequestNewShipmentErrorStatus.ERROR_GET_ADDRESSES)));
      } else {
        final List<CustomerGetDto>? rightResult = (result as Right).value;

        if (rightResult != null) {
          if (rightResult.length < _senderCustomersPageSize) {
            emit(state.copyWith(
                stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: ""),
                hasNextPage: false));
          } else {
            emit(state.copyWith(
                stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: ""),
                hasNextPage: true));
          }
          if (event.requestShipmentTypes == RequestShipmentTypes.sender) {
            for (var item in rightResult) {
              senderCustomersList.putIfAbsent(item);
            }
            emit(state.copyWith(
                stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
                customersAddresses: senderCustomersList));
          } else {
            for (var item in rightResult) {
              receiverCustomersList.putIfAbsent(item);
            }
            emit(state.copyWith(
                stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
                customersAddresses: receiverCustomersList));
          }
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: RequestNewShipmentErrorStatus.ERROR_GET_ADDRESSES),
          ));
        }
      }
    });
  }

  Future<FutureOr<void>> _getStoresAddresses(GetStoresAddresses event, Emitter<RequestNewShipmentState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await getStoresUseCase(const NoParameters()).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper.copyWith(
                requestState: RequestState.ERROR, errorStatus: RequestNewShipmentErrorStatus.ERROR_GET_STORES)));
      } else {
        final List<StoreGetDto>? rightResult = (result as Right).value;

        if (rightResult != null) {
          emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: "")));

          for (var item in rightResult) {
            senderStoresList.putIfAbsent(item);
            receiverStoresList.putIfAbsent(item);
          }
          selectedReceiverStoreAddress = senderStoresList.isNotEmpty ? senderStoresList.first : null;

          /// to show autoSelected last store added
          var storeId = getIt<SharedPrefService>().getLastStoreAddedId();
          if (storeId != null) {
            selectedSenderStoreAddress = senderStoresList.firstWhere((store) => store.storeId == storeId);
          } else {
            selectedSenderStoreAddress = senderStoresList.isNotEmpty ? senderStoresList.first : null;
          }

          ///
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              storesList: senderStoresList));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: RequestNewShipmentErrorStatus.ERROR_GET_STORES),
          ));
        }
      }
    });
  }

  FutureOr<void> _onScrollSenderCustomersPagination(
      OnScrollSenderCustomersPagination event, Emitter<RequestNewShipmentState> emit) {
    if (!senderCustomersScrollController.hasClients) return null;
    final maxScroll = senderCustomersScrollController.position.maxScrollExtent;
    final currentScroll = senderCustomersScrollController.position.pixels;
    if (currentScroll == maxScroll) {
      if (state.hasNextPage ?? false) {
        add(const GetCustomersAddresses(requestShipmentTypes: RequestShipmentTypes.sender));
      }
    }
  }

  FutureOr<void> _onSenderSelectedFromDropDown(
      OnSenderSelectedFromDropDown event, Emitter<RequestNewShipmentState> emit) {
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

  FutureOr<void> _setSelectedServiceProvider(
      SetSelectedServiceProvider event, Emitter<RequestNewShipmentState> emit) async {
    emit(
      state.copyWith(
        stateHelper: const StateHelper(
          requestState: RequestState.LOADING,
        ),
        selectedServiceProvider: event.selectedServiceProvider,
      ),
    );
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _goToServiceProvidersPage(GoToServiceProvidersPage event, Emitter<RequestNewShipmentState> emit) {
    emit(
      state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        shipmentDtoBody: ShipmentCostObj((b) => b
          ..length = lengthController.text.isEmpty ? 0 : double.parse(lengthController.text)
          ..height = heightController.text.isEmpty ? 0 : double.parse(heightController.text)
          ..weight = weightController.text.isEmpty ? null : double.parse(weightController.text)
          ..width = widthController.text.isEmpty ? 0 : double.parse(widthController.text)
          ..contentDesc = contentDescriptionController.text
          ..contentValue = contentValueController.text.isEmpty ? null : double.parse(contentValueController.text)
          ..senderAddress = state.senderAddress?.toBuilder()
          ..receiverAddress = state.receiverAddress?.toBuilder()),
      ),
    );

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), currentPage: state.currentPage + 1));
  }

  FutureOr<void> _onScrollReceiverCustomersPagination(
      OnScrollReceiverCustomersPagination event, Emitter<RequestNewShipmentState> emit) {
    if (!receiverCustomersScrollController.hasClients) return null;
    final maxScroll = receiverCustomersScrollController.position.maxScrollExtent;
    final currentScroll = receiverCustomersScrollController.position.pixels;
    if (currentScroll == maxScroll) {
      if (state.hasNextPage ?? false) {
        add(const GetCustomersAddresses(requestShipmentTypes: RequestShipmentTypes.receiver));
      }
    }
  }

  FutureOr<void> _onReceiverSelectedFromDropDown(
      OnReceiverSelectedFromDropDown event, Emitter<RequestNewShipmentState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    if (event.receiverType == SenderReceiverType.store) {
      selectedReceiverStoreAddress = event.item;
    } else if (event.receiverType == SenderReceiverType.customer) {
      selectedReceiverCustomerAddress = event.item;
    }
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _toggleAutoValidate(ToggleAutoValidate event, Emitter<RequestNewShipmentState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), autoValidateMode: AutovalidateMode.always));
  }

  FutureOr<void> _onSetSenderAddress(OnSetSenderAddress event, Emitter<RequestNewShipmentState> emit) {
    if (senderType == SenderReceiverType.store) {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADING),
          senderStoreId: selectedSenderStoreAddress!.storeId,
          senderCustomerId: null,
          senderAddress: AddressLogistics((a) => a
            ..addressDetails = selectedSenderStoreAddress?.addressDetails
            ..governorateNameEn = selectedSenderStoreAddress?.governorateNameEn
            ..cityNameEn = selectedSenderStoreAddress?.cityNameEn
            ..countryNameEn = selectedSenderStoreAddress?.countryNameEn
            ..countryCode = "1"
            ..areaNameEn = selectedSenderStoreAddress?.areaNameEn)));
    } else {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADING),
          senderStoreId: null,
          senderCustomerId: selectedSenderCustomerAddress!.customerId,
          senderAddress: AddressLogistics((a) => a
            ..addressDetails = selectedSenderCustomerAddress?.addressDetails
            ..governorateNameEn = selectedSenderCustomerAddress?.governorateNameEn
            ..cityNameEn = selectedSenderCustomerAddress?.cityNameEn
            ..countryNameEn = selectedSenderCustomerAddress?.countryNameEn
            ..countryCode = "1"
            ..areaNameEn = selectedSenderCustomerAddress?.areaNameEn)));
      receiverType = SenderReceiverType.store;
      selectedReceiverCustomerAddress = null;
    }

    add(GoToNextPageEvent());
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }

  FutureOr<void> _onSetReceiverAddress(OnSetReceiverAddress event, Emitter<RequestNewShipmentState> emit) {
    if (receiverType == SenderReceiverType.store) {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADING),
          receiverStoreId: selectedReceiverStoreAddress!.storeId,
          receiverCustomerId: null,
          receiverAddress: AddressLogistics((a) => a
            ..addressDetails = selectedReceiverStoreAddress?.addressDetails
            ..governorateNameEn = selectedReceiverStoreAddress?.governorateNameEn
            ..cityNameEn = selectedReceiverStoreAddress?.cityNameEn
            ..countryNameEn = selectedReceiverStoreAddress?.countryNameEn
            ..countryCode = "1"
            ..areaNameEn = selectedReceiverStoreAddress?.areaNameEn)));
    } else {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADING),
          receiverStoreId: null,
          receiverCustomerId: selectedReceiverCustomerAddress!.customerId,
          receiverAddress: AddressLogistics((a) => a
            ..addressDetails = selectedReceiverCustomerAddress?.addressDetails
            ..governorateNameEn = selectedReceiverCustomerAddress?.governorateNameEn
            ..cityNameEn = selectedReceiverCustomerAddress?.cityNameEn
            ..countryNameEn = selectedReceiverCustomerAddress?.countryNameEn
            ..countryCode = "1"
            ..areaNameEn = selectedReceiverCustomerAddress?.areaNameEn)));
    }

    add(GoToNextPageEvent());
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }

  FutureOr<void> _setShipmentId(SetShipmentId event, Emitter<RequestNewShipmentState> emit) {
    ///
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING), shipmentId: event.shipmentId));

    /// go to Shipment payment screen
    add(GoToNextPageEvent());

    ///
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }
}
