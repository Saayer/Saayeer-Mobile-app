import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/features/more_sub_features/personal_info/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/personal_info/presentation/bloc/personal_info_bloc.dart';
import 'dart:ui' as ui;

class PersonalInfoTextFieldHelper {
  final PersonalInfoBloc personalInfoBloc;
  final PersonalInfoFieldsTypes personalInfoFieldsType;

  PersonalInfoTextFieldHelper({required this.personalInfoBloc, required this.personalInfoFieldsType});

  Widget getTextField() {
    switch (personalInfoFieldsType) {
      case PersonalInfoFieldsTypes.NAME:
        {
          return _getFullNameTextField();
        }
      case PersonalInfoFieldsTypes.EMAIL:
        {
          return _buildEmailTextField();
        }
      case PersonalInfoFieldsTypes.PHONE:
        {
          return _getMobileTextField();
        }
      case PersonalInfoFieldsTypes.BUSINESSNAME:
        {
          return _buildBusinessTextField();
        }
      default:
        {
          return InputTextField(
            label: personalInfoFieldsType.name.toLowerCase(),
            inputController: _getInputController(personalInfoBloc, personalInfoFieldsType),
            onChanged: (val) {
              personalInfoBloc.add(OnTextChange(
                  str: val,
                  personalInfoFieldsType: personalInfoFieldsType,
                  textEditingController: _getInputController(personalInfoBloc, personalInfoFieldsType)));
            },
          );
        }
    }
  }

  TextEditingController _getInputController(
      PersonalInfoBloc personalInfoBloc, PersonalInfoFieldsTypes personalInfoFieldsType) {
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
    log("${personalInfoBloc.personalInfoFieldsValidMap}", name: "enablePersonalInfo --->");
    if (personalInfoBloc.personalInfoFieldsValidMap.values.length == PersonalInfoFieldsTypes.values.length) {
      return personalInfoBloc.personalInfoFieldsValidMap.values.every((element) => element == true);
    }
    return false;
  }

  Widget _buildEmailTextField() {
    return EmailTextField(
      emailController: _getInputController(personalInfoBloc, personalInfoFieldsType),
      onChanged: (val) {},
    );
  }

  Widget _getFullNameTextField() {
    return InputTextField(
      withValidator: true,
      isFieldRequired: true,
      label: personalInfoFieldsType.name,
      inputController: _getInputController(personalInfoBloc, personalInfoFieldsType),
      keyboardType: TextInputType.text,
      onChanged: (val) {},
    );
  }

  Widget _getMobileTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LabelTxt(txt: '${personalInfoFieldsType.name.tr()} *'),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Directionality(
          textDirection: ui.TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PhoneTextField(
              phoneNumController: _getInputController(personalInfoBloc, personalInfoFieldsType),
              onInputChanged: (PhoneNumber phoneNumber) {
                log("dialCode: ${phoneNumber.dialCode} - isoCode: ${phoneNumber.isoCode} - phoneNumber: ${phoneNumber.phoneNumber}",
                    name: "onInputChanged --->");
                log("${phoneNumber.phoneNumber}", name: "PhoneTextField onInputChanged ->");
                personalInfoBloc.add(OnTextChange(
                    phoneNumber: phoneNumber,
                    personalInfoFieldsType: PersonalInfoFieldsTypes.PHONE,
                    textEditingController: _getInputController(personalInfoBloc, personalInfoFieldsType)));
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBusinessTextField() {
    return InputTextField(
      withValidator: false,
      isFieldRequired: false,
      label: personalInfoFieldsType.name,
      inputController: _getInputController(personalInfoBloc, personalInfoFieldsType),
      keyboardType: TextInputType.number,
      onChanged: (val) {},
    );
  }
}
