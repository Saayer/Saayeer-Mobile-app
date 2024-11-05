import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/services/url_services/pdf_url_service.dart';
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
    on<DownloadShipment>(_downloadShipment);
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
            for (var item in rightResult) {
              trackingList.putIfAbsent(item);

              /// update the main tracking list
              for (int i = 0; mainTrackingList.length > i; i++) {
                if (mainTrackingList[i].status == item.status) {
                  mainTrackingList[i] = item;
                }
              }

              /// add any error tracking item not equal to main tracking list [requested-picked-onTheWay-delivered]
              if (!mainTrackingList.any((element) => element.status == item.status) &&
                  item.status != ShipmentStatusEnum.paid) {
                errorTrackingItem = item;
              }
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

  FutureOr<void> _downloadShipment(DownloadShipment event, Emitter<ShipmentDetailsState> emit) async {
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADING),
    ));

    ///
    //PdfUrlService().pdfUrlServiceInit(event.labelUrl, event.shipmentId);

    ///
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.SUCCESS),
    ));
  }

  @override
  Future<void> close() {
    //PdfUrlService().dispose();
    return super.close();
  }
}
