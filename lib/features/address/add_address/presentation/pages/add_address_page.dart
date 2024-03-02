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
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/features/address/add_address/core/errors/add_address_error_handler.dart';
import 'package:saayer/features/address/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart';
import 'dart:ui' as ui;

import 'package:saayer/features/address/add_address/presentation/widgets/address_text_field_helper.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final AddAddressBloc addAddressBloc =
        BlocProvider.of<AddAddressBloc>(context);
    return BlocConsumer<AddAddressBloc, AddAddressState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading =
            (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            Navigator.pop(context);
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            //showToast(msg: state.stateHelper.errorMessage ?? "");
            AddAddressErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) => PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          appBar: BaseAppBar(
            title: "add_address".tr(),
            showBackLeading: true,
          ),
          bottomSheet: Container(
            width: width,
            color: SaayerTheme().getColorsPalette.backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 50.h, left: 16.w, right: 16.w, top: 20.h),
              child: SaayerDefaultTextButton(
                text: "confirm",
                isEnabled: enableAddress(addAddressBloc),
                borderRadius: 16.r,
                onPressed: () {
                  final bool isFormValid =
                      (addAddressBloc.formKey.currentState!.validate());
                  addAddressBloc.add(ToggleAutoValidate());
                  isFormValid
                      ? addAddressBloc.add(SubmitAddressData())
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
                    key: addAddressBloc.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "personal_info".tr(),
                        //         textAlign: TextAlign.start,
                        //         style: AppTextStyles.sectionTitle(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        ...(AddAddressFieldsTypes.values.map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 10.h),
                            child: _getTextField(addAddressBloc, e),
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

  Widget _getTextField(AddAddressBloc addAddressBloc,
      AddAddressFieldsTypes addAddressFieldsType) {
    return AddressTextFieldHelper(
            addAddressBloc: addAddressBloc,
            addAddressFieldsType: addAddressFieldsType)
        .getTextField();
  }

  bool enableAddress(AddAddressBloc addAddressBloc) {
    log("${addAddressBloc.addAddressFieldsValidMap}",
        name: "enableAddress --->");
    if (addAddressBloc.addAddressFieldsValidMap.values.length ==
        AddAddressFieldsTypes.values.length) {
      return addAddressBloc.addAddressFieldsValidMap.values
          .every((element) => element == true);
    }
    return false;
  }
}
