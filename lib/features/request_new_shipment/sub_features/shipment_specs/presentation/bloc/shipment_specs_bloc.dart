import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/core/utils/enums/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/domain/entities/shipment_specs_entity.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/domain/entities/shipment_specs_info_entity.dart';

part 'shipment_specs_event.dart';

part 'shipment_specs_state.dart';

@Injectable()
class ShipmentSpecsBloc extends Bloc<ShipmentSpecsEvent, ShipmentSpecsState> {

  ShipmentSpecsBloc()
      : super(const ShipmentSpecsState()) {
    on<OnTextChange>(_onTextChange);
    on<SubmitShipmentSpecsInfoData>(_submitStoreInfoData);
    on<ToggleAutoValidate>(_toggleAutoValidate);
    on<SubmitShipmentSpecsInfo>(_submitStoreInfo);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController contentController =
  TextEditingController();


  Map<ShipmentSpecsFieldsTypes, bool> shipmentSpecsFieldsTypesValidMap = {};

  FutureOr<void> _onTextChange(OnTextChange event,
      Emitter<ShipmentSpecsState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    event.textEditingController!.text = event.str ?? "";
    TextSelection previousSelection = event.textEditingController!.selection;
    event.textEditingController!.selection = previousSelection;
    log("onTextChange ${event.str}", name: "onTextChange");
    shipmentSpecsFieldsTypesValidMap[event.shipmentSpecsFieldsTypes] =
    (event.str?.isNotEmpty ?? false);
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  Future<FutureOr<void>> _submitStoreInfoData(SubmitShipmentSpecsInfoData event,
      Emitter<ShipmentSpecsState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        shipmentSpecsEntity: ShipmentSpecsEntity(
          width: widthController.text,
          weight: weightController.text,
          height: heightController.text,
          cost: costController.text,
          length: costController.text,
          content: contentController.text,
        )));
    print('state.shipmentSpecsEntity!.length');
    print( "daskjhsadkjads "+state.shipmentSpecsEntity!.length.toString());
    print( "daskjhsadkjads "+state.shipmentSpecsEntity!.weight.toString());
    // await _submitStoreInfo(SubmitStoreInfo(), emit);
  }


  // Future<FutureOr<void>> _submitStoreInfoData(
  //     SubmitShipmentSpecsInfo event, Emitter<ShipmentSpecsState> emit) async {
  //   emit(state.copyWith(
  //       stateHelper: const StateHelper(requestState: RequestState.LOADING)));
  //
  //   emit(state.copyWith(
  //       stateHelper: const StateHelper(requestState: RequestState.LOADED),
  //       shipmentSpecsEntity: ShipmentSpecsEntity(
  //         weight   : weightController.text,
  //         length: lengthController.text,
  //         width: widthController.text,
  //         content: contentController.text,
  //         cost: costController.text,
  //         height: heightController.text,
  //       )));
  //   await _submitStoreInfo(SubmitShipmentSpecsInfo(), emit);
  // }

  FutureOr<void> _toggleAutoValidate(ToggleAutoValidate event,
      Emitter<ShipmentSpecsState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        autoValidateMode: AutovalidateMode.always));
  }

  Future<FutureOr<void>> _submitStoreInfo(ShipmentSpecsEvent event,
      Emitter<ShipmentSpecsState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    // final Either<Failure, ShipmentSpecsISubmitnfoEntity?> result =
    //     await submitStoreInfoUseCase(
    //         StoreInfoParameters(storeInfoEntity: state.storeInfoEntity!));
    //
    // if (result.isLeft()) {
    //   final Failure leftResult = (result as Left).value;
    //   log("left submitPersonalInfoData $leftResult");
    //   emit(state.copyWith(
    //       stateHelper: state.stateHelper.copyWith(
    //           requestState: RequestState.ERROR,
    //           errorStatus: StoreInfoErrorStatus.ERROR_STORE_INFO)));
    // } else {
    //   final SubmitStoreInfoEntity? rightResult = (result as Right).value;
    //   log("right submitPersonalInfoData $rightResult");
    //   if (rightResult != null) {
    //     if (rightResult.isSuccess) {
    //       emit(state.copyWith(
    //         stateHelper: const StateHelper(
    //             requestState: RequestState.SUCCESS, loadingMessage: ""),
    //         submitStoreInfoEntity: rightResult,
    //       ));
    //     } else {
    //       emit(state.copyWith(
    //         stateHelper: const StateHelper(
    //             requestState: RequestState.ERROR,
    //             errorStatus: StoreInfoErrorStatus.ERROR_STORE_INFO),
    //         submitStoreInfoEntity: rightResult,
    //       ));
    //     }
    //   } else {
    //     log("", name: "SubmitPersonalInfoEvent error");
    //     emit(state.copyWith(
    //       stateHelper: const StateHelper(
    //           requestState: RequestState.ERROR,
    //           errorStatus: StoreInfoErrorStatus.ERROR_STORE_INFO),
    //     ));
    //   }
    // }
  }
}
