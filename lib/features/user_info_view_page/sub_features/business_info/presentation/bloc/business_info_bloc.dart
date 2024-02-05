import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/core/utils/enums/enums.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/business_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/submit_business_info_entity.dart';

part 'business_info_event.dart';

part 'business_info_state.dart';

@Injectable()
class BusinessInfoBloc extends Bloc<BusinessInfoEvent, BusinessInfoState> {
  BusinessInfoBloc() : super(const BusinessInfoState()) {
    on<OnTextChange>(_onTextChange);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController commercialRegistrationNoController =
      TextEditingController();
  final TextEditingController shortAddressController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  Map<BusinessInfoFieldsTypes, bool> businessInfoFieldsValidMap = {};

  FutureOr<void> _onTextChange(
      OnTextChange event, Emitter<BusinessInfoState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final bool isPhone =
        (event.businessInfoFieldsType == BusinessInfoFieldsTypes.MOBILE_NUMBER);
    if (!isPhone) {
      event.textEditingController!.text = event.str ?? "";
      TextSelection previousSelection = event.textEditingController!.selection;
      event.textEditingController!.selection = previousSelection;
    }
    log("onTextChange ${event.str}", name: "onTextChange");
    businessInfoFieldsValidMap[event.businessInfoFieldsType] = !isPhone
        ? (event.str?.isNotEmpty ?? false)
        : (event.phoneNumber?.phoneNumber?.isNotEmpty ?? false);
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        businessInfoEntity: BusinessInfoEntity(
            phoneNumber: event.phoneNumber ?? PhoneNumber())));
  }
}
