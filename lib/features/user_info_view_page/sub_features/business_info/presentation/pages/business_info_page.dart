import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/core/errors/business_info_error_handler.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/core/utils/enums/enums.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/core/utils/enums/enums.dart';
import 'dart:ui' as ui;

class BusinessInfoPage extends StatelessWidget {
  const BusinessInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final BusinessInfoBloc businessInfoBloc =
        BlocProvider.of<BusinessInfoBloc>(context);

    return BlocConsumer<BusinessInfoBloc, BusinessInfoState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading =
            (businessInfoBloc.state.stateHelper.requestState ==
                RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            getIt<UserInfoViewPageBloc>().add(GoToNextPageEvent());
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            //showToast(msg: state.stateHelper.errorMessage ?? "");
            BusinessInfoErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) => PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          bottomSheet: Container(
            width: width,
            color: SaayerTheme().getColorsPalette.backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 50.h, left: 16.w, right: 16.w, top: 20.h),
              child: SaayerDefaultTextButton(
                text: "next",
                isEnabled: enableBusinessInfo(businessInfoBloc),
                borderRadius: 16.r,
                onPressed: () {
                  final bool isFormValid =
                      (businessInfoBloc.formKey.currentState!.validate());
                  isFormValid
                      ? businessInfoBloc.add(SubmitBusinessInfoData())
                      : SaayerToast()
                          .showErrorToast(msg: "empty_fields_error".tr());
                },
                btnWidth: width / 1.2,
                btnHeight: 50.h,
              ),
            ),
          ),
          body: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: SaayerTheme().getColorsPalette.backgroundColor,
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    autovalidateMode: state.autoValidateMode,
                    key: businessInfoBloc.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "business_info".tr(),
                                textAlign: TextAlign.start,
                                style: AppTextStyles.sectionTitle(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ...(BusinessInfoFieldsTypes.values
                            .map((e) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.h),
                                  child: _getTextField(businessInfoBloc, e),
                                ))
                            .toList()),
                        SizedBox(
                          height: 150.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getTextField(BusinessInfoBloc businessInfoBloc,
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

  bool enableBusinessInfo(BusinessInfoBloc businessInfoBloc) {
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
