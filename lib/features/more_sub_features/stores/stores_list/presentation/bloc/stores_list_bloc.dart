import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/domain/usecases/delete_store_usecase.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/domain/usecases/get_stores_usecase.dart';

part 'stores_list_event.dart';

part 'stores_list_state.dart';

@Injectable()
class StoresListBloc extends Bloc<StoresListEvent, StoresListState> {
  final GetStoresUseCase getStoresUseCase;
  final DeleteStoresUseCase deleteStoresUseCase;

  StoresListBloc({required this.getStoresUseCase, required this.deleteStoresUseCase}) : super(const StoresListState()) {
    on<GetStores>(_getStores);
    on<ResetList>(_resetList);
    on<OnStoreDelete>(_onStoreDelete);
  }

  ///
  List<StoreGetDto> storesList = [];

  FutureOr<void> _getStores(GetStores event, Emitter<StoresListState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await getStoresUseCase(const NoParameters()).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper
                .copyWith(requestState: RequestState.ERROR, errorStatus: StoresErrorStatus.ERROR_GET_STORES)));
      } else {
        final List<StoreGetDto>? rightResult = (result as Right).value;

        if (rightResult != null) {
          emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: "")));

          for (var item in rightResult) {
            storesList.putIfAbsent(item);
          }
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              storesList: storesList));
        } else {
          emit(state.copyWith(
            stateHelper:
                const StateHelper(requestState: RequestState.ERROR, errorStatus: StoresErrorStatus.ERROR_GET_STORES),
          ));
        }
      }
    });
  }

  FutureOr<void> _resetList(ResetList event, Emitter<StoresListState> emit) {
    storesList = [];
  }

  FutureOr<void> _onStoreDelete(OnStoreDelete event, Emitter<StoresListState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, void> result = await deleteStoresUseCase(event.storeDto.storeId ?? 0);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: StoresErrorStatus.ERROR_DELETE_STORES)));
    } else {

      ///
      SaayerToast().showSuccessToast(msg: "store_deleted_successfully".tr());

      ///
      storesList.removeWhere((item) => item.storeId == event.storeDto.storeId);
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          storesList: storesList));
    }
  }
}
