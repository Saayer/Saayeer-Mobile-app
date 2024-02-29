import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/drop_down_text_field.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/features/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/add_address/domain/entities/city_entity.dart';
import 'package:saayer/features/add_address/presentation/bloc/add_address_bloc.dart';
import 'dart:ui' as ui;

class AddressTextFieldHelper {
  final AddAddressBloc addAddressBloc;
  final AddAddressFieldsTypes addAddressFieldsType;

  const AddressTextFieldHelper({
    required this.addAddressBloc,
    required this.addAddressFieldsType,
  });

  //
  Widget getTextField() {
    switch (addAddressFieldsType) {
      case AddAddressFieldsTypes.EMAIL:
        {
          return _getEmailTextField();
        }
      case AddAddressFieldsTypes.MOBILE:
        {
          return _getMobileTextField();
        }
      //case AddAddressFieldsTypes.COUNTRY:
      case AddAddressFieldsTypes.CITY:
        {
          return _getDropDownTextField();
        }
      default:
        {
          return InputTextField(
            label: addAddressFieldsType.name.toLowerCase(),
            inputController:
                _getInputController(addAddressBloc, addAddressFieldsType),
            onChanged: (val) {
              addAddressBloc.add(OnTextChange(
                  str: val,
                  addAddressFieldsType: addAddressFieldsType,
                  textEditingController: _getInputController(
                      addAddressBloc, addAddressFieldsType)));
            },
          );
        }
    }
  }

  TextEditingController _getInputController(AddAddressBloc addAddressBloc,
      AddAddressFieldsTypes addAddressFieldsType) {
    switch (addAddressFieldsType) {
      case AddAddressFieldsTypes.NAME:
        {
          return addAddressBloc.nameController;
        }
      case AddAddressFieldsTypes.EMAIL:
        {
          return addAddressBloc.emailController;
        }
      case AddAddressFieldsTypes.ADDRESS:
        {
          return addAddressBloc.addressController;
        }
      case AddAddressFieldsTypes.MOBILE:
        {
          return TextEditingController();
        }
      case AddAddressFieldsTypes.DISTRICT:
        {
          return addAddressBloc.districtController;
        }
      case AddAddressFieldsTypes.CITY:
        {
          return addAddressBloc.cityController;
        }
      // case AddAddressFieldsTypes.COUNTRY:
      //   {
      //     return addAddressBloc.countryController;
      //   }
    }
  }

  Widget _getEmailTextField() {
    return EmailTextField(
      emailController:
          _getInputController(addAddressBloc, addAddressFieldsType),
      onChanged: (val) {
        addAddressBloc.add(OnTextChange(
            str: val,
            addAddressFieldsType: AddAddressFieldsTypes.EMAIL,
            textEditingController:
                _getInputController(addAddressBloc, addAddressFieldsType)));
      },
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
            LabelTxt(txt: addAddressFieldsType.name.tr()),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Directionality(
          textDirection: ui.TextDirection.ltr,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: PhoneTextField(
              phoneNumController:
                  _getInputController(addAddressBloc, addAddressFieldsType),
              onInputChanged: (PhoneNumber phoneNumber) {
                log("dialCode: ${phoneNumber.dialCode} - isoCode: ${phoneNumber.isoCode} - phoneNumber: ${phoneNumber.phoneNumber}",
                    name: "onInputChanged --->");
                log("${phoneNumber.phoneNumber}",
                    name: "PhoneTextField onInputChanged ->");
                addAddressBloc.add(OnTextChange(
                    phoneNumber: phoneNumber,
                    addAddressFieldsType: AddAddressFieldsTypes.MOBILE,
                    textEditingController: _getInputController(
                        addAddressBloc, addAddressFieldsType)));
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _getDropDownTextField() {
    return DropDownTextField<CityEntity>(
      label: addAddressFieldsType.name.toLowerCase(),
      inputController: TextEditingController(
          text: addAddressBloc.selectedCityEntity != null
              ? (Localization.isEnglish()
                  ? addAddressBloc.selectedCityEntity!.nameEn
                  : addAddressBloc.selectedCityEntity!.nameAr)
              : ""),
      onSelected: (val) {
        addAddressBloc.add(OnItemSelectedFromDropDown<CityEntity>(
          addAddressFieldsType: addAddressFieldsType,
          item: val,
        ));
      },
      items: List.generate(addAddressBloc.cityEntityList.length, (index) {
        final CityEntity city = addAddressBloc.cityEntityList[index];
        return city;
      }),
      getItemName: (val) {
        return Localization.isEnglish() ? val.nameEn : val.nameAr;
      },
      getIsSelectedItem: (val) {
        return val == addAddressBloc.selectedCityEntity;
      },
    );
  }
}
