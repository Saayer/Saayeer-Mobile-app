import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/domain/usecases/get_stores_usecase.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/domain/use_cases/get_admin_shipments_list_usecase.dart';
import 'package:saayer/features/shipments/domain/use_cases/get_clients_list_usecase.dart';
import 'package:saayer/features/shipments/domain/use_cases/get_service_providers_list_usecase.dart';
import 'package:saayer/features/shipments/domain/use_cases/get_shipments_List_usecase.dart';

part 'shipments_event.dart';

part 'shipments_state.dart';

@Injectable()
class ShipmentsBloc extends Bloc<ShipmentsEvent, ShipmentsState> {
  final GetShipmentsListUseCase getShipmentsListUseCase;
  final GetStoresUseCase getStoresUseCase;
  final GetServiceProvidersListUseCase getServiceProvidersListUseCase;
  final GetAdminShipmentsListUseCase getAdminShipmentsListUseCase;
  final GetClientsListUseCase getClientsListUseCase;

  ShipmentsBloc({
    required this.getShipmentsListUseCase,
    required this.getStoresUseCase,
    required this.getServiceProvidersListUseCase,
    required this.getAdminShipmentsListUseCase,
    required this.getClientsListUseCase,
  }) : super(const ShipmentsState()) {
    on<InitShipments>(_initShipments);
    on<GetExportShipments>(_getExportShipments);
    on<GetImportShipments>(_getImportShipments);
    on<GetStores>(_getStores);
    on<GetServiceProviders>(_getServiceProviders);
    on<SelectShipmentType>(_selectShipmentType);
    on<RefreshShipments>(_refreshShipments);
    on<OnItemSelectedFromDropDown>(_onItemSelectedFromDropDown);
    on<OnAdminItemSelectedFromDropDown>(_onAdminItemSelectedFromDropDown);
    on<OnScrollPagination>(_onScrollPagination);
    on<ResetExportShipmentsList>(_resetExportShipmentsList);
    on<ResetImportShipmentsList>(_resetImportShipmentsList);
    on<ResetAdminShipmentsList>(_resetAdminShipmentsList);
    on<GetAdminShipmentsList>(_getAdminShipmentsList);
    on<GetClientsList>(_getClientsList);
  }

  ///Export Filter Controller
  final TextEditingController exportSearchController = TextEditingController();
  final TextEditingController exportShipmentDateFromController = TextEditingController();
  final TextEditingController exportShipmentDateToController = TextEditingController();
  final TextEditingController exportShipmentStatusController = TextEditingController();
  final ScrollController exportScrollController = ScrollController();
  DateTime? exportShipmentDateFrom;
  DateTime? exportShipmentDateTo;

  ///
  ShipmentStatusEnum? selectedExportShipmentStatus;
  StoreGetDto? selectedExportStore;
  LogisticsServiceBase? selectedExportServiceProvider;

  ///
  List<StoreGetDto> exportStoresList = [];
  List<LogisticsServiceBase> exportServiceProvidersList = [];
  List<ShipmentGetDto> exportShipmentsList = [];

  ///Import Filter Controller
  final TextEditingController importSearchController = TextEditingController();
  final TextEditingController importShipmentDateFromController = TextEditingController();
  final TextEditingController importShipmentDateToController = TextEditingController();
  final TextEditingController importShipmentStatusController = TextEditingController();
  final ScrollController importScrollController = ScrollController();
  DateTime? importShipmentDateFrom;
  DateTime? importShipmentDateTo;

  ///
  ShipmentStatusEnum? selectedImportShipmentStatus;
  StoreGetDto? selectedImportStore;
  LogisticsServiceBase? selectedImportServiceProvider;

  ///
  List<StoreGetDto> importStoresList = [];
  List<LogisticsServiceBase> importServiceProvidersList = [];
  List<ShipmentGetDto> importShipmentsList = [];

  ///Admin shipment Filter Controller
  final TextEditingController adminSearchController = TextEditingController();
  final TextEditingController adminShipmentDateFromController = TextEditingController();
  final TextEditingController adminShipmentDateToController = TextEditingController();
  final TextEditingController adminShipmentStatusController = TextEditingController();
  final ScrollController adminShipmentsScrollController = ScrollController();
  DateTime? adminShipmentDateFrom;
  DateTime? adminShipmentDateTo;

  ///
  ShipmentStatusEnum? selectedAdminShipmentStatus;
  LogisticsServiceBase? selectedAdminServiceProvider;
  ClientNamesRespnse? selectedClientName;

  ///
  List<ShipmentGetDtoExtended> adminShipmentsList = [];
  List<LogisticsServiceBase> adminServiceProvidersList = [];
  List<ClientNamesRespnse> clientsList = [];

  ///pagination util
  final _pageSize = 10;

  ///
  List<ShipmentStatusEnum> shipmentStatusList = [
    ShipmentStatusEnum.requested,
    ShipmentStatusEnum.picked,
    ShipmentStatusEnum.onTheWay,
    ShipmentStatusEnum.delivered,
  ];

  FutureOr<void> _initShipments(InitShipments event, Emitter<ShipmentsState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    selectedExportShipmentStatus = event.initExportShipmentStatusFilter;
    exportShipmentDateFrom = event.exportShipmentDateFrom;
    exportShipmentDateFromController.text = DateTimeUtil.dMyString(exportShipmentDateFrom);
    exportShipmentDateTo = event.exportShipmentDateTo;
    exportShipmentDateToController.text = DateTimeUtil.dMyString(exportShipmentDateTo);
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), isFromHome: event.isFromHome));
  }

  FutureOr<void> _getExportShipments(GetExportShipments event, Emitter<ShipmentsState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        exportShipmentQuery: ShipmentQuery((b) => b
          ..general = exportSearchController.text.isEmpty ? null : exportSearchController.text
          ..shippingDateFrom = exportShipmentDateFrom
          ..shippingDateTo = exportShipmentDateTo
          ..storeId = selectedExportStore?.storeId
          ..status = selectedExportShipmentStatus
          ..isReturn = false
          ..logisticServiceName = selectedExportServiceProvider?.name
          ..skip = exportShipmentsList.length
          ..take = _pageSize)));

    await getShipmentsListUseCase(state.exportShipmentQuery).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper
                .copyWith(requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_SHIPMENTS)));
      } else {
        final List<ShipmentGetDto>? rightResult = (result as Right).value;

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
            exportShipmentsList.putIfAbsent(item);
          }
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              exportShipmentsList: exportShipmentsList));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_SHIPMENTS),
          ));
        }
      }
    });
  }

  FutureOr<void> _getImportShipments(GetImportShipments event, Emitter<ShipmentsState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        importShipmentQuery: ShipmentQuery((b) => b
          ..general = importSearchController.text.isEmpty ? null : importSearchController.text
          ..shippingDateFrom = importShipmentDateFrom
          ..shippingDateTo = importShipmentDateTo
          ..storeId = selectedImportStore?.storeId
          ..status = selectedImportShipmentStatus
          ..isReturn = true
          ..logisticServiceName = selectedImportServiceProvider?.name
          ..skip = importShipmentsList.length
          ..take = _pageSize)));

    await getShipmentsListUseCase(state.importShipmentQuery).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper
                .copyWith(requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_SHIPMENTS)));
      } else {
        final List<ShipmentGetDto>? rightResult = (result as Right).value;

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
            importShipmentsList.putIfAbsent(item);
          }
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              importShipmentsList: importShipmentsList));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_SHIPMENTS),
          ));
        }
      }
    });
  }

  FutureOr<void> _selectShipmentType(SelectShipmentType event, Emitter<ShipmentsState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), selectedShipmentsType: event.shipmentsType));
  }

  FutureOr<void> _refreshShipments(RefreshShipments event, Emitter<ShipmentsState> emit) {
    if (state.selectedShipmentsType == ShipmentsListTypes.EXPORT) {
      add(const ResetExportShipmentsList());
      add(const GetExportShipments());
    } else {
      add(const ResetImportShipmentsList());
      add(const GetImportShipments());
    }
  }

  FutureOr<void> _getStores(GetStores event, Emitter<ShipmentsState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await getStoresUseCase(const NoParameters()).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper
                .copyWith(requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_STORES)));
      } else {
        final List<StoreGetDto>? rightResult = (result as Right).value;

        if (rightResult != null) {
          emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: "")));

          for (var item in rightResult) {
            if (state.selectedShipmentsType == ShipmentsListTypes.EXPORT) {
              exportStoresList.putIfAbsent(item);
            } else {
              importStoresList.putIfAbsent(item);
            }
          }
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              storesList:
                  state.selectedShipmentsType == ShipmentsListTypes.EXPORT ? exportStoresList : importStoresList));
        } else {
          emit(state.copyWith(
            stateHelper:
                const StateHelper(requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_STORES),
          ));
        }
      }
    });
  }

  FutureOr<void> _onItemSelectedFromDropDown(OnItemSelectedFromDropDown<dynamic> event, Emitter<ShipmentsState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    if (event.shipmentsFilterTypes == ShipmentsFilterTypes.STORE) {
      if (event.shipmentsListTypes == ShipmentsListTypes.EXPORT) {
        selectedExportStore = event.item;
      } else {
        selectedImportStore = event.item;
      }
    } else if (event.shipmentsFilterTypes == ShipmentsFilterTypes.SERVICE_PROVIDER) {
      if (event.shipmentsListTypes == ShipmentsListTypes.EXPORT) {
        selectedExportServiceProvider = event.item;
      } else {
        selectedImportServiceProvider = event.item;
      }
    } else if (event.shipmentsFilterTypes == ShipmentsFilterTypes.STATUS) {
      if (event.shipmentsListTypes == ShipmentsListTypes.EXPORT) {
        selectedExportShipmentStatus = event.item;
      } else {
        selectedImportShipmentStatus = event.item;
      }
    }
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _getServiceProviders(GetServiceProviders event, Emitter<ShipmentsState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await getServiceProvidersListUseCase(const NoParameters()).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper.copyWith(
                requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_SERVICE_PROVIDERS)));
      } else {
        final List<LogisticsServiceBase>? rightResult = (result as Right).value;

        if (rightResult != null) {
          emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: "")));

          for (var item in rightResult) {
            if (state.selectedShipmentsType == ShipmentsListTypes.EXPORT) {
              exportServiceProvidersList.putIfAbsent(item);
            } else {
              importServiceProvidersList.putIfAbsent(item);
            }
            adminServiceProvidersList.putIfAbsent(item);
          }
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              serviceProvidersList: state.selectedShipmentsType == ShipmentsListTypes.EXPORT
                  ? exportServiceProvidersList
                  : importServiceProvidersList));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_SERVICE_PROVIDERS),
          ));
        }
      }
    });
  }

  Future<FutureOr<void>> _onScrollPagination(OnScrollPagination event, Emitter<ShipmentsState> emit) async {
    if (UserUtils.isAdmin()) {
      if (!adminShipmentsScrollController.hasClients) return null;
      final maxScroll = adminShipmentsScrollController.position.maxScrollExtent;
      final currentScroll = adminShipmentsScrollController.position.pixels;
      if (currentScroll == maxScroll) {
        if (state.hasNextPage ?? false) {
          add(const GetAdminShipmentsList());
        }
      }
    } else {
      if (state.selectedShipmentsType == ShipmentsListTypes.EXPORT) {
        if (!exportScrollController.hasClients) return null;
        final maxScroll = exportScrollController.position.maxScrollExtent;
        final currentScroll = exportScrollController.position.pixels;
        if (currentScroll == maxScroll) {
          if (state.hasNextPage ?? false) {
            add(const GetExportShipments());
          }
        }
      } else {
        if (!importScrollController.hasClients) return null;
        final maxScroll = importScrollController.position.maxScrollExtent;
        final currentScroll = importScrollController.position.pixels;
        if (currentScroll == maxScroll) {
          if (state.hasNextPage ?? false) {
            add(const GetImportShipments());
          }
        }
      }
    }
  }

  FutureOr<void> _resetExportShipmentsList(ResetExportShipmentsList event, Emitter<ShipmentsState> emit) {
    exportShipmentsList = [];
  }

  FutureOr<void> _resetImportShipmentsList(ResetImportShipmentsList event, Emitter<ShipmentsState> emit) {
    importShipmentsList = [];
  }

  FutureOr<void> _resetAdminShipmentsList(ResetAdminShipmentsList event, Emitter<ShipmentsState> emit) {
    adminShipmentsList = [];
  }

  @override
  Future<void> close() {
    exportScrollController
      ..removeListener(() => _onScrollPagination)
      ..dispose();
    importScrollController
      ..removeListener(() => _onScrollPagination)
      ..dispose();
    adminShipmentsScrollController
      ..removeListener(() => _onScrollPagination)
      ..dispose();
    return super.close();
  }

  FutureOr<void> _getAdminShipmentsList(GetAdminShipmentsList event, Emitter<ShipmentsState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        adminShipmentQuery: ShipmentQueryLAdmin((b) => b
          ..general = adminSearchController.text.isEmpty ? null : adminSearchController.text
          ..shippingDateFrom = adminShipmentDateFrom
          ..shippingDateTo = adminShipmentDateTo
          ..status = selectedAdminShipmentStatus
          ..logisticServiceName = selectedAdminServiceProvider?.name
          ..clientId = selectedClientName?.clientId
          ..skip = adminShipmentsList.length
          ..take = _pageSize)));

    await getAdminShipmentsListUseCase(state.adminShipmentQuery).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper
                .copyWith(requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_SHIPMENTS)));
      } else {
        final List<ShipmentGetDtoExtended>? rightResult = (result as Right).value;

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
            adminShipmentsList.putIfAbsent(item);
          }
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              adminShipmentsList: adminShipmentsList));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_SHIPMENTS),
          ));
        }
      }
    });
  }

  FutureOr<void> _getClientsList(GetClientsList event, Emitter<ShipmentsState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await getClientsListUseCase(const NoParameters()).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper
                .copyWith(requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_CLIENTS)));
      } else {
        final List<ClientNamesRespnse>? rightResult = (result as Right).value;

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
            clientsList.putIfAbsent(item);
          }
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              clientsList: clientsList));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: ShipmentsErrorStatus.ERROR_GET_CLIENTS),
          ));
        }
      }
    });
  }

  FutureOr<void> _onAdminItemSelectedFromDropDown(
      OnAdminItemSelectedFromDropDown<dynamic> event, Emitter<ShipmentsState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    if (event.adminShipmentsFilterTypes == AdminShipmentsFilterTypes.CLIENT) {
      selectedClientName = event.item;
    } else if (event.adminShipmentsFilterTypes == AdminShipmentsFilterTypes.SERVICE_PROVIDER) {
      selectedAdminServiceProvider = event.item;
    } else if (event.adminShipmentsFilterTypes == AdminShipmentsFilterTypes.STATUS) {
      selectedAdminShipmentStatus = event.item;
    }
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }
}
