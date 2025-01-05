import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/clients/core/utils/enums/enums.dart';
import 'package:saayer/features/clients/domain/use_cases/get_clients_List_usecase.dart';

part 'clients_event.dart';

part 'clients_state.dart';

@Injectable()
class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  final GetClientsListUseCase getClientsListUseCase;

  ClientsBloc({required this.getClientsListUseCase}) : super(const ClientsState()) {
    on<GetClientsListByFilter>(_getClientsListByFilter);
    on<RefreshClients>(_refreshClients);
    on<ResetClientsList>(_resetClientsList);
    on<OnTextChange>(_onTextChange);
    on<OnScrollPagination>(_onScrollPagination);
  }

  ///Client Filter Controller
  final TextEditingController clientsSearchController = TextEditingController();
  final TextEditingController clientPhoneController = TextEditingController();
  final TextEditingController clientsTotalShipmentMinController = TextEditingController();
  final TextEditingController clientsTotalShipmentMaxController = TextEditingController();
  final ScrollController clientsScrollController = ScrollController();
  PhoneNumber mobile = PhoneNumber(isoCode: 'SA', dialCode: '+966');

  ///
  List<ClientGetDto> clientsList = [];

  ///pagination util
  final _pageSize = 10;

  FutureOr<void> _getClientsListByFilter(GetClientsListByFilter event, Emitter<ClientsState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        clientsQuery: ClientsQuery((b) => b
          ..general = clientsSearchController.text.isEmpty ? null : clientsSearchController.text
          ..phoneNo = clientPhoneController.text.isEmpty ? null : mobile.phoneNumber
          ..totalShipmentsMin =
              clientsTotalShipmentMinController.text.isEmpty ? null : int.parse(clientsTotalShipmentMinController.text)
          ..totalShipmentsMax =
              clientsTotalShipmentMaxController.text.isEmpty ? null : int.parse(clientsTotalShipmentMaxController.text)
          ..skip = clientsList.length
          ..take = _pageSize)));

    await getClientsListUseCase(state.clientsQuery).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper
                .copyWith(requestState: RequestState.ERROR, errorStatus: ClientsErrorStatus.ERROR_GET_CLIENTS)));
      } else {
        final List<ClientGetDto>? rightResult = (result as Right).value;

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
            stateHelper:
                const StateHelper(requestState: RequestState.ERROR, errorStatus: ClientsErrorStatus.ERROR_GET_CLIENTS),
          ));
        }
      }
    });
  }

  FutureOr<void> _onTextChange(OnTextChange event, Emitter<ClientsState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final bool isPhone = (event.clientsFilterTypes == ClientsFilterTypes.MOBILE);
    if (isPhone) {
      mobile = event.phoneNumber!;
    }
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _refreshClients(RefreshClients event, Emitter<ClientsState> emit) {
    add(const ResetClientsList());
    add(const GetClientsListByFilter());
  }

  FutureOr<void> _resetClientsList(ResetClientsList event, Emitter<ClientsState> emit) {
    clientsList = [];
  }

  FutureOr<void> _onScrollPagination(OnScrollPagination event, Emitter<ClientsState> emit) {
    if (!clientsScrollController.hasClients) return null;
    final maxScroll = clientsScrollController.position.maxScrollExtent;
    final currentScroll = clientsScrollController.position.pixels;
    if (currentScroll == maxScroll) {
      if (state.hasNextPage ?? false) {
        add(const GetClientsListByFilter());
      }
    }
  }

  @override
  Future<void> close() {
    clientsScrollController
      ..removeListener(() => _onScrollPagination)
      ..dispose();
    return super.close();
  }
}
