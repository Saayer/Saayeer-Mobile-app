import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/address_widgets/presentation/widgets/items_drop_down_text_field.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/features/address/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart';
import 'dart:ui' as ui;

class AddressTextFieldHelper {
  final AddAddressBloc addAddressBloc;
  final AddAddressFieldsTypes addAddressFieldsType;

  AddressTextFieldHelper({
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
      case AddAddressFieldsTypes.ALTERNATIVE_MOBILE:
        {
          return _getSecondMobileTextField();
        }
      case AddAddressFieldsTypes.COUNTRY:
        {
          return _getCountryTextField();
        }
      case AddAddressFieldsTypes.GOVERNORATE:
        {
          return _getGovernorateTextField();
        }
      case AddAddressFieldsTypes.CITY:
        {
          return _getCityTextField();
        }
      case AddAddressFieldsTypes.AREA:
        {
          return _getAreaTextField();
        }
      default:
        {
          return InputTextField(
            label: addAddressFieldsType.name.toLowerCase(),
            inputController: _getInputController(addAddressBloc, addAddressFieldsType),
            keyboardType: TextInputType.text,
            onChanged: (val) {
              // addAddressBloc.add(OnTextChange(
              //     str: val,
              //     addAddressFieldsType: addAddressFieldsType,
              //     textEditingController: _getInputController(addAddressBloc, addAddressFieldsType)));
            },
          );
        }
    }
  }

  TextEditingController _getInputController(AddAddressBloc addAddressBloc, AddAddressFieldsTypes addAddressFieldsType) {
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
      case AddAddressFieldsTypes.ALTERNATIVE_MOBILE:
        {
          return TextEditingController();
        }
      case AddAddressFieldsTypes.AREA:
        {
          return addAddressBloc.districtController;
        }
      case AddAddressFieldsTypes.CITY:
        {
          return addAddressBloc.cityController;
        }
      case AddAddressFieldsTypes.COUNTRY:
        {
          return addAddressBloc.countryController;
        }
      case AddAddressFieldsTypes.GOVERNORATE:
        {
          return addAddressBloc.governorateController;
        }
      case AddAddressFieldsTypes.ZIPCODE:
        {
          return addAddressBloc.zipCodeController;
        }
    }
  }

  Widget _getEmailTextField() {
    return EmailTextField(
      emailController: _getInputController(addAddressBloc, addAddressFieldsType),
      onChanged: (val) {
        // addAddressBloc.add(OnTextChange(
        //     str: val,
        //     addAddressFieldsType: AddAddressFieldsTypes.EMAIL,
        //     textEditingController: _getInputController(addAddressBloc, addAddressFieldsType)));
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
        const SizedBox(
          height: 5,
        ),
        Directionality(
          textDirection: ui.TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PhoneTextField(
              phoneNumController: _getInputController(addAddressBloc, addAddressFieldsType),
              onInputChanged: (PhoneNumber phoneNumber) {
                log("dialCode: ${phoneNumber.dialCode} - isoCode: ${phoneNumber.isoCode} - phoneNumber: ${phoneNumber.phoneNumber}",
                    name: "onInputChanged --->");
                log("${phoneNumber.phoneNumber}", name: "PhoneTextField onInputChanged ->");
                addAddressBloc.add(OnTextChange(
                    phoneNumber: phoneNumber,
                    addAddressFieldsType: AddAddressFieldsTypes.MOBILE,
                    textEditingController: _getInputController(addAddressBloc, addAddressFieldsType)));
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _getCityTextField() {
    return ItemsDropDownTextField(
      bloc: addAddressBloc,
      onSelected: (val) {
        addAddressBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
          addAddressFieldsType: addAddressFieldsType,
          item: val,
        ));

        ///
        addAddressBloc.add(const GetAreas());
      },
      addAddressFieldsType: addAddressFieldsType,
      selectedItem: addAddressBloc.selectedCity,
    );
  }

  Widget _getCountryTextField() {
    return ItemsDropDownTextField(
      bloc: addAddressBloc,
      onSelected: (val) {
        addAddressBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
          addAddressFieldsType: addAddressFieldsType,
          item: val,
        ));

        ///
        addAddressBloc.add(const GetGovernorates());
      },
      addAddressFieldsType: addAddressFieldsType,
      selectedItem: addAddressBloc.selectedCountry,
    );
  }

  Widget _getGovernorateTextField() {
    return ItemsDropDownTextField(
      bloc: addAddressBloc,
      onSelected: (val) {
        addAddressBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
          addAddressFieldsType: addAddressFieldsType,
          item: val,
        ));

        ///
        addAddressBloc.add(const GetCities());
      },
      addAddressFieldsType: addAddressFieldsType,
      selectedItem: addAddressBloc.selectedGovernorate,
    );
  }

  Widget _getAreaTextField() {
    return ItemsDropDownTextField(
      bloc: addAddressBloc,
      onSelected: (val) {
        addAddressBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
          addAddressFieldsType: addAddressFieldsType,
          item: val,
        ));
      },
      addAddressFieldsType: addAddressFieldsType,
      selectedItem: addAddressBloc.selectedArea,
    );
  }

  Widget _getSecondMobileTextField() {
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
        const SizedBox(
          height: 5,
        ),
        Directionality(
          textDirection: ui.TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PhoneTextField(
              phoneNumController: _getInputController(addAddressBloc, addAddressFieldsType),
              withValidator: false,
              onInputChanged: (PhoneNumber phoneNumber) {
                log("dialCode: ${phoneNumber.dialCode} - isoCode: ${phoneNumber.isoCode} - phoneNumber: ${phoneNumber.phoneNumber}",
                    name: "onInputChanged --->");
                log("${phoneNumber.phoneNumber}", name: "PhoneTextField onInputChanged ->");
                addAddressBloc.add(OnTextChange(
                    alternativePhoneNumber: phoneNumber,
                    addAddressFieldsType: AddAddressFieldsTypes.ALTERNATIVE_MOBILE,
                    textEditingController: _getInputController(addAddressBloc, addAddressFieldsType)));
              },
            ),
          ),
        ),
      ],
    );
  }
}
