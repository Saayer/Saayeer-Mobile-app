import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/core/utils/enums/enums.dart';
import 'dart:ui' as ui;
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/bloc/personal_info_bloc.dart';

class PersonalInfoTextFieldHelper {
  Widget getTextField(PersonalInfoBloc personalInfoBloc,
      PersonalInfoFieldsTypes personalInfoFieldsType) {
    switch (personalInfoFieldsType) {
      case PersonalInfoFieldsTypes.EMAIL:
        {
          return EmailTextField(
            emailController:
                _getInputController(personalInfoBloc, personalInfoFieldsType),
            onChanged: (val) {
              personalInfoBloc.add(OnTextChange(
                  str: val,
                  personalInfoFieldsType: PersonalInfoFieldsTypes.EMAIL,
                  textEditingController: _getInputController(
                      personalInfoBloc, personalInfoFieldsType)));
            },
          );
        }
      default:
        {
          return InputTextField(
            label: personalInfoFieldsType.name.toLowerCase(),
            inputController:
                _getInputController(personalInfoBloc, personalInfoFieldsType),
            onChanged: (val) {
              personalInfoBloc.add(OnTextChange(
                  str: val,
                  personalInfoFieldsType: personalInfoFieldsType,
                  textEditingController: _getInputController(
                      personalInfoBloc, personalInfoFieldsType)));
            },
          );
        }
    }
  }

  TextEditingController _getInputController(PersonalInfoBloc personalInfoBloc,
      PersonalInfoFieldsTypes personalInfoFieldsType) {
    switch (personalInfoFieldsType) {
      case PersonalInfoFieldsTypes.NAME:
        {
          return personalInfoBloc.nameController;
        }
      case PersonalInfoFieldsTypes.EMAIL:
        {
          return personalInfoBloc.emailController;
        }
      case PersonalInfoFieldsTypes.NATIONAL_ID:
        {
          return personalInfoBloc.nationalIDController;
        }
      case PersonalInfoFieldsTypes.ADDRESS:
        {
          return personalInfoBloc.addressController;
        }
      case PersonalInfoFieldsTypes.DISTRICT:
        {
          return personalInfoBloc.districtController;
        }
      case PersonalInfoFieldsTypes.GOVERNORATE:
        {
          return personalInfoBloc.governorateController;
        }
    }
  }

  static bool enablePersonalInfo(PersonalInfoBloc personalInfoBloc) {
    log("${personalInfoBloc.personalInfoFieldsValidMap}",
        name: "enablePersonalInfo --->");
    if (personalInfoBloc.personalInfoFieldsValidMap.values.length ==
        PersonalInfoFieldsTypes.values.length) {
      return personalInfoBloc.personalInfoFieldsValidMap.values
          .every((element) => element == true);
    }
    return false;
  }
}
