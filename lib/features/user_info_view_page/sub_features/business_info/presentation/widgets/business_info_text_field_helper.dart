import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/core/utils/enums/enums.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart';
import 'dart:ui' as ui;

class BusinessInfoTextFieldHelper {
  Widget getTextField(BusinessInfoBloc businessInfoBloc,
      BusinessInfoFieldsTypes businessInfoFieldsType) {
    switch (businessInfoFieldsType) {
      case BusinessInfoFieldsTypes.EMAIL:
        {
          return EmailTextField(
            emailController:
                _getInputController(businessInfoBloc, businessInfoFieldsType),
            onChanged: (val) {
              businessInfoBloc.add(OnTextChange(
                  str: val,
                  businessInfoFieldsType: BusinessInfoFieldsTypes.EMAIL,
                  textEditingController: _getInputController(
                      businessInfoBloc, businessInfoFieldsType)));
            },
          );
        }
      case BusinessInfoFieldsTypes.MOBILE_NUMBER:
        {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LabelTxt(txt: businessInfoFieldsType.name.tr()),
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
                    phoneNumController: _getInputController(
                        businessInfoBloc, businessInfoFieldsType),
                    onInputChanged: (PhoneNumber phoneNumber) {
                      log("dialCode: ${phoneNumber.dialCode} - isoCode: ${phoneNumber.isoCode} - phoneNumber: ${phoneNumber.phoneNumber}",
                          name: "onInputChanged --->");
                      log("${phoneNumber.phoneNumber}",
                          name: "PhoneTextField onInputChanged ->");
                      businessInfoBloc.add(OnTextChange(
                          phoneNumber: phoneNumber,
                          businessInfoFieldsType:
                              BusinessInfoFieldsTypes.MOBILE_NUMBER,
                          textEditingController: _getInputController(
                              businessInfoBloc, businessInfoFieldsType)));
                    },
                  ),
                ),
              ),
            ],
          );
        }
      default:
        {
          return InputTextField(
            label: businessInfoFieldsType.name.toLowerCase(),
            inputController:
                _getInputController(businessInfoBloc, businessInfoFieldsType),
            onChanged: (val) {
              businessInfoBloc.add(OnTextChange(
                  str: val,
                  businessInfoFieldsType: businessInfoFieldsType,
                  textEditingController: _getInputController(
                      businessInfoBloc, businessInfoFieldsType)));
            },
          );
        }
    }
  }

  TextEditingController _getInputController(BusinessInfoBloc businessInfoBloc,
      BusinessInfoFieldsTypes businessInfoFieldsType) {
    switch (businessInfoFieldsType) {
      case BusinessInfoFieldsTypes.COMPANY_NAME:
        {
          return businessInfoBloc.companyNameController;
        }
      case BusinessInfoFieldsTypes.EMAIL:
        {
          return businessInfoBloc.emailController;
        }
      case BusinessInfoFieldsTypes.MOBILE_NUMBER:
        {
          return businessInfoBloc.mobileNumberController;
        }
      case BusinessInfoFieldsTypes.COMMERCIAL_REGISTERATION_NO:
        {
          return businessInfoBloc.commercialRegistrationNoController;
        }
      case BusinessInfoFieldsTypes.SHORT_ADDRESS:
        {
          return businessInfoBloc.shortAddressController;
        }
      case BusinessInfoFieldsTypes.DISTRICT:
        {
          return businessInfoBloc.districtController;
        }
      case BusinessInfoFieldsTypes.GOVERNORATE:
        {
          return businessInfoBloc.governorateController;
        }
    }
  }

  static bool enableBusinessInfo(BusinessInfoBloc businessInfoBloc) {
    log("${businessInfoBloc.businessInfoFieldsValidMap}",
        name: "enablePersonalInfo --->");
    if (businessInfoBloc.businessInfoFieldsValidMap.values.length ==
        BusinessInfoFieldsTypes.values.length) {
      return businessInfoBloc.businessInfoFieldsValidMap.values
          .every((element) => element == true);
    }
    return false;
  }
}
