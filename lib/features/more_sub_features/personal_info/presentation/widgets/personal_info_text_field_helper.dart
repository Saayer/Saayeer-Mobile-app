import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/features/more_sub_features/personal_info/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/personal_info/presentation/bloc/personal_info_bloc.dart';

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
      case PersonalInfoFieldsTypes.PHONE:
        {
          return personalInfoBloc.phoneController;
        }
      case PersonalInfoFieldsTypes.EMAIL:
        {
          return personalInfoBloc.emailController;
        }
      case PersonalInfoFieldsTypes.BUSINESSNAME:
        {
          return personalInfoBloc.businessNameController;
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
