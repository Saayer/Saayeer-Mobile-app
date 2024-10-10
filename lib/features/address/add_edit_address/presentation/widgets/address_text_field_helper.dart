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
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_edit_address/presentation/bloc/add_edit_address_bloc.dart';
import 'dart:ui' as ui;

class AddressTextFieldHelper {
  final AddEditAddressBloc addAddressBloc;
  final AddAddressFieldsTypes addAddressFieldsType;

  AddressTextFieldHelper({
    required this.addAddressBloc,
    required this.addAddressFieldsType,
  });

  //
  Widget getTextField(
      {required GlobalKey<State<StatefulWidget>> zipCodeKey, required GlobalKey<State<StatefulWidget>> addressKey}) {
    switch (addAddressFieldsType) {
      case AddAddressFieldsTypes.NAME:
        {
          return _getFullNameTextField();
        }
      case AddAddressFieldsTypes.MOBILE:
        {
          return _getMobileTextField();
        }
      case AddAddressFieldsTypes.ALTERNATIVE_MOBILE:
        {
          return _getSecondMobileTextField();
        }
      case AddAddressFieldsTypes.EMAIL:
        {
          return _getEmailTextField();
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
      case AddAddressFieldsTypes.ADDRESS:
        {
          return _getAddressTextField(addressKey);
        }
      case AddAddressFieldsTypes.ZIPCODE:
        {
          return _getZipCodeTextField(zipCodeKey);
        }
    }
  }

  /// auto scroll the bottom textFields on focused to be visible when keyboard display
  Future<void> ensureVisibleOnTextArea({required GlobalKey textFieldKey}) async {
    final keyContext = textFieldKey.currentContext;
    if (keyContext != null) {
      await Future.delayed(const Duration(milliseconds: 500)).then(
        (value) => Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        ),
      );
    }
  }

  TextEditingController _getInputController(
      AddEditAddressBloc addAddressBloc, AddAddressFieldsTypes addAddressFieldsType) {
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
          return addAddressBloc.mobileController;
        }
      case AddAddressFieldsTypes.ALTERNATIVE_MOBILE:
        {
          return addAddressBloc.alternativeMobileController;
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
            LabelTxt(txt: '${addAddressFieldsType.name.tr()} *'),
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
      isFieldRequired: true,
      onSelected: (val) {
        addAddressBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
          addAddressFieldsType: addAddressFieldsType,
          item: val,
        ));
      },
      addAddressFieldsType: addAddressFieldsType,
      selectedItem: addAddressBloc.selectedCity,
    );
  }

  Widget _getCountryTextField() {
    return ItemsDropDownTextField(
      bloc: addAddressBloc,
      isFieldRequired: true,
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
      isFieldRequired: true,
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
              //initialValue: addAddressBloc.alternativeMobile,
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

  Widget _getAddressTextField(GlobalKey<State<StatefulWidget>> addressKey) {
    return InputTextField(
      key: addressKey,
      label: addAddressFieldsType.name,
      isFieldRequired: true,
      withValidator: true,
      inputController: _getInputController(addAddressBloc, addAddressFieldsType),
      maxLength: 250,
      keyboardType: TextInputType.text,
      onChanged: (val) {},
      onTap: () {
        ensureVisibleOnTextArea(textFieldKey: addressKey);
      },
    );
  }

  Widget _getZipCodeTextField(GlobalKey<State<StatefulWidget>> zipCodeKey) {
    return InputTextField(
      key: zipCodeKey,
      label: addAddressFieldsType.name,
      isFieldRequired: false,
      withValidator: false,
      inputController: _getInputController(addAddressBloc, addAddressFieldsType),
      maxLength: null,
      keyboardType: TextInputType.number,
      onChanged: (val) {},
      onTap: () {
        ensureVisibleOnTextArea(textFieldKey: zipCodeKey);
      },
    );
  }

  Widget _getFullNameTextField() {
    return InputTextField(
      withValidator: true,
      isFieldRequired: true,
      label: addAddressFieldsType.name,
      inputController: _getInputController(addAddressBloc, addAddressFieldsType),
      keyboardType: TextInputType.text,
      onChanged: (val) {},
    );
  }
}
