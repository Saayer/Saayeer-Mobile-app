import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/data/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/domain/entities/address_shipment_entity.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/domain/entities/submit_address_shipment_entity.dart';

part 'address_shipment_event.dart';

part 'address_shipment_state.dart';

@Injectable()
class AddressShipmentBloc
    extends Bloc<AddressShipmentEvent, AddressShipmentState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController selectAddressController = TextEditingController();
  final TextEditingController selectCityController = TextEditingController();
  final TextEditingController selectDistrictController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController shortAddressController = TextEditingController();
  Map<AddressShipmentsFieldsTypes, bool> addressShipmentsFieldsValidMap = {};


  AddressShipmentBloc() : super(AddressShipmentState()) {
    on<AddressShipmentEvent>((event, emit) {


    });
  }
}
