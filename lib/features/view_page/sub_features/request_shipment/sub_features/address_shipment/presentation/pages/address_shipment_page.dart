import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/data/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/presentation/bloc/address_shipment_bloc.dart';

class AddressShipmentPage extends StatefulWidget {
  const AddressShipmentPage({super.key});

  @override
  State<AddressShipmentPage> createState() => _AddressShipmentPageState();
}

class _AddressShipmentPageState extends State<AddressShipmentPage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final AddressShipmentBloc addressShipmentBloc =
        BlocProvider.of<AddressShipmentBloc>(context);

    return BlocConsumer<AddressShipmentBloc, AddressShipmentState>(
      // buildWhen: (previousState, nextState) =>
      // (previousState.stateHelper.requestState !=
      //     nextState.stateHelper.requestState),
      listener: (context, state) async {
        // final bool isLoading =
        // (personalInfoBloc.state.stateHelper.requestState ==
        //     RequestState.LOADING);
        // LoadingDialog.setIsLoading(context, isLoading);
        // if (!isLoading) {
        //   if (state.stateHelper.requestState == RequestState.SUCCESS) {
        //     getIt<UserInfoViewPageBloc>().add(GoToNextPageEvent());
        //   }
        //   if (state.stateHelper.requestState == RequestState.ERROR) {
        //     //showToast(msg: state.stateHelper.errorMessage ?? "");
        //     PersonalInfoErrorHandler(state: state)();
        //   }
        //  }
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
                isEnabled: true,
                //enablePersonalInfo(personalInfoBloc),
                borderRadius: 16.r,
                onPressed: () {
                  // final bool isFormValid =
                  // (personalInfoBloc.formKey.currentState!.validate());
                  // personalInfoBloc.add(ToggleAutoValidate());
                  // isFormValid
                  //     ? personalInfoBloc.add(SubmitPersonalInfoData())
                  //     : SaayerToast()
                  //     .showErrorToast(msg: "empty_fields_error".tr());
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
                    // autovalidateMode: state.autoValidateMode,
                    // key: personalInfoBloc.formKey,
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
                                "Shipment Address".tr(),
                                textAlign: TextAlign.start,
                                style: AppTextStyles.sectionTitle(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ...(AddressShipmentsFieldsTypes.values.map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 10.h),
                            child: _getTextField(addressShipmentBloc, e),
                          );
                        }).toList()),
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

  Widget _getTextField(AddressShipmentBloc addressShipmentBloc,
      AddressShipmentsFieldsTypes addressShipmentsFieldsType) {
    switch (addressShipmentsFieldsType) {
      case AddressShipmentsFieldsTypes.MOBILE_NUMBER:
        {
          return PhoneTextField(
            phoneNumController:
            _getInputController(addressShipmentBloc, addressShipmentsFieldsType),
            onInputChanged: (val) {
              // personalInfoBloc.add(OnTextChange(
              //     str: val,
              //     personalInfoFieldsType: PersonalInfoFieldsTypes.EMAIL,
              //     textEditingController: _getInputController(
              //         personalInfoBloc, personalInfoFieldsType)));
            },
          );
        }
      default:
        {
          return InputTextField(
            label: addressShipmentsFieldsType.name.toLowerCase(),
            inputController:
            _getInputController(addressShipmentBloc, addressShipmentsFieldsType),
            onChanged: (val) {
              // personalInfoBloc.add(OnTextChange(
              //     str: val,
              //     personalInfoFieldsType: personalInfoFieldsType,
              //     textEditingController: _getInputController(
              //         personalInfoBloc, personalInfoFieldsType)));
            },
          );
        }
    }
  }

  TextEditingController _getInputController(AddressShipmentBloc addressShipmentBloc,
      AddressShipmentsFieldsTypes addressShipmentsFieldsType) {
    switch (addressShipmentsFieldsType) {
      case AddressShipmentsFieldsTypes.SELECT_ADDRESS:
        {
          return addressShipmentBloc.selectAddressController;
        }
      case AddressShipmentsFieldsTypes.SELECT_CITY:
        {
          return addressShipmentBloc.selectCityController;
        }
      case AddressShipmentsFieldsTypes.SELECT_DISTRICT:
        {
          return addressShipmentBloc.selectDistrictController;
        }
      case AddressShipmentsFieldsTypes.MOBILE_NUMBER:
        {
          return addressShipmentBloc.mobileNumberController;
        }
      case AddressShipmentsFieldsTypes.CLIENT_NAME:
        {
          return addressShipmentBloc.clientNameController;
        }
      case AddressShipmentsFieldsTypes.SHORT_ADDRESS:
        {
          return addressShipmentBloc.shortAddressController;
        }
    }
  }

  bool enablePersonalInfo(AddressShipmentBloc addressShipmentBloc) {
    log("${addressShipmentBloc.addressShipmentsFieldsValidMap}",
        name: "enablePersonalInfo --->");
    if (addressShipmentBloc.addressShipmentsFieldsValidMap.values.length ==
        AddressShipmentsFieldsTypes.values.length) {
      return addressShipmentBloc.addressShipmentsFieldsValidMap.values
          .every((element) => element == true);
    }
    return false;
  }

}
