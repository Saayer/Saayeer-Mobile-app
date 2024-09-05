import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/address_widgets/presentation/widgets/items_drop_down_text_field.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/presentation/bloc/add_edit_store_bloc.dart';
import 'dart:ui' as ui;

class StoreInfoTextFieldHelper {
  final AddEditStoreBloc addEditStoreBloc;
  final StoreInfoFieldsTypes storeInfoFieldsType;

  StoreInfoTextFieldHelper({
    required this.addEditStoreBloc,
    required this.storeInfoFieldsType,
  });

  Widget getTextField(
      {required GlobalKey<State<StatefulWidget>> zipCodeKey,
      required GlobalKey<State<StatefulWidget>> addressKey,
      required GlobalKey<State<StatefulWidget>> financialNoKey,
      required GlobalKey<State<StatefulWidget>> freelanceNoKey}) {
    switch (storeInfoFieldsType) {
      case StoreInfoFieldsTypes.NAME:
        {
          return _getFullNameTextField();
        }
      case StoreInfoFieldsTypes.PHONE:
        {
          return _getPhoneNumTextField();
        }
      case StoreInfoFieldsTypes.COUNTRY:
        {
          return _getCountryTextField();
        }
      case StoreInfoFieldsTypes.GOVERNORATE:
        {
          return _getGovernorateTextField();
        }
      case StoreInfoFieldsTypes.CITY:
        {
          return _getCityTextField();
        }
      case StoreInfoFieldsTypes.AREA:
        {
          return _getAreaTextField();
        }
      case StoreInfoFieldsTypes.ADDRESS:
        {
          return _getAddressTextField(addressKey);
        }
      case StoreInfoFieldsTypes.ZIPCODE:
        {
          return _getZipCodeTextField(zipCodeKey);
        }
      case StoreInfoFieldsTypes.FINANCIAL_RECORD_NUMBER:
        {
          return _getFinancialRecordNoTextField(financialNoKey);
        }
      case StoreInfoFieldsTypes.FREELANCE_CERTIFICATE_NUMBER:
        {
          return _getFreelanceCertificateNoTextField(freelanceNoKey);
        }
    }
  }

  TextEditingController _getInputController() {
    switch (storeInfoFieldsType) {
      case StoreInfoFieldsTypes.NAME:
        {
          return addEditStoreBloc.nameController;
        }
      case StoreInfoFieldsTypes.PHONE:
        {
          return addEditStoreBloc.mobileController;
        }
      case StoreInfoFieldsTypes.COUNTRY:
        {
          return addEditStoreBloc.countryController;
        }
      case StoreInfoFieldsTypes.GOVERNORATE:
        {
          return addEditStoreBloc.governorateController;
        }
      case StoreInfoFieldsTypes.CITY:
        {
          return addEditStoreBloc.cityController;
        }
      case StoreInfoFieldsTypes.AREA:
        {
          return addEditStoreBloc.areaController;
        }
      case StoreInfoFieldsTypes.ADDRESS:
        {
          return addEditStoreBloc.addressController;
        }
      case StoreInfoFieldsTypes.ZIPCODE:
        {
          return addEditStoreBloc.zipCodeController;
        }
      case StoreInfoFieldsTypes.FINANCIAL_RECORD_NUMBER:
        {
          return addEditStoreBloc.financialRecordNoController;
        }
      case StoreInfoFieldsTypes.FREELANCE_CERTIFICATE_NUMBER:
        {
          return addEditStoreBloc.freelanceCertificateNoController;
        }
    }
  }

  Widget _getFullNameTextField() {
    return InputTextField(
      withValidator: true,
      isFieldRequired: true,
      label: storeInfoFieldsType.name,
      inputController: _getInputController(),
      keyboardType: TextInputType.text,
      onChanged: (val) {},
    );
  }

  Widget _getCountryTextField() {
    return ItemsDropDownTextField(
      bloc: addEditStoreBloc,
      isFieldRequired: true,
      onSelected: (val) {
        addEditStoreBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
          storeInfoFieldsType: storeInfoFieldsType,
          item: val,
        ));

        ///
        addEditStoreBloc.add(const GetGovernorates());
      },
      addAddressFieldsType: AddAddressFieldsTypes.COUNTRY,
      selectedItem: addEditStoreBloc.selectedCountry,
    );
  }

  Widget _getGovernorateTextField() {
    return ItemsDropDownTextField(
      bloc: addEditStoreBloc,
      isFieldRequired: true,
      onSelected: (val) {
        addEditStoreBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
          storeInfoFieldsType: storeInfoFieldsType,
          item: val,
        ));

        ///
        addEditStoreBloc.add(const GetCities());
      },
      addAddressFieldsType: AddAddressFieldsTypes.GOVERNORATE,
      selectedItem: addEditStoreBloc.selectedGovernorate,
    );
  }

  Widget _getCityTextField() {
    return ItemsDropDownTextField(
      bloc: addEditStoreBloc,
      isFieldRequired: true,
      onSelected: (val) {
        addEditStoreBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
          storeInfoFieldsType: storeInfoFieldsType,
          item: val,
        ));

        ///
        addEditStoreBloc.add(const GetAreas());
      },
      addAddressFieldsType: AddAddressFieldsTypes.CITY,
      selectedItem: addEditStoreBloc.selectedCity,
    );
  }

  Widget _getAreaTextField() {
    return ItemsDropDownTextField(
      bloc: addEditStoreBloc,
      isFieldRequired: true,
      onSelected: (val) {
        addEditStoreBloc.add(OnItemSelectedFromDropDown<AddressLookUpDto>(
          storeInfoFieldsType: storeInfoFieldsType,
          item: val,
        ));
      },
      addAddressFieldsType: AddAddressFieldsTypes.AREA,
      selectedItem: addEditStoreBloc.selectedArea,
    );
  }

  Widget _getAddressTextField(GlobalKey<State<StatefulWidget>> addressKey) {
    return InputTextField(
      key: addressKey,
      label: storeInfoFieldsType.name,
      isFieldRequired: true,
      withValidator: true,
      inputController: _getInputController(),
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
      label: storeInfoFieldsType.name,
      isFieldRequired: false,
      withValidator: false,
      inputController: _getInputController(),
      maxLength: null,
      keyboardType: TextInputType.number,
      onChanged: (val) {},
      onTap: () {
        ensureVisibleOnTextArea(textFieldKey: zipCodeKey);
      },
    );
  }

  Widget _getFinancialRecordNoTextField(GlobalKey<State<StatefulWidget>> financialNoKey) {
    return InputTextField(
      key: financialNoKey,
      label: storeInfoFieldsType.name,
      isFieldRequired: false,
      withValidator: false,
      inputController: _getInputController(),
      maxLength: null,
      keyboardType: TextInputType.number,
      onChanged: (val) {},
      onTap: () {
        ensureVisibleOnTextArea(textFieldKey: financialNoKey);
      },
    );
  }

  Widget _getFreelanceCertificateNoTextField(GlobalKey<State<StatefulWidget>> freelanceNoKey) {
    return InputTextField(
      key: freelanceNoKey,
      label: storeInfoFieldsType.name,
      isFieldRequired: false,
      withValidator: false,
      inputController: _getInputController(),
      maxLength: null,
      keyboardType: TextInputType.number,
      onChanged: (val) {},
      onTap: () {
        ensureVisibleOnTextArea(textFieldKey: freelanceNoKey);
      },
    );
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

  Widget _getPhoneNumTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LabelTxt(txt: '${storeInfoFieldsType.name.tr()} *'),
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
              phoneNumController: _getInputController(),
              onInputChanged: (PhoneNumber phoneNumber) {
                log("dialCode: ${phoneNumber.dialCode} - isoCode: ${phoneNumber.isoCode} - phoneNumber: ${phoneNumber.phoneNumber}",
                    name: "onInputChanged --->");
                log("${phoneNumber.phoneNumber}", name: "PhoneTextField onInputChanged ->");
                addEditStoreBloc.add(OnTextChange(
                    phoneNumber: phoneNumber,
                    storeInfoFieldsType: StoreInfoFieldsTypes.PHONE,
                    textEditingController: _getInputController()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
