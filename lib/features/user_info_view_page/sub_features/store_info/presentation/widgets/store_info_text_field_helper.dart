import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/core/utils/enums/enums.dart';
import 'dart:ui' as ui;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/presentation/bloc/store_info_bloc.dart';

class StoreInfoTextFieldHelper {
  Widget getTextField(
      StoreInfoBloc storeInfoBloc, StoreInfoFieldsTypes storeInfoFieldsType) {
    switch (storeInfoFieldsType) {
      default:
        {
          return InputTextField(
            label: storeInfoFieldsType.name.toLowerCase(),
            inputController:
                _getInputController(storeInfoBloc, storeInfoFieldsType),
            onChanged: (val) {
              storeInfoBloc.add(OnTextChange(
                  str: val,
                  storeInfoFieldsType: storeInfoFieldsType,
                  textEditingController:
                      _getInputController(storeInfoBloc, storeInfoFieldsType)));
            },
          );
        }
    }
  }

  TextEditingController _getInputController(
      StoreInfoBloc storeInfoBloc, StoreInfoFieldsTypes storeInfoFieldsType) {
    switch (storeInfoFieldsType) {
      case StoreInfoFieldsTypes.NAME:
        {
          return storeInfoBloc.nameController;
        }
      case StoreInfoFieldsTypes.URL:
        {
          return storeInfoBloc.urlController;
        }
      case StoreInfoFieldsTypes.MAROOF_ID:
        {
          return storeInfoBloc.maroofIdController;
        }
      case StoreInfoFieldsTypes.COMMERCIAL_REGISTERATION_NO:
        {
          return storeInfoBloc.commercialRegistrationNoController;
        }
    }
  }

  static bool enableStoreInfo(StoreInfoBloc storeInfoBloc) {
    log("${storeInfoBloc.storeInfoFieldsValidMap}",
        name: "enableStoreInfo --->");
    if (storeInfoBloc.storeInfoFieldsValidMap.values.length ==
        StoreInfoFieldsTypes.values.length) {
      return storeInfoBloc.storeInfoFieldsValidMap.values
          .every((element) => element == true);
    }
    return false;
  }
}
