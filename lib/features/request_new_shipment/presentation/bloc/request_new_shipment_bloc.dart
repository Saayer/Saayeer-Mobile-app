import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/constants/constants.dart';
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
    on<PersonalInfoCompleteChecker>(_personalInfoCompleteChecker);
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
    on<ResetCustomerList>(_resetCustomerList);
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

  FutureOr<void> _personalInfoCompleteChecker(
      PersonalInfoCompleteChecker event, Emitter<RequestNewShipmentState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    /// check if user info not complete to navigate to [Routes.personalInfoNamedPage] to complete it first
    final userDto = getIt<SharedPrefService>().getUserData();
    if (userDto != null) {
      if ((userDto.email ?? '').isEmpty ||
          userDto.fullName == null ||
          userDto.fullName == Constants.defaultUserName ||
          (userDto.address ?? '').isEmpty) {
        getIt<NavigationService>().pop();

        /// sent true as arguments if navigatedFromRequestShipment else false
        getIt<NavigationService>().navigateToNamed(Routes.personalInfoNamedPage, arguments: true);
        SaayerToast().showSuccessToast(msg: "complete_personal_info_msg".tr());
      }
    }

    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
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
      getIt<NavigationService>().navigateAndFinishNamed(Routes.viewPageNamedPage);
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
            senderCustomersList = rightResult;
            if(senderCustomersList.isNotEmpty){
              if (selectedSenderCustomerAddress != null) {
                var customerId = selectedSenderCustomerAddress!.customerId;
                selectedSenderCustomerAddress =
                    senderCustomersList.firstWhere((address) => address.customerId == customerId);
              }
            }

            emit(state.copyWith(
                stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
                customersAddresses: senderCustomersList));
          } else {
            receiverCustomersList = rightResult;
            if (receiverCustomersList.isNotEmpty) {
              if (selectedReceiverCustomerAddress != null) {
                var customerId = selectedReceiverCustomerAddress!.customerId;
                selectedReceiverCustomerAddress =
                    receiverCustomersList.firstWhere((address) => address.customerId == customerId);
              }
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

          ///
          senderStoresList = rightResult;
          receiverStoresList = rightResult;

          ///
          if (selectedReceiverStoreAddress != null) {
            var storeId = selectedReceiverStoreAddress!.storeId;
            selectedReceiverStoreAddress = receiverStoresList.firstWhere((store) => store.storeId == storeId);
          } else {
            selectedReceiverStoreAddress = receiverStoresList.isNotEmpty ? receiverStoresList.first : null;
          }

          ///
          if (selectedSenderStoreAddress != null) {
            var storeId = selectedSenderStoreAddress!.storeId;
            selectedSenderStoreAddress = senderStoresList.firstWhere((store) => store.storeId == storeId);
          } else {
            /// to show autoSelected last store added
            var storeId = getIt<SharedPrefService>().getLastStoreAddedId();
            if (storeId != null) {
              selectedSenderStoreAddress = senderStoresList.firstWhere((store) => store.storeId == storeId);
            } else {
              selectedSenderStoreAddress = senderStoresList.isNotEmpty ? senderStoresList.first : null;
            }
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
        shipmentDtoBody: ShipmentCostDto((b) => b
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
          senderAddress: AddressableAddDto((a) => a
            ..addressDetails = selectedSenderStoreAddress?.addressDetails
            ..governorateId = selectedSenderStoreAddress?.governorateId
            ..cityId = selectedSenderStoreAddress?.cityId
            ..countryId = selectedSenderStoreAddress?.countryId
            ..zipcode = selectedSenderStoreAddress?.zipcode
            ..areaId = selectedSenderStoreAddress?.areaId)));
      receiverType = SenderReceiverType.customer;
      selectedReceiverStoreAddress = null;
    } else {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADING),
          senderStoreId: null,
          senderCustomerId: selectedSenderCustomerAddress!.customerId,
          senderAddress: AddressableAddDto((a) => a
            ..addressDetails = selectedSenderCustomerAddress?.addressDetails
            ..governorateId = selectedSenderCustomerAddress?.governorateId
            ..cityId = selectedSenderCustomerAddress?.cityId
            ..countryId = selectedSenderCustomerAddress?.countryId
            ..zipcode = selectedSenderCustomerAddress?.zipcode
            ..areaId = selectedSenderCustomerAddress?.areaId)));
      receiverType = SenderReceiverType.store;
      selectedReceiverCustomerAddress = null;
    }

    add(GoToNextPageEvent());
    if (senderType == SenderReceiverType.store) {
      if (receiverCustomersList.isEmpty) {
        add(const GetCustomersAddresses(requestShipmentTypes: RequestShipmentTypes.receiver));
      } else {
        emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
      }
    } else {
      emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
    }
  }

  FutureOr<void> _onSetReceiverAddress(OnSetReceiverAddress event, Emitter<RequestNewShipmentState> emit) {
    if (receiverType == SenderReceiverType.store) {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADING),
          receiverStoreId: selectedReceiverStoreAddress!.storeId,
          receiverCustomerId: null,
          receiverAddress: AddressableAddDto((a) => a
            ..addressDetails = selectedReceiverStoreAddress?.addressDetails
            ..governorateId = selectedReceiverStoreAddress?.governorateId
            ..cityId = selectedReceiverStoreAddress?.cityId
            ..countryId = selectedReceiverStoreAddress?.countryId
            ..zipcode = selectedReceiverStoreAddress?.zipcode
            ..areaId = selectedReceiverStoreAddress?.areaId)));
    } else {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADING),
          receiverStoreId: null,
          receiverCustomerId: selectedReceiverCustomerAddress!.customerId,
          receiverAddress: AddressableAddDto((a) => a
            ..addressDetails = selectedReceiverCustomerAddress?.addressDetails
            ..governorateId = selectedReceiverCustomerAddress?.governorateId
            ..cityId = selectedReceiverCustomerAddress?.cityId
            ..countryId = selectedReceiverCustomerAddress?.countryId
            ..zipcode = selectedReceiverCustomerAddress?.zipcode
            ..areaId = selectedReceiverCustomerAddress?.areaId)));
    }

    add(GoToNextPageEvent());
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }

  FutureOr<void> _setShipmentId(SetShipmentId event, Emitter<RequestNewShipmentState> emit) {
    ///
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING), shipmentId: event.shipmentId));

    ///save shipmentId
    getIt<SharedPrefService>().setShipmentId(event.shipmentId);

    /// go to Shipment payment screen
    add(GoToNextPageEvent());

    ///
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }

  FutureOr<void> _resetCustomerList(ResetCustomerList event, Emitter<RequestNewShipmentState> emit) {
    if (event.requestShipmentType == RequestShipmentTypes.sender) {
      senderCustomersList = [];
    } else {
      receiverCustomersList = [];
    }
  }
}
