import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/more_sub_features/shipping_partners/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/shipping_partners/domain/usecases/get_shipping_partners_usecase.dart';

part 'shipping_partners_event.dart';

part 'shipping_partners_state.dart';

@Injectable()
class ShippingPartnersBloc extends Bloc<ShippingPartnersEvent, ShippingPartnersState> {
  final GetShippingPartnersUseCase getShippingPartnersUseCase;

  ShippingPartnersBloc({required this.getShippingPartnersUseCase}) : super(const ShippingPartnersState()) {
    on<GetShippingPartners>(_getShippingPartners);
  }

  ///
  List<LogisticsServiceBase> shippingPartnersList = [];

  FutureOr<void> _getShippingPartners(GetShippingPartners event, Emitter<ShippingPartnersState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await getShippingPartnersUseCase(const NoParameters()).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper.copyWith(
                requestState: RequestState.ERROR,
                errorStatus: ShippingPartnersErrorStatus.ERROR_GET_SHIPPINGPARTNERS)));
      } else {
        final List<LogisticsServiceBase>? rightResult = (result as Right).value;

        if (rightResult != null) {
          emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: "")));

          for (var item in rightResult) {
            shippingPartnersList.putIfAbsent(item);
          }
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              shippingPartnersList: shippingPartnersList));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: ShippingPartnersErrorStatus.ERROR_GET_SHIPPINGPARTNERS),
          ));
        }
      }
    });
  }
}
