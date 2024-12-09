import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/shipment_details_tracking_info/data/core/utils/enums.dart';
import 'package:saayer/features/shipment_details_tracking_info/domain/use_cases/tracking_list_usecase.dart';

part 'shipment_details_event.dart';

part 'shipment_details_state.dart';

@Injectable()
class ShipmentDetailsBloc extends Bloc<ShipmentDetailsEvent, ShipmentDetailsState> {
  final TrackingListUseCase trackingListUseCase;

  ShipmentDetailsBloc({
    required this.trackingListUseCase,
  }) : super(const ShipmentDetailsState()) {
    on<InitShipmentDetails>(_initShipmentDetails);
    on<GetShipmentTrackingList>(_getShipmentTrackingList);
  }

  final TextEditingController promoCodeController = TextEditingController();

  ///
  List<ShipmentStatusGetDto> mainTrackingList = [
    ShipmentStatusGetDto((t) => t..status = ShipmentStatusEnum.requested),
    ShipmentStatusGetDto((t) => t..status = ShipmentStatusEnum.picked),
    ShipmentStatusGetDto((t) => t..status = ShipmentStatusEnum.onTheWay),
    ShipmentStatusGetDto((t) => t..status = ShipmentStatusEnum.delivered),
  ];
  List<ShipmentStatusGetDto> trackingList = [];
  ShipmentStatusGetDto? errorTrackingItem;

  FutureOr<void> _initShipmentDetails(InitShipmentDetails event, Emitter<ShipmentDetailsState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
      shipmentDto: event.shipmentDto,
    ));
  }

  FutureOr<void> _getShipmentTrackingList(GetShipmentTrackingList event, Emitter<ShipmentDetailsState> emit) async {
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADING),
    ));

    await trackingListUseCase(event.shipmentId).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper.copyWith(
                requestState: RequestState.ERROR, errorStatus: ShipmentTrackingDetailsErrorStatus.ERROR_GET_TRACKING)));
      } else {
        final List<ShipmentStatusGetDto>? rightResult = (result as Right).value;

        if (rightResult != null) {
          emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: "")));

          if (rightResult.isNotEmpty) {
            var allStatusListSortedByDate = rightResult;
            allStatusListSortedByDate.sort((a, b) {
              var aDate = a.createdAt;
              var bDate = b.createdAt;
              return aDate!.compareTo(bDate!);
            });
            for (var item in allStatusListSortedByDate) {
              trackingList.putIfAbsent(item);

              /// update the main tracking list
              for (int i = 0; mainTrackingList.length > i; i++) {
                if (mainTrackingList[i].status == item.status) {
                  mainTrackingList[i] = item;
                }
              }
            }

            /// add last error tracking item not equal to main tracking list
            /// [paid-requested-picked-onTheWay-delivered] and ignored status
            if (allStatusListSortedByDate.last.status != ShipmentStatusEnum.paid &&
                allStatusListSortedByDate.last.status != ShipmentStatusEnum.requested &&
                allStatusListSortedByDate.last.status != ShipmentStatusEnum.picked &&
                allStatusListSortedByDate.last.status != ShipmentStatusEnum.onTheWay &&
                allStatusListSortedByDate.last.status != ShipmentStatusEnum.ignored &&
                allStatusListSortedByDate.last.status != ShipmentStatusEnum.delivered) {
              errorTrackingItem = allStatusListSortedByDate.last;
            }
          }

          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              shipmentTrackingList: mainTrackingList,
              errorTrackingItem: errorTrackingItem));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: ShipmentTrackingDetailsErrorStatus.ERROR_GET_TRACKING),
          ));
        }
      }
    });
  }
}
